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
    weak var everthingVc : EverythingViewController?
    var arrNews = [Articles]()
    
    // MARK: - getTopNews
    func getTopHeadlinesNewsAPI(comp :@escaping([Articles])->()){
           
           AF.request(TopHeadlinesAPI,method: .get,parameters: nil).response{
               response in
               switch response.result {
                
                case .success(let data):
                   do {
                       let result = try JSONDecoder().decode(News.self, from: data!)
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
    
    func geteverthingNews(comp :@escaping([Articles])->()){
              AF.request(EverytingApi,method: .get,parameters: nil).response{
                  response in
                  switch response.result {
                   case .success(let data):
                      do {
                          let result = try JSONDecoder().decode(News.self, from: data!)
                       comp(result.articles!)
                       DispatchQueue.main.async {
                           self.everthingVc?.everthingTableView.reloadData()
                          }
                        }  catch {
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
}
