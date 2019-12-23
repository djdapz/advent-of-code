module Problem6Spec where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Assertions
import           Problem6

problem6Tests :: TestTree
problem6Tests = testGroup "Problem6" [orbitReadingTest]

orbitReadingTest :: TestTree
orbitReadingTest =
  testGroup
    "orbitMap"
    [ testCase
        "i build an orbit map, i can see that B orbits A"
        ("A" `assertEquals` orbitsWhat "B" (newOrbitalMap ["A)B"]))
    , testCase
        "i build an orbit map, i can see that ddd orbits add"
        ("add" `assertEquals` orbitsWhat "ddd" (newOrbitalMap ["A)B", "AAA)BBB", "F)AA", "add)ddd"]))
    , testCase
        "I can have two things orbit the same planet"
        (("A", "A", "A") `assertEquals`
         ( orbitsWhat "B" (newOrbitalMap ["A)B", "A)C", "A)D"])
         , orbitsWhat "C" (newOrbitalMap ["A)B", "A)C", "A)D"])
         , orbitsWhat "D" (newOrbitalMap ["A)B", "A)C", "A)D"])))
    , testCase
        "It knows that D has 3 total orbits, 1 direct and 2 indirect"
        (3 `assertEquals` numberOfOrbits "D" (newOrbitalMap ["COM)A", "A)B", "B)D"]))
    , testCase
        "It knows that we have a total number of 3 + 2 + 1 orbits"
        (6 `assertEquals` totalOrbits (newOrbitalMap ["COM)A", "A)B", "B)D"]))
    , testCase
        "It works on test case from website"
        (42 `assertEquals`
         totalOrbits (newOrbitalMap ["COM)B", "B)C", "C)D", "D)E", "E)F", "B)G", "G)H", "D)I", "E)J", "J)K", "K)L"]))
    ]
