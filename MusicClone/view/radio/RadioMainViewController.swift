//
//  RadioMainViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/14.
//

import UIKit

class RadioMainViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var topConentsArray: [Dictionary<String, String>] = []
    var bottomContentsArray: [Dictionary<String,String>] = []
    let sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    @IBOutlet weak var topContent: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topConentsArray.append(["header":"EXCLUSIVE", "title":"Apple Music 1", "desc": "The new music that matters.", "image":"apple_music_1"])
        topConentsArray.append(["header":"BRAND-NEW STATION", "title":"Apple Music Hits", "desc": "Songs you know and love.", "image":"country"])
        topConentsArray.append(["header":"BRAND-NEW STATION", "title":"Apple Music Country", "desc": "Where it sounds like home.", "image":"hits"])
        
        bottomContentsArray.append(["title": "BBC World Service", "desc":"International in-depth news and features.", "ImageView": "bbc"])
        bottomContentsArray.append(["title": "Bloomberg Radio", "desc":"The latest business, financial and global news 24/7", "ImageView": "bloomberg"])
//        desc
//        title
//        ImageView
        
        
//
        topContent.alwaysBounceHorizontal = true
        topContent.showsHorizontalScrollIndicator = false
        topContent.decelerationRate = .fast
        table.alwaysBounceHorizontal = true
        table.alwaysBounceVertical = false
        table.separatorInset = UIEdgeInsets(top: 0, left: 140, bottom: 0, right: 20)
    }
}

extension RadioMainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case topContent:
                return topConentsArray.count
//            case bottomContent:
//                return bottomContentsArrayCount
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {fatalError()}
        print(collectionView == topContent, layout.minimumInteritemSpacing, layout.minimumLineSpacing)
        let boundWidth = view.bounds.width
        let width = (boundWidth - (sectionInset.left + sectionInset.right))
        var height = 0.0
        switch collectionView {
            case topContent:
                height = topContent.bounds.height - (sectionInset.top + sectionInset.bottom)
//            case bottomContent:
//                height = bottomContent.bounds.height - (sectionInset.top + sectionInset.bottom)
            default:
                height = 0.0
        }
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case topContent:
                let content = topConentsArray[indexPath.row]
                
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopCollectionViewCell else { fatalError() }
                
                let cellWidth = (view.bounds.width - (sectionInset.left + sectionInset.right) )
                let imageWidth = cellWidth * 0.9
                let imageView = UIImageView(frame: .zero)
                cell.header.text = content["header"] ?? ""
                cell.title.text = content["title"] ?? ""
                cell.desc.text = content["desc"] ?? ""
                let image = UIImage(named: content["image"]!)
                imageView.contentMode = .scaleAspectFit
                imageView.backgroundColor = UIColor(red: (246/255), green: (246/255), blue: (246/255), alpha: 1.0)
                
                
                imageView.image = image
                imageView.layer.cornerRadius = 20
                imageView.clipsToBounds  = true
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: cellWidth * 0.8).isActive = true
                cell.addSubview(imageView)
                imageView.leadingAnchor.constraint(equalTo:cell.leadingAnchor).isActive = true
                imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0.0).isActive = true
                return cell;
//            case bottomContent:
//                guard let bottomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as? BottomCollectionViewCell else {fatalError()}
//
//               return bottomCell
            default:
                return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
            case topContent:
                return CGFloat(10)
//            case bottomContent:
//                return CGFloat(sectionInset.left)
            default:
                return CGFloat(sectionInset.left)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInset
    }
    
    
}

extension RadioMainViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print(#function)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(#function)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(#function, targetContentOffset.pointee)
        let cellWidth = view.bounds.width - (sectionInset.left + sectionInset.right)
        let pointX = targetContentOffset.pointee.x
        
//        let index = floor(pointX / cellWidth)
//        let interIndex = (floor((pointX / cellWidth) * 10) / 10)
//        let exceedMiddle = ( interIndex - index ) > 0.5
//        print("index \(index) / \(exceedMiddle)")
//
        
        
        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
        let layout = self.topContent.collectionViewLayout as! UICollectionViewFlowLayout
        print(layout.itemSize.width)
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
        // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        
        // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
        // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
        // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)
        } else {
            roundedIndex = ceil(index)
        }
        
        // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left - 25, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
        
    }
}

extension RadioMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BottomTableViewCell else { return UITableViewCell() }
        
        let data = bottomContentsArray[indexPath.row]
        
        cell.title.text = data["title"]
        cell.desc.text = data["desc"]
        cell.desc.numberOfLines = 2
        cell.ImageView.image = UIImage(named: data["ImageView"]!)
        cell.ImageView.layer.cornerRadius = 5
        cell.ImageView.clipsToBounds = true
        
        let image = UIImage(systemName: "ellipsis")
        image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        let accessory = UIImageView(image: image)
        cell.accessoryView = accessory
        print(#function,  cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat((tableView.bounds.height / 2) * 0.8)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: .zero)
//        let label = UILabel(frame: .zero)
//        label.text = "Station"
//        label.font = UIFont.preferredFont(forTextStyle: .title2)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(label)
//
//        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0).isActive = true
//        return view
//    }
    
}
