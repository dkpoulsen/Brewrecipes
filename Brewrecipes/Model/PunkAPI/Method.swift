//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
struct Method : Codable {
	let mash_temp : [Mash_temp]?
	let fermentation : Fermentation?
	let twist : String?

	enum CodingKeys: String, CodingKey {

		case mash_temp = "mash_temp"
		case fermentation
		case twist = "twist"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		mash_temp = try values.decodeIfPresent([Mash_temp].self, forKey: .mash_temp)
		fermentation = try Fermentation(from: decoder)
		twist = try values.decodeIfPresent(String.self, forKey: .twist)
	}

}
