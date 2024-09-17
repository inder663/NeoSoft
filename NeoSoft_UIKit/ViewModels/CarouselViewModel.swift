//
// Copyright © 2024 .
// All Rights Reserved.

import Foundation

class CarouselViewModel {
    // Index of the currently selected model
    var selectedModelIndex: Int = 0 {
        didSet {
            // Reset search text when the selected model changes
            searchText = ""
        }
    }

    // Text used for searching items
    var searchText = ""

    // Computed property to get the currently selected model
    private var selectedModel: CarouselModel {
        return carouselModels[selectedModelIndex]
    }

    // Computed property to get images of the currently selected model
    var carouselImages: [String] {
        return selectedModel.images
    }

    // Array of carousel models
    private var carouselModels: [CarouselModel]

    // Initializer with optional delegate and default carousel models
    init(carouselModels: [CarouselModel] = [.dummy1, .dummy2, .dummy3, .dummy1, .dummy2]) {
        self.carouselModels = carouselModels
    }

    // Get a CarouselItem at a specific index
    func getItem(at index: Int) -> CarouselItem {
        let items = getItemsAtSelectedIndex()
        return items[index]
    }

    // Get all items at the currently selected index, optionally filtered by search text
    func getItemsAtSelectedIndex() -> [CarouselItem] {
        if searchText.isEmpty {
            return selectedModel.items
        } else {
            return selectedModel.items.filter { $0.title.contains(searchText) }
        }
    }

    // Calculate the occurrences of each character in the titles and details of items
    func calculateCharacterOccurrences() -> [Character: Int] {
        let items = getItemsAtSelectedIndex()
        var occurrences: [Character: Int] = [:]

        items.forEach { item in
            let combinedText = item.title
            for character in combinedText {
                if character != " " { // Skip spaces
                    occurrences[character, default: 0] += 1
                }
            }
        }

        return occurrences
    }
}
