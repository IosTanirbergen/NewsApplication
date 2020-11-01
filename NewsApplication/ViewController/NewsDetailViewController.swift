//
//  NewsDetailViewController.swift
//  NewsApplication
//
//  Created by Devnull on 11/1/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    let publishedAtLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.gray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.numberOfLines = 0
        return label
    }()
    
    
    lazy var authorStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
        authorLabel,
        publishedAtLabel
        ])
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()
    
    lazy var stackNews : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
        contentLabel,
        descriptionLabel
        ])
        sv.axis = .vertical
        sv.spacing = 10
        return sv
    }()
    
    var informationNews:Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(authorStack)
        authorStack.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 10, left: 15, bottom: 0, right: 0))
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: authorLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 25, left: 15, bottom: 0, right: 0))
 
        
        view.addSubview(stackNews)
        stackNews.anchor(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 25, left: 10, bottom: 0, right: 20))
        
    }    
  
}
