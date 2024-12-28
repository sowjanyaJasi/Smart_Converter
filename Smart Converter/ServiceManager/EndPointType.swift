//
//  EndPointType.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import Foundation
import Alamofire

protocol EndPointType {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
}
