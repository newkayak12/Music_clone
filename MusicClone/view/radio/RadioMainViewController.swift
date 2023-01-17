//
//  RadioMainViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/14.
//

import UIKit

class RadioMainViewController: UIViewController {

    var topConentsArray: [Dictionary<String, String>] = []
    let bottomContentsArrayCount = 1
    let sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    @IBOutlet weak var topContent: UICollectionView!
    
    @IBOutlet weak var bottomContent: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topConentsArray.append(["header":"EXCLUSIVE", "title":"Apple Music 1", "desc": "The new music that matters.", "image":"apple_music_1"])
        topConentsArray.append(["header":"BRAND-NEW STATION", "title":"Apple Music Hits", "desc": "Songs you know and love.", "image":"country"])
        topConentsArray.append(["header":"BRAND-NEW STATION", "title":"Apple Music Country", "desc": "Where it sounds like home.", "image":"hits"])
        
        
//
//        topContent.alwaysBounceHorizontal = true
//        topContent.showsHorizontalScrollIndicator = false
//        topContent.decelerationRate = .fast
//
//
//        bottomContent.alwaysBounceHorizontal = true
    }
}

extension RadioMainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case topContent:
                return topConentsArray.count
            case bottomContent:
                return bottomContentsArrayCount
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let boundWidth = view.bounds.width
        let width = boundWidth - (sectionInset.left * 3)
        var height = 0.0
        switch collectionView {
            case topContent:
                height = width * 1.5
            case bottomContent:
                height = width * 0.8
            default:
                height = 0.0
        }
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case topContent:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath)
                let label = UILabel()
                label.text = "HELLO"
                label.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(label)
                label.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
                label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
                
//                let view  = UIView(frame: .zero)
//                view.backgroundColor = .blue
//                view.translatesAutoresizingMaskIntoConstraints = false
//                view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 20, height: 20))
//                cell.addSubview(view)
//                view.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
//                view.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 20).isActive = true
                
                return cell;
            case bottomContent:
               return  collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath)
            default:
                return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
            case topContent:
                return CGFloat(0)
            case bottomContent:
                return CGFloat(sectionInset.left)
            default:
                return CGFloat(sectionInset.left)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInset
    }
    
}
