//
//  FungjaiTableViewCell.swift
//  FungjaiAwesomeList
//
//  Created by Athipat Nampetch on 3/21/18.
//  Copyright © 2018 kanottonp. All rights reserved.
//

import UIKit

class FungjaiTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
