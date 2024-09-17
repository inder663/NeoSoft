//
// Copyright © 2024 .
// All Rights Reserved.


import UIKit

// Custom UICollectionViewCell to display an image
class ImageCollectionViewCell: UICollectionViewCell {

    // Outlet for the UIImageView in the cell
    @IBOutlet weak var imageView: UIImageView!

    // Configure the cell with an image name
    func set(image: String) {
        // Set the image for the UIImageView using the provided image name
        imageView.image = UIImage(named: image)
    }

}
