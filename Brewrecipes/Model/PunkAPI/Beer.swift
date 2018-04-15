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
	let volume : Volume?
	let boil_volume : Boil_volume?
	let method : Method?
	let ingredients : Ingredients?
	let food_pairing : [String]?
	let brewers_tips : String?
	let contributed_by : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case tagline = "tagline"
		case first_brewed = "first_brewed"
		case description = "description"
		case image_url = "image_url"
		case abv = "abv"
		case ibu = "ibu"
		case target_fg = "target_fg"
		case target_og = "target_og"
		case ebc = "ebc"
		case srm = "srm"
		case ph = "ph"
		case attenuation_level = "attenuation_level"
		case volume = "volume"
		case boil_volume = "boil_volume"
		case method = "method"
		case ingredients = "ingredients"
		case food_pairing = "food_pairing"
		case brewers_tips = "brewers_tips"
		case contributed_by = "contributed_by"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
		first_brewed = try values.decodeIfPresent(String.self, forKey: .first_brewed)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		abv = try values.decodeIfPresent(Double.self, forKey: .abv)
		ibu = try values.decodeIfPresent(Double.self, forKey: .ibu)
		target_fg = try values.decodeIfPresent(Double.self, forKey: .target_fg)
		target_og = try values.decodeIfPresent(Double.self, forKey: .target_og)
		ebc = try values.decodeIfPresent(Double.self, forKey: .ebc)
		srm = try values.decodeIfPresent(Double.self, forKey: .srm)
		ph = try values.decodeIfPresent(Double.self, forKey: .ph)
		attenuation_level = try values.decodeIfPresent(Double.self, forKey: .attenuation_level)
		volume = try Volume(from: decoder)
		boil_volume = try Boil_volume(from: decoder)
		method = try Method(from: decoder)
		ingredients = try Ingredients(from: decoder)
		food_pairing = try values.decodeIfPresent([String].self, forKey: .food_pairing)
		brewers_tips = try values.decodeIfPresent(String.self, forKey: .brewers_tips)
		contributed_by = try values.decodeIfPresent(String.self, forKey: .contributed_by)
	}

}
