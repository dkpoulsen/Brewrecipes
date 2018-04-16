//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
struct Ingredients : Codable {
	let malt : [Malt]?
	let hops : [Hops]?
	let yeast : String?

	enum CodingKeys: String, CodingKey {

		case malt = "malt"
		case hops = "hops"
		case yeast = "yeast"
	}
}
