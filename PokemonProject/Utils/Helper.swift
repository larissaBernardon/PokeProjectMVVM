//
//  Helper.swift
//  PokemonProject
//
//  Created by Tag Livros on 03/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation
import Alamofire

class Helper {
    
    // MARK: - Netoworking
    class func responseJSON(result: DataResponse<Any>) {
        guard let unResponse = result.response,
            let unUrl = unResponse.url else {
                return
        }
        
        #if DEBUG || LOCAL
        print(unUrl)
        guard let unData = result.data else { return }
        do {
            let json = try? JSONSerialization.jsonObject(with: unData, options: [])
            if let unJson = json {
                print(unJson)
            }
        }
        #endif
    }
    
    class func getFormattedDate(date: Date) -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        if month <= 9 && day <= 9 {
            return "\(year)-0\(month)-0\(day)"
        } else if month <= 9 && day > 9 {
            return "\(year)-0\(month)-\(day)"
        } else if month > 9 && day <= 9{
            return "\(year)-\(month)-0\(day)"
        }
        
        return "\(year)-\(month)-\(day)"
    }
}
