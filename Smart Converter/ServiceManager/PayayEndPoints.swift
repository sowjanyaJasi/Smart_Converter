//
//  PayayEndPoints.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import Foundation
import Alamofire

enum SmartConverterEndPointItem {
    case getCurrencyExange(appId : String)
}


extension SmartConverterEndPointItem: EndPointType {
    var headers: HTTPHeaders? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }

    // MARK: - Vars & Lets
    
    var baseURL: String {
        switch AppConstants.networkEnviroment {
        case .production: return "https://openexchangerates.org/"
        case .stage: return "https://openexchangerates.org/"
        }
    }
    
    var path: String {
        switch self {
            case .getCurrencyExange(let appId):
                return "api/latest.json?app_id=\(appId)"
//            return "https://restcountries.com/v3.1/all"
        }
        
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.path)!
        }
    }
}

