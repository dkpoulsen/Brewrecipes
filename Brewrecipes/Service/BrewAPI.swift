//
//  BrewAPI.swift
//  Brewrecipes
//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
import RxSwift

protocol BrewAPI {
    func search(search : [SearchFilters : String]?) -> Observable<[Beer]>
}
