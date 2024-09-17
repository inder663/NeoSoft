//
// Copyright © 2024 .
// All Rights Reserved.

import UIKit

// Custom UITableViewCell to display an item with an image, title, and detail
class ItemTableViewCell: UITableViewCell {

    // Outlets for UI elements in the cell
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDetailLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!

    // Called after the view has been loaded from the nib file
    override func awakeFromNib() {
        super.awakeFromNib()
        // Disable cell selection style to customize appearance
        selectionStyle = .none
    }

    // Configure the cell with a CarouselItem model
    func set(model: CarouselItem) {
        // Set the image for the UIImageView using the image name from the model
        itemImageView.image = UIImage(named: model.image)
        // Set the text for the title label
        itemNameLabel.text = model.title
        // Set the text for the detail label
        itemDetailLabel.text = model.detail
    }

}
