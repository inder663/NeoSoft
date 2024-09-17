//
// Copyright © 2024.
// All Rights Reserved.
//

import Foundation

// Model to represent a Carousel with an array of images and items
struct CarouselModel {
    let images: [String]  // Array of image names or URLs for the carousel
    let items: [CarouselItem]  // Associated items in the carousel
}

// Extension to provide dummy data for testing purposes
extension CarouselModel {
    // Dummy data for CarouselModel instance with a predefined set of images and items
    static let dummy1 = CarouselModel(
        images: ["image1", "image2", "image3", "image4", "image5"],
        items: CarouselItem.carouselItems
    )

    // Another set of dummy data with a different image order
    static let dummy2 = CarouselModel(
        images: ["image3", "image4", "image2", "image1", "image5"],
        items: CarouselItem.carouselItems1
    )

    // A third set of dummy data for further testing
    static let dummy3 = CarouselModel(
        images: ["image2", "image1", "image3", "image4", "image5"],
        items: CarouselItem.carouselItems2
    )
}
