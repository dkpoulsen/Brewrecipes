//
//  PunkAPI.swift
//  Brew recipes
//
//  Created by Daniel K. Poulsen on 23/12/2017.
//  Copyright © 2017 dkp. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct PunkAPI : BrewAPI {
    
    static let Brews = "https://api.punkapi.com/v2/beers"
    
    let session = URLSession.shared
    
    func search(search : [SearchFilters : String]? = nil) -> Observable<[Beer]>{
        var urlString = PunkAPI.Brews
        if let searchUnwrapped = search{
            urlString += "?"
            for s in searchUnwrapped{
                guard s.value != "" else {break}
                urlString += "\(s.key.rawValue)=\(s.value)&"
            }
        }
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
        return session.rx.data(request: request).map{
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode(Array<Beer>.self, from: $0)
        }
    }
}

enum SearchFilters : String{
    case name = "beer_name"
    case hops = "hops"
    case malt = "malt"
}

