//
//  ServiceHelper.swift
//  NYTestApp
//
//  Created by Suraj on 12/17/20.
//  Copyright © 2020 Madstech. All rights reserved.
//


import Foundation

protocol ServiceHelperProtocol : class {
    func fetchArticles(_ completion: @escaping ((Result<NewsData, ErrorResult>) -> Void))
}

//MARK:- Service enums
enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

final class ServiceHelper : RequestHandler, ServiceHelperProtocol {
    
    static let shared = ServiceHelper()
    
    let apiUrlStr = NEWS_API_URL
    var task : URLSessionTask?
    
    func fetchArticles(_ completion: @escaping ((Result<NewsData, ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchArticles()
        task = RequestService().loadData(urlString: apiUrlStr, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchArticles() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
