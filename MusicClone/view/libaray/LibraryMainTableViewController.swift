//
//  LibraryMainTableViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/07.
//

import UIKit
import AVKit
class LibraryMainTableViewController: UIViewController {
    var isEdit: Bool = false
    var sortTypeList: [SortType] = []
    var albumList: [Album] = []
    var musicList: [AVPlayerItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let preset = UserDefaults.standard.value(forKey: "librarySection") as? Data else {return}
        let decoder = JSONDecoder()
        if let decodedData = try? decoder.decode([SortType].self, from: preset) {
            sortTypeList = decodedData
//            print(decodedData)
        }
        
        loadFiles()
    }
    
    func loadFiles() {
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
//        let url = Bundle.main.resourceURL
//        print("\n\n")
            for url in urls {
               let file =  AVPlayerItem(url: url)
//                print(String(describing: file))
                musicList.append(file)
                
                print(file.automaticallyLoadedAssetKeys)
                
            }
        
    }
}

extension LibraryMainTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return sortTypeList.filter{$0.isShow!}.count
            default:
                return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        switch indexPath.section {
            case 0:
                cell  = tableView.dequeueReusableCell(withIdentifier: "sort", for: indexPath)
                let sort = self.sortTypeList.filter{$0.isShow!}
                cell.imageView?.image = UIImage(systemName: sort[indexPath.row].image!)
                cell.textLabel?.text = sortTypeList[indexPath.row].name
                cell.textLabel?.font = .preferredFont(forTextStyle: .body)
                cell.accessoryType = .disclosureIndicator
            case 1:
                cell = tableView.dequeueReusableCell(withIdentifier: "music", for: indexPath)
                cell.clipsToBounds = false
                let height = ((Int(((view.bounds.width - 30) / 2).rounded(.down)) * musicList.count ) / 2 )
                cell.contentView.heightAnchor.constraint(equalToConstant: CGFloat(height + 60).rounded(.up)).isActive = true
            default:
                break
        }

        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
}

extension LibraryMainTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var supplimentary = UICollectionReusableView()
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                supplimentary = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
                
                let label = UILabel(frame: .zero)
                label.text = "Recently Added"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont.preferredFont(forTextStyle: .title3)
                supplimentary.addSubview(label)
                label.bottomAnchor.constraint(equalTo: supplimentary.bottomAnchor).isActive = true
                label.leadingAnchor.constraint(equalTo: supplimentary.leadingAnchor, constant: 20).isActive = true
            default:
                break;
        }
        
        return supplimentary
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        let width = view.bounds.width
        let inset = layout.minimumInteritemSpacing
        
        let size = (width - (inset * 3)) / 2
        layout.estimatedItemSize = .zero
        return CGSize(width: size.rounded(.down), height: size.rounded(.down))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? LibraryCustomCollectionCell else { return UICollectionViewCell() }
        cell.title.text = musicList[indexPath.row].description
//        if indexPath.row % 2 == 0 {
//
//        } else {
//
//        }
        return cell
    }
    
    
    
}
