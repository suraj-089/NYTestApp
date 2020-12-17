//
//  RequestFactory.swift
//  NYTestApp
//
//  Created by Suraj on 12/17/20.
//  Copyright © 2020 Madstech. All rights reserved.
//

import Foundation

final class RequestFactory {
    
    enum Method: String {
        case GET
        case POST
    }
    
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
