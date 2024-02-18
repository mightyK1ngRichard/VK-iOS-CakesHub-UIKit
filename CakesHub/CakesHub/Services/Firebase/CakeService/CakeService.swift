//
//  CakeService.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 27.12.2023.
//

import Foundation
import Firebase
import FirebaseStorage

// MARK: - CakeServiceProtocol

protocol CakeServiceProtocol {
    func getCakesList(completion: @escaping CHMResultBlock<[CakeModel], APIError>)
}

// MARK: - CakeService

final class CakeService {

    static var shared = CakeService()
    private let firestore = Firestore.firestore()
    private let storage = Storage.storage()

    private init() {}
}

// MARK: - Methods

extension CakeService: CakeServiceProtocol {

    /// Getting a list of cakes
    /// - Parameter completion: plenty of cakes
    func getCakesList(completion: @escaping CHMResultBlock<[CakeModel], APIError>) {
        firestore.collection(FirestoreCollections.cakes.rawValue).getDocuments { querySnapshot, error in
            if let error {
                asyncMain { completion(.failure(.error(error))) }
                return
            }

            guard let documents = querySnapshot?.documents else {
                asyncMain { completion(.failure(.dataIsNil)) }
                return
            }

            let dispatchGroup = DispatchGroup()
            var cakesModel: [CakeModel] = []

            for document in documents {
                dispatchGroup.enter()

                document.mapperToCakeModel { result in
                    switch result {
                    case .success(let cakeModel):
                        asyncMain {
                            cakesModel.append(contentsOf: [cakeModel])
                        }
                    case .failure(let error):
                        print(error)
                    }
                    dispatchGroup.leave()
                }
            }

            dispatchGroup.notify(queue: .main) {
                completion(.success(cakesModel))
            }
        }
    }

    /// Cake creation
    /// - Parameters:
    ///   - userID: user document id
    ///   - cakeModel: cake info
    ///   - completion: creation result
    func createCake(userID: String, cakeModel: CakeModel, completion: @escaping (Error?) -> Void) {
        let dispatchGroup = DispatchGroup()

        var images: [String] = []
        switch cakeModel.images {
        case .image(let uiImages):
            uiImages.forEach { image in
                dispatchGroup.enter()
                createImage(
                    image: image,
                    directoryName: "cake/\(userID)/\(cakeModel.name ?? "unknown")",
                    imageName: generateUniqueFileName(userID: userID)
                ) { result in
                    switch result {
                    case .success(let url):
                        asyncMain {
                            images.append(url)
                        }
                        dispatchGroup.leave()
                    case .failure(let error):
                        print(error)
                        dispatchGroup.leave()
                    }
                }
            }
        case .url(let urls):
            images = urls.toStringArray
        }

        dispatchGroup.notify(queue: .main) {
            self.firestore
                .collection(FirestoreCollections.cakes.rawValue)
                .addDocument(
                    data: cakeModel.mapperToDictionaty(userID: userID, images: images),
                    completion: completion
                )
        }
    }

    /// Image creation
    /// - Parameters:
    ///   - image: image
    ///   - directoryName: name of directory
    ///   - imageName: image name
    ///   - completion: image url
    func createImage(
        image: UIImage?,
        directoryName: String,
        imageName: String,
        completion: @escaping CHMResultBlock<String, APIError>
    ) {
        guard let image else {
            completion(.failure(.badParameters))
            return
        }
        let storageRef = storage.reference().child("images/\(directoryName)/\(imageName).jpg")
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(.badParameters))
            return
        }
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error {
                asyncMain { completion(.failure(.error(error))) }
                return
            }
            guard !metadata.isNil else {
                asyncMain { completion(.failure(.dataIsNil)) }
                return
            }

            storageRef.downloadURL { url, error in
                if let error {
                    asyncMain { completion(.failure(.error(error))) }
                    return
                }

                if let imageUrl = url?.absoluteString {
                    asyncMain { completion(.success(imageUrl)) }
                }
            }
        }
    }
}

// MARK: - Helper

/// Generation unique name for cake image
/// - Parameter userID: seller uid
/// - Returns: file name
private func generateUniqueFileName(userID: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd_HHmmssSSS"

    let currentDateTime = Date()
    let formattedDate = dateFormatter.string(from: currentDateTime)

    let uniqueFileName = "photo_\(userID)_\(formattedDate)"

    return uniqueFileName
}
