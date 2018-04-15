//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
struct Mash_temp : Codable {
	let temp : Temp?
	let duration : Double?

	enum CodingKeys: String, CodingKey {

		case temp
		case duration = "duration"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		temp = try Temp(from: decoder)
		duration = try values.decodeIfPresent(Double.self, forKey: .duration)
	}

}
