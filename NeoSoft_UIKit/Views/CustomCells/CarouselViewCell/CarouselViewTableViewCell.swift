//
// Copyright © 2024 .
// All Rights Reserved.

import UIKit

// Protocol to handle scrolling events in the carousel
protocol CarouselViewTableViewCellDelegate: AnyObject {
    func didScrollTo(index: Int)
}

// Custom UITableViewCell for displaying a carousel of images
class CarouselViewTableViewCell: UITableViewCell {

    // Outlets for UI elements in the cell
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    // Delegate to notify when the carousel scrolls to a new page
    weak var delegate: CarouselViewTableViewCellDelegate?

    // Array to hold image names or URLs
    private var images: [String] = []

    // Called after the view has been loaded from the nib file
    override func awakeFromNib() {
        super.awakeFromNib()
        // Disable cell selection style
        selectionStyle = .none
        // Initialize the collection view
        initCollectionView()
    }

    // Initialize and configure the collection view
    private func initCollectionView() {
        // Register the custom collection view cell nib
        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self

        // Configure the layout of the collection view
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
    }

    // Update the carousel with a new set of images
    func set(images: [String]) {
        self.images = images
        pageControl.numberOfPages = images.count
        collectionView.reloadData()
    }

}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate

extension CarouselViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    // Return the number of items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    // Configure and return the cell for a given index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.set(image: images[indexPath.row])
        return cell
    }

    // Return the size for each item in the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    // Called when scrolling ends
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Calculate the current page based on the content offset
        let pageWidth = collectionView.frame.size.width
        let currentPage = Int(collectionView.contentOffset.x / pageWidth)
        pageControl.currentPage = currentPage
        // Notify the delegate about the new page
        delegate?.didScrollTo(index: currentPage)
    }
}
