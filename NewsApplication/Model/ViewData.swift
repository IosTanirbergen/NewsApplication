//
//  ViewData.swift
//  NewsApplication
//
//  Created by Devnull on 10/31/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import Foundation

enum ViewData {
    case loading
    case success
    case failure
    case initial
    
    struct NewsData {
        let description: String?
        let title: String?
        
    }
    
}
