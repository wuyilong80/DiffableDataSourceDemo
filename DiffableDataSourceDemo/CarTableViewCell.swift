//
//  CarTableViewCell.swift
//  DiffableDataSourceDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/5/9.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    var nameLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    var imgView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLayout()
    }
    
    func setupLayout() {
        selectionStyle = .none
        
        addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(15.0)
            make.width.height.equalTo(45.0)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(15.0)
            make.trailing.equalToSuperview().inset(15.0)
            make.centerY.equalToSuperview()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
