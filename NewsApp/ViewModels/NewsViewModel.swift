//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Qaisar Raza on 9/18/22.
//

import Foundation

struct NewsViewModel {
    
    let news: News
    
    var author: String {
        return news.author ?? "unknown"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://protkd.com/wp-content/uploads/2017/04/default-image.jpg"
    }
    
}
