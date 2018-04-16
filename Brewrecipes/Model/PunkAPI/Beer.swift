//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
struct Beer : Codable {
	let id : Int?
	let name : String?
	let tagline : String?
	let first_brewed : String?
	let description : String?
	let image_url : String?
	let abv : Double?
	let ibu : Double?
	let target_fg : Double?
	let target_og : Double?
	let ebc : Double?
	let srm : Double?
	let ph : Double?
	let attenuation_level : Double?
	let volume : Amount?
	let boil_volume : Amount?
	let method : Method?
	let ingredients : Ingredients?
	let food_pairing : [String]?
	let brewers_tips : String?
	let contributed_by : String?
}
