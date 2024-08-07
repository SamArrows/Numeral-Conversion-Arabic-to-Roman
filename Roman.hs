{-
Code to convert an integer to a Roman numeral
-If the value does not start with 4 or 9, select the symbol of the maximal value that can be subtracted from the input, append that symbol to the result, subtract its value, and convert the remainder to a Roman numeral.
-If the value starts with 4 or 9 use the subtractive form representing one symbol subtracted from the following symbol, for example, 4 is 1 (I) less than 5 (V): IV and 9 is 1 (I) less than 10 (X): IX. Only the following subtractive forms are used: 4 (IV), 9 (IX), 40 (XL), 90 (XC), 400 (CD) and 900 (CM).
-Only powers of 10 (I, X, C, M) can be appended consecutively at most 3 times to represent multiples of 10. You cannot append 5 (V), 50 (L), or 500 (D) multiple times. If you need to append a symbol 4 times use the subtractive form.
-}
    
{-
Code to convert an integer to a Roman numeral
-If the value does not start with 4 or 9, select the symbol of the maximal value that can be subtracted from the input, append that symbol to the result, subtract its value, and convert the remainder to a Roman numeral.
-If the value starts with 4 or 9 use the subtractive form representing one symbol subtracted from the following symbol, for example, 4 is 1 (I) less than 5 (V): IV and 9 is 1 (I) less than 10 (X): IX. Only the following subtractive forms are used: 4 (IV), 9 (IX), 40 (XL), 90 (XC), 400 (CD) and 900 (CM).
-Only powers of 10 (I, X, C, M) can be appended consecutively at most 3 times to represent multiples of 10. You cannot append 5 (V), 50 (L), or 500 (D) multiple times. If you need to append a symbol 4 times use the subtractive form.
-}
    
convFour :: Int -> String
convFour x
    | x < 4000 = (multiplyChar (x `div` 1000) "M") ++ convertThreeDigs (x `mod` 1000)
    | otherwise = "not covered by algorithm"

convertThreeDigs :: Int -> String
convertThreeDigs x
    | x < 400 = (multiplyChar (x `div` 100) "C") ++ convertTwoDigs (x `mod` 100)
    | x < 500 = "CD" ++ convertThreeDigs (x `mod` 100)
    | x < 900 = "D" ++ convertThreeDigs (x - 500)
    | x < 1000 = "CM" ++ convertThreeDigs(x - 900)
    | otherwise = "0"

convertTwoDigs :: Int -> String
convertTwoDigs x
    | x < 40 = (multiplyChar (x `div` 10) "X") ++ convertDigit (x `mod` 10)
    | x < 50 = "XL" ++ convertTwoDigs (x `mod` 10)
    | x < 90 = "L" ++ convertTwoDigs (x - 50)
    | x < 100 = "XC" ++ convertTwoDigs (x - 90)
    | otherwise = "0"
    
convertDigit :: Int -> String
convertDigit x
    | x == 0 = ""
    | x < 4 = multiplyChar x "I"
    | x == 4 = "IV"
    | x < 9 = "V" ++ multiplyChar (x-5) "I"
    | otherwise = "IX"

multiplyChar :: Int -> String -> String
multiplyChar x y
    | x == 1 = y
    | x < 1 = ""
    | otherwise = y ++ multiplyChar (x-1) y

main :: IO()
main =
    print(convFour 900)
    
    
    
    