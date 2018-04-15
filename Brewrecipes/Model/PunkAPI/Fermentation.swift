//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
struct Fermentation : Codable {
	let temp : Temp?

	enum CodingKeys: String, CodingKey {

		case temp
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		temp = try Temp(from: decoder)
	}

}
