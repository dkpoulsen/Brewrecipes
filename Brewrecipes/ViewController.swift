//
//  ViewController.swift
//  Brew recipes
//
//  Created by Daniel K. Poulsen on 23/12/2017.
//  Copyright © 2017 dkp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let punk = PunkAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        punk.search().subscribe(onNext : {
            print($0)
        }, onError :{
            print($0)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

