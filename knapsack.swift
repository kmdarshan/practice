import UIKit

struct CakeType {
    let weight: UInt
    let value: UInt
}

enum CakeThiefError: Error, CustomStringConvertible {

    case infinity

    var description: String {
        return "Max value is infinity!"
    }
}

func maxDuffelBagValue(for cakeTypes: [CakeType], withCapacity weightCapacity: UInt) throws -> UInt {
	
	var maxValuesAtCapacities:[UInt] = Array(repeating: 0, count: Int(weightCapacity) + 1)
	
	for currentCapacity in 0...weightCapacity {
		var currentMaxValue: Int = 0
		for cakeType in cakeTypes {
			// if a cake weighs 0 and has a positive value the value of our duffel bag is infinite!
            if cakeType.weight == 0 && cakeType.value != 0 {
                throw CakeThiefError.infinity
            }

			if cakeType.weight <= currentCapacity {
				// so we check: should we use the cake or not?
                // if we use the cake, the most kilograms we can include in addition to the cake
                // we're adding is the current capacity minus the cake's weight. we find the max
                // value at that integer capacity in our array maxValuesAtCapacities
                let maxValueUsingCake = cakeType.value
                    + maxValuesAtCapacities[Int(currentCapacity - cakeType.weight)]
				
				print("maxValueUsingCake ",maxValueUsingCake, " cakeWeight ",cakeType.weight, " currentCapacity ",currentCapacity, Int(currentCapacity - cakeType.weight))
				
				currentMaxValue = max(Int(maxValueUsingCake), currentMaxValue)
			}
		}
		// add each capacity's max value to our array so we can use them
        // when calculating all the remaining capacities
		maxValuesAtCapacities[Int(currentCapacity)] = UInt(currentMaxValue)
		print("currentMaxValue ", currentMaxValue, " currentCapacity ", currentCapacity)
		print("-----")
	}

    return maxValuesAtCapacities[Int(weightCapacity)]
}

let cakeTypes = [
	CakeType(weight: 4, value: 4),
	CakeType(weight: 5, value: 5)
]
let actual = try? maxDuffelBagValue(for: cakeTypes, withCapacity: 9)
