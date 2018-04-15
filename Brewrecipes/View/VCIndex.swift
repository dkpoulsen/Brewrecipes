//
//  VCIndex.swift
//  Brewrecipes
//
//  Created by Daniel K. Poulsen on 25/12/2017.
//  Copyright © 2017 dkp. All rights reserved.
//

import UIKit

struct VCIndex {
    
    static var BeerVC : UIViewController{
        return UIStoryboard(name: "Main", bundle: nil) .instantiateViewController(withIdentifier: "beerVC")
    }
}
