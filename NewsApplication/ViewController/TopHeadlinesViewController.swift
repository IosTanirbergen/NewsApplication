//
//  ViewController.swift
//  NewsApplication
//
//  Created by Devnull on 10/29/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

class TopHeadlinesViewController: UIViewController {
    let topHeadlinesCellId = "BandCellID"
    
     public let topHeadlinesTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.allowsSelection = true
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupNavigationController()
        view.backgroundColor = .white
        
        let service = Service()
        service.callingTopHeadlinesNewsAPI()
        
        setupTableView()
    }
    
    private func SetupNavigationController(){
        let navBar = self.navigationController?.navigationBar
        navBar?.isHidden = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBar?.topItem?.title = "Top Headlines"
        navBar?.topItem?.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "check-mark").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(HandleSave))
    }
    
    fileprivate func setupTableView() {
        
          topHeadlinesTableView.dataSource = self
          topHeadlinesTableView.delegate = self
        

          topHeadlinesTableView.backgroundColor = .white
          view.addSubview(topHeadlinesTableView)
        
          topHeadlinesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
          topHeadlinesTableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
      }
    
    
    
    
    @objc fileprivate func HandleSave(){
     print("1")
    }

}

