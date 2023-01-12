//
//  MiniPlayer.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/08.
//

import UIKit

class MiniPlayer: UIView, UIGestureRecognizerDelegate {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var playPause: UIButton!
    @IBAction func fnPlayPause(_ sender: Any) {
    }
    @IBAction func fnForward(_ sender: Any) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TOUCH")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
//        customInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        customInit()
    }
//    func customInit(){
//        if let view = Bundle.main.loadNibNamed("MiniPlayer", owner: nil, options: nil)?.first as? UIView {
//            view.frame = self.bounds
//            addSubview(view)
//
//            print(view.subviews)
//        }
//    }
}
