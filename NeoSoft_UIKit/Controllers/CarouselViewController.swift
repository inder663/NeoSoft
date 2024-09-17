//
// Copyright © 2024 .
// All Rights Reserved.

import UIKit

// ViewController managing carousel and item views in a table
class CarouselViewController: UIViewController {

    // ViewModel to handle data and business logic
    private let viewModel = CarouselViewModel()

    // Outlet for the table view
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableCells()
    }

    // Register table view cells from nib files
    private func registerTableCells() {
        let carouselCellNib = UINib(nibName: "CarouselViewTableViewCell", bundle: nil)
        tableView.register(carouselCellNib, forCellReuseIdentifier: CellIdentifier.carouselViewTableViewCell)

        let itemCellNib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        tableView.register(itemCellNib, forCellReuseIdentifier: CellIdentifier.itemTableViewCell)
    }

    // Action for floating button to present statistics
    @IBAction func floatingButtonAction(_ sender: UIButton) {
        let characterOccurrences = viewModel.calculateCharacterOccurrences()
        presentStatisticsActionSheet(itemCount: viewModel.getItemsAtSelectedIndex().count, characterOccurrences: characterOccurrences)
    }

    // Present an action sheet with character occurrences statistics
    private func presentStatisticsActionSheet(itemCount: Int, characterOccurrences: [Character: Int]) {
        let actionSheet = UIAlertController(title: "List 1 (\(itemCount) items)", message: "Character Occurrences:", preferredStyle: .actionSheet)

        // Add character occurrence counts to the action sheet
        for (character, count) in characterOccurrences.sorted(by: { $0.value > $1.value }).prefix(3) {
            actionSheet.addAction(UIAlertAction(title: "\(character) = \(count)", style: .default, handler: nil))
        }
        // Add a cancel action
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // Present the action sheet
        present(actionSheet, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension CarouselViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCell(for: indexPath, tableView: tableView)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SearchView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.searchBar.delegate = self
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 350 : 100
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 50 : .leastNonzeroMagnitude
    }
}

// MARK: - Private Methods

extension CarouselViewController {
    private func numberOfSections() -> Int {
        return 2
    }

    private func numberOfRows(in section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return viewModel.getItemsAtSelectedIndex().count
        default:
            return 0
        }
    }

    private func getCell(for indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return getCarouselCell(for: indexPath, tableView: tableView)
        case 1:
            return getItemCell(for: indexPath, tableView: tableView)
        default:
            return UITableViewCell()
        }
    }

    private func getCarouselCell(for indexPath: IndexPath, tableView: UITableView) -> CarouselViewTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.carouselViewTableViewCell, for: indexPath) as! CarouselViewTableViewCell
        cell.delegate = self
        cell.set(images: viewModel.carouselImages)
        return cell
    }

    private func getItemCell(for indexPath: IndexPath, tableView: UITableView) -> ItemTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.itemTableViewCell, for: indexPath) as! ItemTableViewCell
        cell.set(model: viewModel.getItem(at: indexPath.row))
        return cell
    }
}

// MARK: - CarouselViewTableViewCellDelegate

extension CarouselViewController: CarouselViewTableViewCellDelegate {
    func didScrollTo(index: Int) {
        viewModel.selectedModelIndex = index
        tableView.reloadSections(IndexSet(integer: 1), with: .none)
    }
}

// MARK: - UISearchBarDelegate

extension CarouselViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let trimmedText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if viewModel.searchText != trimmedText {
            viewModel.searchText = trimmedText
            tableView.reloadData()
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - Cell Identifiers

extension CarouselViewController {
    struct CellIdentifier {
        static let carouselViewTableViewCell = "CarouselViewTableViewCell"
        static let itemTableViewCell = "ItemTableViewCell"
    }
}
