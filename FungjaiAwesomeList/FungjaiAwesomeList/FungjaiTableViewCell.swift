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
    
    override func prepareForReuse() {
        super.prepareForReuse()

        self.coverImage.image = nil
        self.namelabel.text = ""
        self.videoLabel.text = ""
        self.videoImage.image = nil
    


    }
}
