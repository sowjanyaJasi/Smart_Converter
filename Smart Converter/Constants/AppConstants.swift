//
//  AppConstants.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import Foundation
enum NetworkEnvironment {
    case production
    case stage
}
struct AppConstants {
    static let app_id = "ed0a24fa052f4994923aab465e119d32"
    static let networkEnviroment: NetworkEnvironment = .stage
}
