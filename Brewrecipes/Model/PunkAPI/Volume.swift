//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
struct Volume : Codable {
	let value : Double?
	let unit : String?

	enum CodingKeys: String, CodingKey {

		case value = "value"
		case unit = "unit"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		value = try values.decodeIfPresent(Double.self, forKey: .value)
		unit = try values.decodeIfPresent(String.self, forKey: .unit)
	}

}
