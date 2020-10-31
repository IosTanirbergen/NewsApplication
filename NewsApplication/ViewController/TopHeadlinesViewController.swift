//
//  ViewController.swift
//  NewsApplication
//
//  Created by Devnull on 10/29/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

class TopHeadlinesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupNavigationController()
        view.backgroundColor = .white
    }
    
    private func SetupNavigationController(){
        let navBar = self.navigationController?.navigationBar
        navBar?.isHidden = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBar?.topItem?.title = "Top Headlines"
        navBar?.topItem?.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "check-mark").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(HandleSave))
    }
    
    
    @objc fileprivate func HandleSave(){
     print("1")
    }

}

