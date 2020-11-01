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
    
    
    let udid = UIDevice.current.identifierForVendor?.uuidString
   
    
    var countNews:[Int] = Array()
    var pageIndex = 1
     public let topHeadlinesTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.allowsSelection = true
        return tv
    }()
    
    var currentPage : Int = 0
    var isLoadingList : Bool = false
    
    var mainVM = MainViewModel()
    var news = [Articles]()
    var page = 1
    
    
    var isDataLoading:Bool=false
    var pageNo:Int=0
    var limit:Int=20
    var offset:Int=0 //pageNo*limit
    var didEndReached:Bool=false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        SetupNavigationController()
        view.backgroundColor = .white
     //   mainVM.topVc = self
        mainVM.callingTopHeadlinesNewsAPI {
            data in
            self.news = data
            DispatchQueue.main.async {
             //   self.page = arrNews.count
                self.topHeadlinesTableView.reloadData()
                
            }
            
        }
        
        topHeadlinesTableView.refreshControl = UIRefreshControl()
        topHeadlinesTableView.refreshControl?.addTarget(self, action: #selector(UpdateData), for: .valueChanged)
        //view.addSubview(refreshcontrol)
       // refreshcontrol.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    
        
        setupTableView()
    }
    @objc  private func UpdateData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.topHeadlinesTableView.refreshControl?.endRefreshing()
            print("refresh")
        }
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
        
          topHeadlinesTableView.register(TopHeadlinesCell.self, forCellReuseIdentifier: topHeadlinesCellId)
          topHeadlinesTableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
      }
    
    
    
    
    @objc fileprivate func HandleSave(){
     print("1")
    }

}

