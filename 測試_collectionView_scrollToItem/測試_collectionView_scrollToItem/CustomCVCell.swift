//
//  CustomCVCell.swift
//  測試_collectionView_scrollToItem
//
//  Created by 邱慧珊 on 2024/9/14.
//

import UIKit

class CustomCVCell: UICollectionViewCell {
    
    let label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "標籤"
        label.font = UIFont(name: "PingFangTC-Regular", size: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
