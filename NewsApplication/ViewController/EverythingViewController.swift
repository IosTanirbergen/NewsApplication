//
//  EverythingViewController.swift
//  NewsApplication
//
//  Created by Devnull on 10/31/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

class EverythingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        SetupNavigationController()
    }
    
    
    private func SetupNavigationController(){
        let navBar = self.navigationController?.navigationBar
        navBar?.isHidden = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBar?.topItem?.title = "Everything"
        navBar?.topItem?.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "check-mark").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(HandleSave))
    }


    
    @objc fileprivate func HandleSave(){
        
    }
}
