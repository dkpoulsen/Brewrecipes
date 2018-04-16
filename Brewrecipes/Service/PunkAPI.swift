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
    
    let session : HTTPSession
    
    init(session : HTTPSession = URLSession.shared) {
        self.session = session
    }
    
    func search(search : [SearchFilters : String]? = nil) -> Observable<[Beer]>{
        var component = URLComponents(string :PunkAPI.Brews)!
        component.queryItems = search?.filter{$0.value.count > 1}.compactMap{URLQueryItem(name: $0.key.rawValue, value: $0.value)}

        let request = URLRequest(url: component.url!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
        return session.get(from: request).map{
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

