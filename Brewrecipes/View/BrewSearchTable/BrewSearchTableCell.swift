//
//  BrewSearchTableCell.swift
//  Brewrecipes
//
//  Created by Daniel K. Poulsen on 24/12/2017.
//  Copyright © 2017 dkp. All rights reserved.
//

import UIKit
import RxSwift

class BrewSearchTableCell: UITableViewCell {
    let disposeBag = DisposeBag()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descrptionTextView: UITextView!
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    @IBOutlet weak var ebcLabel: UILabel!
    
    var beer : Beer?{
        didSet{
            titleLabel.text = beer?.name
            descrptionTextView.text = beer?.description
            let imageURL = URL(string : beer!.image_url!)!
            UIImage.rx.image(url: imageURL).bind(to: beerImageView.rx.image).disposed(by: disposeBag)
            abvLabel.text = "ABV : \(beer?.abv ?? 0.0)%"
            ibuLabel.text = "IBU : \(beer?.ibu ?? 0.0)"
            ebcLabel.text = "EBC : \(beer?.ebc ?? 0.0)"
        }
    }
}
