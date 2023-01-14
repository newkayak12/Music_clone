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
    let topConentsArrayCount = 3
    let bottomContentsArrayCount = 1
    override func viewDidLoad() {
        super.viewDidLoad()
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
                count = topConentsArrayCount
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
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath)
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
                let realWidth =  (width - (layout.minimumLineSpacing * CGFloat(topConentsArrayCount)))
                size = CGSize(width: realWidth.rounded(.down), height: (realWidth * 0.6).rounded(.down))
            case bottomContent:
                let realWidth =  (width - (layout.minimumLineSpacing * CGFloat(bottomContentsArrayCount)))
                size = CGSize(width: realWidth.rounded(.down), height: (realWidth / 2).rounded(.down))
            default:
                break;
        }
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
    

    
}
