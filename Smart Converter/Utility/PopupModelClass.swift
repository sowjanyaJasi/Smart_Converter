//
//  PopupModelClass.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import Foundation


class CurrencyTableModelVC {
    func modelVC() -> CurrencyTableVC {
        let xib = CurrencyTableVC(nibName: "CurrencyTable", bundle: nil)
        return xib
    }
}
