//
//  NewsView.swift
//  NewsApplication
//
//  Created by Devnull on 10/31/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

class NewsView: UIView {
    var newsData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        switch newsData {
        case .initial:
            break
        case .loading:
            break
        case .success:
            break
        case .failure:
            break
        }
    }
    
}
