//
//  NewsDetailViewController.swift
//  NewsApplication
//
//  Created by Devnull on 11/1/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

struct saveNews{
    static let title = ""
    static let descriptionText = ""
}

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
    
    let saveButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save News", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 14
        button.backgroundColor = #colorLiteral(red: 0.2806117535, green: 0.604807198, blue: 0.4692806602, alpha: 1)
        return button
    }()
    
    var informationNews:Articles?
    
    fileprivate func setupLayouts() {
        view.backgroundColor = .white
        view.addSubview(authorStack)
        authorStack.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 10, left: 15, bottom: 0, right: 0))
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: authorLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 25, left: 15, bottom: 0, right: 0))
        
        
        view.addSubview(stackNews)
        stackNews.anchor(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 25, left: 10, bottom: 0, right: 20))
        
        view.addSubview(saveButton)
        saveButton.anchor(top: stackNews.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 30, left: 40, bottom: 0, right: 40))
        saveButton.addTarget(self, action: #selector(HandleSave), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    
    @objc func HandleSave(){
        
        let defaults = UserDefaults.standard
        defaults.set(titleLabel.text, forKey: saveNews.title)
        defaults.set(descriptionLabel.text, forKey: saveNews.descriptionText)
        
        let alert = UIAlertController(title: "", message: "Data saved successfully , you can see this data by clicking the button on the main page", preferredStyle: .alert)
             present(alert, animated: true, completion: nil)
        
             let when = DispatchTime.now() + 3
        
             DispatchQueue.main.asyncAfter(deadline: when){
               alert.dismiss(animated: true, completion: nil)
             }
        
        
    }

  
}
