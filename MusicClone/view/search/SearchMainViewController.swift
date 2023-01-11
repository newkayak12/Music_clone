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
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SearchCustomCell else {return UICollectionViewCell() }
        cell.layer.cornerRadius = 10
        cell.collectionText.text = "K-POP"
        cell.collectionText.font = .preferredFont(forTextStyle: .body)
        let image = UIImage(named: "collectionImage")
        cell.collectionImage.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        let bound = view.bounds
        let width = bound.width - ( layout.sectionInset.left + layout.sectionInset.right)
        let height = bound.height - (layout.sectionInset.top + layout.sectionInset.bottom)
        let collectionWidth = (width - (layout.minimumLineSpacing) * 3) / 2
        let collectionHeight = collectionWidth * 0.6
        layout.estimatedItemSize = .zero
        return CGSize(width: collectionWidth.rounded(.down), height: collectionHeight.rounded(.down))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusable  = UICollectionReusableView()
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                reusable = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableView", for: indexPath)
                let label = UILabel()
                label.text = "Browse Categories"
                label.font = .preferredFont(forTextStyle: .title3)
                label.translatesAutoresizingMaskIntoConstraints = false
                reusable.addSubview(label)
                label.leadingAnchor.constraint(equalTo: reusable.leadingAnchor, constant: 20).isActive = true
                label.centerYAnchor.constraint(equalTo: reusable.centerYAnchor, constant: 10).isActive = true
                
                return reusable
            default:
                break;
        }
        return reusable;
    }
}
