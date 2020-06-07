//
//  HomeworkCell.swift
//  HomeworkList
//
//  Created by Student on 2020-06-06.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

protocol HomeworkCellDelegate: class {
    func checkmarkTapped(sender: HomeworkCell)
}

class HomeworkCell: UITableViewCell {

    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    weak var delegate: HomeworkCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
