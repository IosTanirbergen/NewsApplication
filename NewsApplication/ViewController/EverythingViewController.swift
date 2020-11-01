//
//  EverythingViewController.swift
//  NewsApplication
//
//  Created by Devnull on 10/31/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

class EverythingViewController: UIViewController {
    
    let EverithingCellId = "EverithingNewsId"
    
    private let apiCaller = MainViewModel()
    private var data = [String]()
    
    public var everthingTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.allowsSelection = true
        return tv
    }()
    
    var currentPage : Int = 0
    var isLoadingList : Bool = false
    
    var mainVM = MainViewModel()
    var news = [Articles]()
    var page = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationController()
        setupTableView()
        
        
        mainVM.geteverthingNews{
            data in
            self.news = data
            DispatchQueue.main.async {
                self.everthingTableView.reloadData()
            }
        }
        
        everthingTableView.refreshControl = UIRefreshControl()
        everthingTableView.refreshControl?.addTarget(self, action: #selector(UpdateData), for: .valueChanged)
    }
    
    @objc  private func UpdateData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.everthingTableView.refreshControl?.endRefreshing()
            print("refresh")
        }
    }
    
    
    private func setupTableView(){
        
          everthingTableView.dataSource = self
          everthingTableView.delegate = self
          everthingTableView.backgroundColor = .white
          view.addSubview(everthingTableView)
        
          everthingTableView.register(EverythingCell.self, forCellReuseIdentifier: EverithingCellId)
          everthingTableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    private func setupNavigationController(){
        let navBar = self.navigationController?.navigationBar
        navBar?.isHidden = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBar?.topItem?.title = "Everything"
        navBar?.topItem?.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "check-mark").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(HandleSave))
    }


    
    @objc fileprivate func HandleSave(){
        let vc = SaveNewsViewController()
        present(vc,animated: true)
    }
}
