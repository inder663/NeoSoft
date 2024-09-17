//
// Copyright © 2024 .
// All Rights Reserved.

import UIKit

// Custom UIView subclass for a search view
class SearchView: UIView {

    // Outlets for UI elements in the view
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!

    // Initialization from a frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    // Initialization from a storyboard or nib
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // Common setup code for initializing the view
    private func commonInit() {
        // Load the nib file for this view
        Bundle.main.loadNibNamed("SearchView", owner: self)

        // Add the content view from the nib as a subview
        addSubview(contentView)

        // Set the frame and autoresizing mask to match the parent view
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
