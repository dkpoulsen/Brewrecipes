//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
struct Malt : Codable {
	let name : String?
	let amount : Amount?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case amount
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		amount = try Amount(from: decoder)
	}

}
