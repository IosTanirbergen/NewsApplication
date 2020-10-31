//
//  MainViewModel.swift
//  NewsApplication
//
//  Created by Devnull on 10/31/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import Foundation
import Alamofire

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? {get set}
    func getNews(news: [News])
    func getTopNewsFrom()
}

final class MainViewModel: MainViewModelProtocol {
    
    var newsArray: [News] = []
    func getNews(news: [News]) {
    
    }
    
    func getTopNewsFrom() {
        
    }
    
   
    
    public var updateViewData: ((ViewData) -> ())?
    
    
    init() {
        updateViewData?(.initial)
    }
    
        // MARK: - getTopNews

}
