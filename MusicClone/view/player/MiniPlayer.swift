//
//  MiniPlayer.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/08.
//

import UIKit

protocol MiniPlayerDelegate {
    func touchBegan(_ touches: Set<UITouch>, with event: UIEvent?)
}

class MiniPlayer: UIView {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var playPause: UIButton!
    @IBOutlet weak var forward: UIButton!
    
    var delegate: MiniPlayerDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    func customInit () {
        if let view = Bundle.main.loadNibNamed("MiniPlayer", owner:self, options: nil)?.first as? UIView {
            print(#function, view)
            view.frame = self.bounds
            addSubview(view)
        }
        
        
        
    }
}

extension MiniPlayer: UIGestureRecognizerDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.touchBegan(touches, with: event)
    }
}
