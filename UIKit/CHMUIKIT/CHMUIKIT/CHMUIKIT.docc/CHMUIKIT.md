# ``CHMUIKIT``

Дизайн система проекта CakesHub

## Overview

Библеотека UI компонентов. Каждый компонент обладает своими конфигурациями (Например CHMImageView - это просто изображение из интернета. У него есть различные конфигурации: круг, квадрат, статик углы. Также плейсхолдер, если изображение не распарсилось и шиммер при прогрузки фото.)
Каждый компонент собирается из других компонентов. Т.е есть `атомы`, которые собираются в `молекулы`, молекулы в `организмы`. 
Пример атома - `CHMLabel`. Молекулы - `CHMImageView`. Организма - карточка товара с кучей разных атомов и молекул.

**Пример:**
```swift
let view = CHMImageView(
    configuration: .basic(
        .url(<url>, placeholder: .cake),
        imageKind: .static(20)
    )
)

let product = CHMProductCard(
    configuration: .basic(
        price: "110 $",
        seller: "Juster for Babies",
        description: "Самый крутой торт всея всех тортов",
        images: [
            .mockLoadingUrl,
            .mockCake1,
            .mockCake2,
            .mockCake3,
            .mockCake4,
            .invalidUrl,
        ]
    )
)
```

Есть 5 видов файло, при вёрстке компонента:
1. ComponentName - Сама вёрстка компонента
2. ComponentName+Configuration - Файл с конфигурациями компонентов, используемых для вёрстки ComponentName. Туда заносим различные размеры, Kind'ы, конфигурации компонентов, используемых в новом компоненте.
3. ComponentName+Default - Настройка дэфолтных конфигов (.basic) для компонентов. Передаём значения переменным в ComponentName+Configuration
4. ComponentName+HandlerConfiguration - Комплишен блоки, т.е функции, вызываемые при нажатии на наш компонент
5. ComponentName+Preview - Превью нового компонента для наглядности

### Компоненты либы:
- ``CHMAddingСakeView``
- ``CHMAvatarView``
- ``CHMBackgroundView``
- ``CHMButton``
- ``CHMCategoryView``
- ``CHMLabel``
- ``CHMProductCarouselView``
- ``CHMProductCard``
- ``CHMProfileTopView``
- ``CHMPlusButton``
- ``CHMImageView``
