//
//  File.swift
//  NewsApplication
//
//  Created by Devnull on 10/31/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    
    static let shareInstance = Service()
    
    
    func callingTopHeadlinesNewsAPI(){
        
        AF.request(TopHeadlinesAPI,method: .get,parameters: nil).response{
            response in
            
            switch response.result {
             case .success(let data):
                do {
                    let news = try JSONDecoder().decode(News.self, from: data!)
//                    DispatchQueue.main.async {
//                        onCompletion(news)
//                    }
                    print(news)
                } catch {
                    print("error")
                }
                
             case .failure(let err):
                    print(err.localizedDescription)
                }
        }.resume()
    }
}