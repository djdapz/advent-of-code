//
// Created by Devon DaPuzzo on 12/26/20.
//

import Foundation

class BagMap {

    var map: [String: BagDetails] = [:]

    public init(_ strings: [String]) {

        strings.forEach { s in

            let components = s.components(separatedBy: " bags contain ")
            let parentName = components.first!
            map.addIfNotYetPresent(key: parentName, value: BagDetails(bagName: parentName))

            guard components[1] != "no other bags." else {
                return
            }

            let childBags = components[1]
                .replacingOccurrences(of: ".", with: "")
                .components(separatedBy: ", ")

            let childBagDetails: [(String, Int)] = childBags.map { child in
                let childComponents = child.components(separatedBy: " ")

                guard let count = Int(childComponents[0]) else {
                    fatalError("couldn't parse number: \(childComponents[0])")
                }
                return (childComponents[1] + " " + childComponents[2], count)
            }

            childBagDetails.forEach { (childName, amount) in
                map.addIfNotYetPresent(key: childName, value: BagDetails(bagName: childName))

                let childDetails: BagDetails = map[childName]!
                let childPairing = Pairing(bag: childDetails, amount: amount)

                map[parentName]!.children.append(childPairing)
                map[childName]!.parents.append(parentName)
            }
        }
    }

    public func parents(for name: String) -> [String] {
        map[name]!.parents
    }

    public func allAncestors(for name: String) -> Set<String> {
        let personsParents = Set(parents(for: name))

        let ancestors = personsParents.flatMap { parent in
            allAncestors(for: parent)
        }

        return personsParents.union(ancestors)
    }

    public func capacity(for name: String) -> Int {
        let children = map[name]!.children
        guard children.count > 0 else { return 0 }
        let childrenAmounts: [Int] = children.map { pairing in
            pairing.amount * (self.capacity(for: pairing.bag.bagName) + 1)
        }
        let sum: Int = childrenAmounts.sum()
        return sum
    }
}

extension Array where Element == Int {
    func sum() -> Int {
        self.reduce(0) { result, i in result + i }
    }
}


struct BagDetails: Hashable {
    let bagName: String
    var parents: [String] = []
    var children: [Pairing] = []
}

struct Pairing: Hashable {
    let bag: BagDetails
    let amount: Int
}

extension Dictionary {
    mutating func addIfNotYetPresent(key: Key, value: Value) {
        if self[key] == nil {
            self[key] = value
        }
    }
}