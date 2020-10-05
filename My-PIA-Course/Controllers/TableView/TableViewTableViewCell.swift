//
//  TableViewTableViewCell.swift
//  My PIA Lessons
//
//  Created by Waleerat Gottlieb on 2020-09-15.
//

import UIKit

class TableViewTableViewCell: UITableViewCell {
    @IBOutlet weak var personItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
