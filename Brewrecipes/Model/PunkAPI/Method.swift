//
//  Created by Daniel K. Poulsen on 13/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation
struct Method : Codable {
	let mash_temp : [MashTemp]?
	let fermentation : Fermentation?
	let twist : String?
}
