//
//  MainViewModel.swift
//  NewsApplication
//
//  Created by Devnull on 10/31/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? {get set}
    
    
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    
    init() {
        updateViewData?(.initial)
    }
    
    public  func startFetch() {
        
        
        
//        updateViewData?(.loading(ViewData.NewsData(description: <#T##String?#>, title: <#T##String?#>)))
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            
        }
    }
}
