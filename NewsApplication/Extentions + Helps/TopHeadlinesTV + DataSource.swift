//
//  TopHeadlinesTV.swift
//  NewsApplication
//
//  Created by Devnull on 11/1/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit

extension TopHeadlinesViewController: UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: topHeadlinesCellId, for: indexPath) as! TopHeadlinesCell
        cell.accessoryType = .disclosureIndicator
        cell.titleLabel.text = news[indexPath.row].title
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailViewController()
        let module = news[indexPath.row]
        vc.authorLabel.text = module.author
        vc.titleLabel.text = module.title
        vc.descriptionLabel.text = module.description
        vc.publishedAtLabel.text = module.publishedAt
        vc.contentLabel.text = module.content
        print(vc.authorLabel.text ?? "")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsDetailViewController {
            destination.informationNews = news[topHeadlinesTableView.indexPathForSelectedRow!.row]
        }
    }
   
    
    
}
