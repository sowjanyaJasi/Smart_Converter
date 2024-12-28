//
//  CurrencyViewModel.swift
//  Smart Converter
//
//  Created by Sowjanya on 29/12/24.
//


import Foundation

class CurrencyViewModelApi {
    func fetchCurrencyDetails(completion : @escaping(Result<[CurrencyRate],Error>)-> Void){
            APIManager.sharedManager.callApiService(type:SmartConverterEndPointItem.getCurrencyExange(appId: AppConstants.app_id), decodingType: CurrencyModel.self) { result in
                switch result {
                case .success(let currencyModel):
                    print(currencyModel)
                    Utility.saveLastAPICallTime()
                    CoredataLayer().insertCurrencyData(currencyRates: currencyModel)
                    self.fetchCurrencyDetailsFromLocal { result in
                        completion(result)
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        
    }
    func fetchCurrencyDetailsFromLocal(completion : @escaping(Result<[CurrencyRate],Error>)-> Void) {
        CoredataLayer().fetchCurrencyRates { result in
            switch result{
            case .success(let currencyData):
                completion(.success(currencyData))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
}
