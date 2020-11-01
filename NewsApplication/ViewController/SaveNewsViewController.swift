//
//  SaveNewsViewController.swift
//  NewsApplication
//
//  Created by Devnull on 11/2/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

class SaveNewsViewController: UIViewController {

    let image = UIImageView(image: #imageLiteral(resourceName: "news-1").withRenderingMode(.alwaysOriginal))
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.2806117535, green: 0.604807198, blue: 0.4692806602, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()

    lazy var newsStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
        titleLabel,
        descriptionLabel
        ])
        sv.axis = .vertical
        sv.spacing = 25
        return sv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        let defaults = UserDefaults.standard
        descriptionLabel.text = defaults.string(forKey: saveNews.descriptionText)
        titleLabel.text = defaults.string(forKey: saveNews.title)
        view.addSubview(image)
        image.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 25, left: 0, bottom: 0, right: 0))
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.contentMode = .scaleToFill
        view.addSubview(newsStackView)
        newsStackView.anchor(top: image.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 25, left: 15, bottom: 0, right: 0))
    }
    
    private func setupNavigationController(){
        view.backgroundColor = .white
        let navBar = self.navigationController?.navigationBar
        navBar?.isHidden = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBar?.topItem?.title = "Your News"
        navBar?.topItem?.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-arrow-50").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(HandleTopHeadlines))
    }

    
    @objc func HandleTopHeadlines(){
        let vc = TopHeadlinesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
