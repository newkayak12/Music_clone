//
//  MiniPlayer.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/08.
//

import UIKit

class MiniPlayer: UIView{
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    @IBAction func t(_ sender: Any) {
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#function)
    }
    

}
