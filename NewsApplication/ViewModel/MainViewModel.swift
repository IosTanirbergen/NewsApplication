//
//  MainViewModel.swift
//  NewsApplication
//
//  Created by Devnull on 10/31/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit
import Alamofire

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? {get set}
}

final class MainViewModel: MainViewModelProtocol {
  
    weak var topVc : TopHeadlinesViewController?
    var arrNews = [Articles]()
    
    func callingTopHeadlinesNewsAPI(comp :@escaping([Articles])->()){
           
           AF.request(TopHeadlinesAPI,method: .get,parameters: nil).response{
               response in
               
            
               switch response.result {
                case .success(let data):
                   do {
                       let result = try JSONDecoder().decode(News.self, from: data!)
                //   print(result)
                    comp(result.articles!)

                    DispatchQueue.main.async {
                        self.topVc?.topHeadlinesTableView.reloadData()
                    }
                   } catch {
                       print("error")
                   }
                   
                case .failure(let err):
                       print(err.localizedDescription)
                   }
           }.resume()
       }
    
    func getNews(at indexPath: IndexPath) -> Articles {
        return arrNews[indexPath.row]
    }
    
    public var updateViewData: ((ViewData) -> ())?
    
    
    init() {
        updateViewData?(.initial)
    }
    
        // MARK: - getTopNews

}
