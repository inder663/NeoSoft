//
// Copyright © 2024 .
// All Rights Reserved.

import Foundation

// Model to represent an individual item in the carousel
struct CarouselItem {
    let image: String  // Name or URL of the image associated with the item
    let title: String  // Title of the item
    let detail: String // Detailed description of the item
}

// Extension to provide dummy data sets for testing CarouselItems
extension CarouselItem {
    // Dummy data set representing fruit items
    static let carouselItems = [
        CarouselItem(image: "image1", title: "Apple", detail: "Detail for Apple"),
        CarouselItem(image: "image2", title: "Banana", detail: "Detail for Banana"),
        CarouselItem(image: "image3", title: "Grapes", detail: "Detail for Grapes"),
        CarouselItem(image: "image4", title: "Orange", detail: "Detail for Orange"),
        CarouselItem(image: "image5", title: "Mango", detail: "Detail for Mango"),
        // Repeated items for testing carousel looping, etc.
        CarouselItem(image: "image3", title: "Grapes", detail: "Detail for Grapes"),
        CarouselItem(image: "image4", title: "Orange", detail: "Detail for Orange"),
        CarouselItem(image: "image5", title: "Mango", detail: "Detail for Mango")
    ]

    // Dummy data set representing vehicle items
    static let carouselItems1 = [
        CarouselItem(image: "image1", title: "Car", detail: "Detail for Car"),
        CarouselItem(image: "image2", title: "Bike", detail: "Detail for Bike"),
        CarouselItem(image: "image3", title: "Plane", detail: "Detail for Plane"),
        CarouselItem(image: "image4", title: "Train", detail: "Detail for Train"),
        CarouselItem(image: "image5", title: "Boat", detail: "Detail for Boat"),
        // Repeated items for testing carousel looping, etc.
        CarouselItem(image: "image3", title: "Plane", detail: "Detail for Plane"),
        CarouselItem(image: "image4", title: "Train", detail: "Detail for Train"),
        CarouselItem(image: "image5", title: "Boat", detail: "Detail for Boat")
    ]

    // Dummy data set representing animal items
    static let carouselItems2 = [
        CarouselItem(image: "image1", title: "Dog", detail: "Detail for Dog"),
        CarouselItem(image: "image2", title: "Cat", detail: "Detail for Cat"),
        CarouselItem(image: "image3", title: "Lion", detail: "Detail for Lion"),
        CarouselItem(image: "image4", title: "Elephant", detail: "Detail for Elephant"),
        CarouselItem(image: "image5", title: "Tiger", detail: "Detail for Tiger"),
        // Repeated items for testing carousel looping, etc.
        CarouselItem(image: "image3", title: "Lion", detail: "Detail for Lion"),
        CarouselItem(image: "image4", title: "Elephant", detail: "Detail for Elephant")
    ]
}
