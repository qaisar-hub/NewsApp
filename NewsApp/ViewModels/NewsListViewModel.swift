//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Qaisar Raza on 9/18/22.
//

import Foundation

class NewsListViewModel {
    
    var newsVM = [NewsViewModel]()
    
    let reuseID = "news"
    
    func getNews(completion: @escaping ([NewsViewModel]) -> Void) {
        NetworkManager.shared.getNews { (news) in
            guard let news = news else {
                return
            }
            let newsVM = news.map(NewsViewModel.init)
            
            //NetworkManager called on background thread
            //so we are moving to main thread before updating the UI
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
            
        }
    }
    
    
}
