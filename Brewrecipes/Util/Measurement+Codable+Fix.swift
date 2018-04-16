//
//  Measurement+Codable+Fix.swift
//  Brewrecipes
//
//  Created by Daniel K. Poulsen on 16/04/2018.
//  Copyright © 2018 dkp. All rights reserved.
//

import Foundation

struct MeasurementFix : Codable {
    let value : Double
    let unit : String
}

public extension KeyedDecodingContainer  {
    
    func decode(_ type: Measurement<Unit>.Type, forKey key: K) throws -> Measurement<Unit> {
        let measurementFix = try self.decode(MeasurementFix.self, forKey: key)
        return Measurement(value: measurementFix.value, unit: Unit(symbol: measurementFix.unit))
    }
    
    func decodeIfPresent(_ type: Measurement<Unit>.Type, forKey key: K) throws -> Measurement<Unit>? {
        guard let measurementFix = try? self.decode(MeasurementFix.self, forKey: key) else {
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: [key], debugDescription: "not found"))
        }
        return Measurement(value: measurementFix.value, unit: Unit(symbol: measurementFix.unit))
    }
}
