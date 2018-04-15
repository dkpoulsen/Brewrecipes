//
//  UIImage+Rx.swift
//  Brewrecipes
//
//  Created by Daniel K. Poulsen on 24/12/2017.
//  Copyright © 2017 dkp. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base : UIImage{
    static func image(url : URL) -> Observable<UIImage?>{
        let request = URLRequest(url: url)
        return URLSession.shared.rx.data(request: request).map{UIImage(data: $0)}.startWith(nil)
    }
}
