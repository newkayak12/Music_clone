//
//  BottomTableViewCell.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/19.
//

import UIKit

class BottomTableViewCell: UITableViewCell {


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
