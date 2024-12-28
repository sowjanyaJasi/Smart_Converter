//
//  Uitility.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import Foundation
import Network
struct Utility {
    private static let lastAPICallTimeKey = "lastAPICallTime"
    
    static func saveLastAPICallTime() {
        let currentTime = Date().timeIntervalSince1970
        UserDefaults.standard.set(currentTime, forKey: lastAPICallTimeKey)
    }
    
    static func getLastAPICallTime() -> Double? {
        return UserDefaults.standard.double(forKey: lastAPICallTimeKey)
    }
    
    static func isTimeDifferenceMoreThan30Minutes() -> Bool {
        guard let lastAPICallTime = getLastAPICallTime(), lastAPICallTime > 0 else {
            return true
        }
        
        let currentTime = Date().timeIntervalSince1970
        let timeDifference = currentTime - lastAPICallTime
        let thirtyMinutesInSeconds: TimeInterval = 30 * 60
        
        return timeDifference >= thirtyMinutesInSeconds
    }
    
    static func isValidEmail(_ email: String) -> Bool {
           let emailRegEx = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
           let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
           return emailPredicate.evaluate(with: email)
       }
   static func checkInternetAccess(completion: @escaping (Bool) -> Void) {
        // Create a monitor to check the network status
        let monitor = NWPathMonitor()

        // Queue to start monitoring
        let queue = DispatchQueue(label: "NetworkMonitorQueue")

        // Start monitoring
        monitor.start(queue: queue)

        // Path update handler
        monitor.pathUpdateHandler = { path in
            // Check if the path is satisfied (internet is accessible)
            if path.status == .satisfied {
                completion(true)  // Internet is available
            } else {
                completion(false) // No internet connection
            }
            
            // Stop monitoring once we have the result
            monitor.cancel()
        }
    }
      
}
