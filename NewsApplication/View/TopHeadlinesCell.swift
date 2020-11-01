//
//  TopHeadlinesCell.swift
//  NewsApplication
//
//  Created by Devnull on 11/1/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

class TopHeadlinesCell: UITableViewCell {
    var news : [News] = []
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupLayouts()
     }
    
    fileprivate func setupLayouts(){
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 8))
    }
    
        
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
}
