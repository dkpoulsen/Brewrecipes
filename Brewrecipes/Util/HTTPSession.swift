//
//  HTTPSession.swift
//  Brewrecipes
//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
import RxSwift

protocol HTTPSession {
    func get(from request: URLRequest) -> Observable<Data>
}

extension URLSession : HTTPSession{
    func get(from request: URLRequest) -> Observable<Data>{
        return rx.data(request: request)
    }
}
