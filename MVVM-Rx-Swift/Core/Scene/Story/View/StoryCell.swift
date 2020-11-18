//
//  StoryCell.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/17/20.
//

import UIKit
import SnapKit

class StoryCell: UITableViewCell {

    //MARK: - UI Properties
    let headerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let footerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: - Methods
    func setupUI() {
        self.contentView.addSubview(headerLabel)
        self.contentView.addSubview(footerLabel)
        
        self.headerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top)
            make.width.equalToSuperview()
        }
        
        self.footerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(0.0)
            make.width.equalToSuperview()
        }
    }
    
}
