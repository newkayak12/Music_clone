//
//  RadioMainViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/14.
//

import UIKit

class RadioMainViewController: UIViewController {

    @IBOutlet weak var topContent: UICollectionView!
    
    @IBOutlet weak var bottomContent: UICollectionView!
    var topConentsArray: [Dictionary<String, String>] = []
    let bottomContentsArrayCount = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        topConentsArray.append(["header":"EXCLUSIVE", "title":"Apple Music 1", "desc": "The new music that matters.", "image":"apple_music_1"])
        topConentsArray.append(["header":"BRAND-NEW STATION", "title":"Apple Music Hits", "desc": "Songs you know and love.", "image":"country"])
        topConentsArray.append(["header":"BRAND-NEW STATION", "title":"Apple Music Country", "desc": "Where it sounds like home.", "image":"hits"])
        
        topContent.alwaysBounceHorizontal = true
        bottomContent.alwaysBounceHorizontal = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RadioMainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 0;
        switch collectionView {
            case topContent:
                count = topConentsArray.count
            case bottomContent:
                count = bottomContentsArrayCount
            default:
                break;
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        switch collectionView {
            case topContent:
                if let top = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopCollectionViewCell {
                    let content = topConentsArray[indexPath.row]
                    top.header.text = content["header"]
                    top.title.text = content["title"]
                    top.desc.text = content["desc"]
                    top.image.image = UIImage(named: content["image"]!)
                    
                    cell = top
                } else { cell = UICollectionViewCell(); }
                
            case bottomContent:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath)
            default:
                break;
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize(width: 0, height: 0)
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let width = collectionView.bounds.width
        
        switch collectionView {
            case topContent:
                let realWidth =  (width - (layout.minimumLineSpacing * CGFloat(topConentsArray.count)))
                size = CGSize(width: realWidth.rounded(.down), height: (realWidth * 1.5).rounded(.down))
            case bottomContent:
                let realWidth =  (width - (layout.minimumLineSpacing))
                let height = (view.bounds.height - topContent.bounds.height) - (bottomContent.contentInset.bottom + bottomContent.contentInset.top)
                size = CGSize(width: realWidth.rounded(.down), height: CGFloat(height))
            default:
                break;
        }
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var edge = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        switch collectionView {
            case topContent:
               edge = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
            case bottomContent:
              edge = UIEdgeInsets(top: 5, left: 20, bottom: 10, right: 20)
            default:
                break;
        }
        return edge
    }
    

    
}
