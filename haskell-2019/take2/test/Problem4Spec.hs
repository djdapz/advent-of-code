module Problem4Spec where

import           Test.Tasty
import           Test.Tasty.HUnit

import           Problem4
import           Assertions

problem4Tests :: TestTree
problem4Tests = testGroup "Problem4" [doubleDigitTest, digitsIncreaseTest, passwordRangeFinderTest]

passwordRangeFinderTest :: TestTree
passwordRangeFinderTest =
  testGroup
    "passwordRangeFinder"
    [ testCase
        "should give all possible passwords"
        (assertEquals
           [133446, 133447, 133448, 133449, 133455, 133456, 133457, 133458, 133459]
           (passwordRange 133446 133459))
    ]

doubleDigitTest :: TestTree
doubleDigitTest =
  testGroup
    "doubleDigit"
    [ testGroup
        "2 elements"
        [ testCase "should say same chars do contain double " (assertTrue (containsDoubleDigit "aa"))
        , testCase "should say diff chars dont contain double  " (assertFalse (containsDoubleDigit "ab"))
        , testCase "should say diff chars dont contain double  " (assertFalse (containsDoubleDigit "ba"))
        ]
    , testGroup
        "3 elements"
        [ testCase "should say same chars do contain double " (assertTrue (containsDoubleDigit "aab"))
        , testCase "should say same chars do contain double  " (assertTrue (containsDoubleDigit "abb"))
        , testCase "should say diff chars dont contain double  " (assertFalse (containsDoubleDigit "abc"))
        , testCase "should say tripples are not doubles" (assertFalse (containsDoubleDigit "aaa"))
        ]
    , testGroup
        "4 elements"
        [ testCase "should say double when pair at beginning" (assertTrue (containsDoubleDigit "aabc"))
        , testCase "should say double when pair at middle" (assertTrue (containsDoubleDigit "abbc"))
        , testCase "should say double when pair at end" (assertTrue (containsDoubleDigit "abcc"))
        , testCase "should say no double when no pair" (assertFalse (containsDoubleDigit "abcd"))
        , testCase "should say no double when tripple in beginning" (assertFalse (containsDoubleDigit "aaad"))
        , testCase "should say no double when tripple in end" (assertFalse (containsDoubleDigit "daaa"))
        , testCase "should say no double when four" (assertFalse (containsDoubleDigit "aaaa"))
        ]
    , testGroup
        "5 elements"
        [ testCase "should say double when pair at beginning" (assertTrue (containsDoubleDigit "aabce"))
        , testCase "should say double when pair at middle" (assertTrue (containsDoubleDigit "abbce"))
        , testCase "should say double when pair at end" (assertTrue (containsDoubleDigit "fabcc"))
        , testCase "should say no double when no pair" (assertFalse (containsDoubleDigit "abcde"))
        , testCase "should say no double when tripple in beginning" (assertFalse (containsDoubleDigit "aaade"))
        , testCase "should say no double when tripple in middle" (assertFalse (containsDoubleDigit "daaaf"))
        , testCase "should say no double when tripple in end" (assertFalse (containsDoubleDigit "deaaa"))
        , testCase "should say no double when four at end" (assertFalse (containsDoubleDigit "daaaa"))
        , testCase "should say no double when four at start" (assertFalse (containsDoubleDigit "aaaad"))
        , testCase "should say no double when 5" (assertFalse (containsDoubleDigit "aaaaa"))
        , testCase "should say double when 2:3" (assertTrue (containsDoubleDigit "ddaaa"))
        , testCase "should say double when 3:2" (assertTrue (containsDoubleDigit "aaadd"))
        ]
    , testGroup
        "6 elements"
        [ testCase "should say double when pair at beginning" (assertTrue (containsDoubleDigit "aabcef"))
        , testCase "should say double when pair at middle" (assertTrue (containsDoubleDigit "eabbce"))
        , testCase "should say double when pair at end" (assertTrue (containsDoubleDigit "fdabcc"))
        , testCase "should say no double when no pair" (assertFalse (containsDoubleDigit "abcdae"))
        , testCase "should say no double when tripple in beginning" (assertFalse (containsDoubleDigit "aaade"))
        , testCase "should say no double when tripple in middle" (assertFalse (containsDoubleDigit "edaaaf"))
        , testCase "should say no double when tripple in end" (assertFalse (containsDoubleDigit "edeaaa"))
        , testCase "should say no double when tripple four at end" (assertFalse (containsDoubleDigit "edaaaa"))
        , testCase "should say no double when tripple four at start" (assertFalse (containsDoubleDigit "aaaadg"))
        , testCase "should say no double when tripple four in middle" (assertFalse (containsDoubleDigit "daaaad"))
        , testCase "should say no double when tripple four in middle" (assertFalse (containsDoubleDigit "daaaad"))
        , testCase "should say no double when 5 at start" (assertFalse (containsDoubleDigit "aaaaaf"))
        , testCase "should say no double when 5 at end" (assertFalse (containsDoubleDigit "faaaaa"))
        , testCase "should say no double when 6" (assertFalse (containsDoubleDigit "aaaaaa"))
        , testCase "should say double when 2:4" (assertTrue (containsDoubleDigit "ddaaaa"))
        , testCase "should say double when 1:3:2" (assertTrue (containsDoubleDigit "faaadd"))
        , testCase "should say double when 2:3:1" (assertTrue (containsDoubleDigit "ddaaaf"))
        , testCase "should say double when 4:2" (assertTrue (containsDoubleDigit "aaaadd"))
        ]
    ]

digitsIncreaseTest :: TestTree
digitsIncreaseTest =
  testGroup
    "digitsIncrease"
    [ testCase
        "should tell me if digits increase"
        (assertListIsTrue (map digitsIncrease ["111", "123", "369", "189", "018", "123456789"]))
    , testCase
        "should tell me if digits dont strictly increase"
        (assertListIsFalse (map digitsIncrease ["1230", "3639", "184", "0180", "123456879"]))
    ]

