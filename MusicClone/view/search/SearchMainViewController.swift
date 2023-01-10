//
//  SearchMainViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/07.
//

import UIKit

class SearchMainViewController: UIViewController {
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Artist, Song, Lyric etc..."
        searchController.searchResultsUpdater = self
        searchController.searchBar.showsScopeBar = true
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

    

}

extension SearchMainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let result = searchController.searchBar.text  {
            text = result;
        }
    }
}

extension SearchMainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.layer.cornerRadius = 10
//        let image = UIImage(named: "defaultAlbumArt")
//        let imageContainer = UIImageView(image: image)
//        imageContainer.sizeToFit()
        
//        cell.contentView.addSubview(imageContainer)
//        imageContainer.translatesAutoresizingMaskIntoConstraints = false
//        imageContainer.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
//        imageContainer.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
//        imageContainer.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
//        imageContainer.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        let label = UILabel(frame: .zero)
        cell.contentView.addSubview(label)
        label.text = "TEST"
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20).isActive = true
        label.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 20).isActive = true
//        loadViewIfNeeded()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        let bound = view.bounds
        let width = bound.width - ( layout.sectionInset.left + layout.sectionInset.right)
        let height = bound.height - (layout.sectionInset.top + layout.sectionInset.bottom)
        
        
        let collectionWidth = (width - (layout.minimumLineSpacing) * 3) / 2
        let collectionHeight = collectionWidth * 0.8
        
        return CGSize(width: collectionWidth.rounded(.down), height: collectionHeight.rounded(.down))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
