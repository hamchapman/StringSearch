//
//  main.m
//  3o4
//
//  Created by Hamilton Chapman on 23/09/2013.
//  Copyright (c) 2013 Hamilton Chapman. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum difficulties {
    remedial = 1, easy, medium, hard, insane, impossible
    
} Difficulty;

NSMutableArray *difficultyArrayCreator(Difficulty, NSDictionary *);
bool guessContainsValidSetOfLetters(NSString *, NSString *);
bool isCharInString(NSString *, NSString *);

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSArray *alphabet = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
        
        NSMutableArray *doubles = [[NSMutableArray alloc] init];
        NSMutableArray *triples = [[NSMutableArray alloc] init];
        NSMutableArray *quads = [[NSMutableArray alloc] init];

        NSMutableArray *validDoubles = [[NSMutableArray alloc] init];
        NSMutableArray *validTriples = [[NSMutableArray alloc] init];
        NSMutableArray *validQuads = [[NSMutableArray alloc] init];

        
//        for(NSString *letter in alphabet)
//        {
//            NSString *word1Spaceless = (@"%@", letter);
//            NSString *word1 = [word1Spaceless stringByAppendingString:@" "];
//            
//            for(NSString *letter2 in alphabet)
//            {
//                NSString *word2Spaceless = [word1 stringByAppendingString:(@"%@", letter2)];
//                
//                [doubles addObject:word2Spaceless];
//                
//                NSString *word2 = [word2Spaceless stringByAppendingString:@" "];
//                
//                for(NSString *letter3 in alphabet)
//                {
//                    NSString *word3Spaceless = [word2 stringByAppendingString:(@"%@", letter3)];
//
//                    [triples addObject:word3Spaceless];
//                    
//                    NSString *word3 = [word3Spaceless stringByAppendingString:@" "];
//                    
//                    for(NSString *letter4 in alphabet)
//                    {
//                        NSString *word4Spaceless = [word3 stringByAppendingString:(@"%@", letter4)];
//                        
//                        [quads addObject:word4Spaceless];
//                    }
//                }
//            }
//        }
        
        
        
        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                         encoding: NSUTF8StringEncoding
                                                            error:NULL];
        
        NSArray *words = [wordString componentsSeparatedByString:@"\n"];
        
        
        NSString *testWord = @"tasteless";
        NSString *letters = @"t s e s";
        
        NSLog(@"%@", guessContainsValidSetOfLetters(testWord, letters));
        
        
        [quads addObject:@"a a a a"];
        [quads addObject:@"a a a c"];
        
        [triples addObject:@"a a a"];
        [triples addObject:@"a a b"];
        [triples addObject:@"a a c"];
        
        for(NSString __strong *quad in quads)
        {
            NSInteger numberOfOccurrences = 0;

            for(NSString *word in words)
            {
                if(guessContainsValidSetOfLetters(word, quad))
                {
                    numberOfOccurrences++;
                    NSLog(@"%@", word);
                }
            }

            NSString *numOfOccString = [NSString stringWithFormat:@"%ld", (long)numberOfOccurrences];

            if(numberOfOccurrences > 0)
            {
                quad = [quad stringByAppendingString:@" "];
                quad = [quad stringByAppendingString:(@"%lu", numOfOccString)];
                [validDoubles addObject:quad];
            }
        }
        
        
        
        for(NSString __strong *trip in triples)
        {
            NSInteger numberOfOccurrences = 0;
            
            for(NSString *word in words)
            {
                if(guessContainsValidSetOfLetters(word, trip))
                {
                    numberOfOccurrences++;
                }
            }
            
            NSString *numOfOccString = [NSString stringWithFormat:@"%ld", (long)numberOfOccurrences];
            
            if(numberOfOccurrences > 0)
            {
                trip = [trip stringByAppendingString:@" "];
                trip = [trip stringByAppendingString:(@"%lu", numOfOccString)];
                [validTriples addObject:trip];
            }
        }

        
        
//        for(NSString __strong *doub in doubles)
//        {
//            NSInteger numberOfOccurrences = 0;
//
//            for(NSString *word in words)
//            {
//                if(guessContainsValidSetOfLetters(word, doub))
//                {
//                    numberOfOccurrences++;
//                }
//            }
//            
//            NSString *numOfOccString = [NSString stringWithFormat:@"%ld", (long)numberOfOccurrences];
//            
//            if(numberOfOccurrences > 0)
//            {
//                doub = [doub stringByAppendingString:@" "];
//                doub = [doub stringByAppendingString:(@"%lu", numOfOccString)];
//                [validDoubles addObject:doub];
//            }
//        }
//        
//        for(NSString __strong *triple in triples)
//        {
//            NSInteger numberOfOccurrences = 0;
//            
//            for(NSString *word in words)
//            {
//                if(guessContainsValidSetOfLetters(word, triple))
//                {
//                    numberOfOccurrences++;
//                }
//            }
//            
//            NSString *numOfOccString = [NSString stringWithFormat:@"%ld", (long)numberOfOccurrences];
//            
//            if(numberOfOccurrences > 0)
//            {
//                triple = [triple stringByAppendingString:@" "];
//                triple = [triple stringByAppendingString:(@"%lu", numOfOccString)];
//                [validTriples addObject:triple];
//            }
//        }
//        
//        for(NSString __strong *quad in quads)
//        {
//            NSInteger numberOfOccurrences = 0;
//            
//            for(NSString *word in words)
//            {
//                if(guessContainsValidSetOfLetters(word, quad))
//                {
//                    numberOfOccurrences++;
//                }
//            }
//            
//            NSString *numOfOccString = [NSString stringWithFormat:@"%ld", (long)numberOfOccurrences];
//            
//            if(numberOfOccurrences > 0)
//            {
//                quad = [quad stringByAppendingString:@" "];
//                quad = [quad stringByAppendingString:(@"%lu", numOfOccString)];
//                [validQuads addObject:quad];
//            }
//        }
//        
        NSString *listOfValidDoubles = [NSString stringWithFormat:@"%@", [validDoubles componentsJoinedByString:@"\n"]];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex: 0];
        NSString *doublesFile = [docDir stringByAppendingPathComponent: @"ValidDoubles.txt"];
        
        [listOfValidDoubles writeToFile: doublesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];

        NSString *listOfValidTriples = [NSString stringWithFormat:@"%@", [validTriples componentsJoinedByString:@"\n"]];
        NSString *triplesFile = [docDir stringByAppendingPathComponent: @"ValidTriples.txt"];
        
        [listOfValidTriples writeToFile: triplesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
//
//        NSString *listOfValidQuads = [NSString stringWithFormat:@"%@", [validQuads componentsJoinedByString:@"\n"]];
//        NSString *quadsFile = [docDir stringByAppendingPathComponent: @"ValidQuads.txt"];
//        
//        [listOfValidQuads writeToFile: quadsFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
    }
    return 0;
}


NSMutableArray *difficultyArrayCreator(Difficulty chosenDifficulty, NSDictionary *tripleOccurrences)
{
    NSMutableArray *triples = [[NSMutableArray alloc] init];
    
    int upperLimit = 0;
    int lowerLimit = 0;
    
    switch (chosenDifficulty)
    {
        case remedial:
            upperLimit = 100000;
            lowerLimit = 10000;
            break;
        case easy:
            upperLimit = 10000;
            lowerLimit = 5000;
            break;
        case medium:
            upperLimit = 5000;
            lowerLimit = 1000;
            break;
        case hard:
            upperLimit = 1000;
            lowerLimit = 250;
            break;
        case insane:
            upperLimit = 250;
            lowerLimit = 10;
            break;
        case impossible:
            upperLimit = 10;
            lowerLimit = 0;
            break;
        default:
            upperLimit = 100000;
            lowerLimit = 0;
            break;
    }
    
    for(NSString *key in tripleOccurrences)
    {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber * numOfOccs = [f numberFromString:tripleOccurrences[key]];
        
        NSNumber *lowLimit = [NSNumber numberWithInteger:lowerLimit];
        NSNumber *uppLimit = [NSNumber numberWithInteger:upperLimit];
        
        if(numOfOccs > lowLimit && numOfOccs < uppLimit)
        {
            [triples addObject:key];
        }
    }
    
    return triples;
}


bool isCharInString(NSString *charToCheck, NSString *stringToCheckForChar)
{
    return [stringToCheckForChar rangeOfString:charToCheck options:NSCaseInsensitiveSearch].location != NSNotFound;
}


bool guessContainsValidSetOfLetters(NSString *guess, NSString *setOfLetters)
{
    bool validGuess = false;
    
    NSInteger numOfLettersInSet = setOfLetters.length - (setOfLetters.length / 2);
    NSInteger numOfCurrentLetter = 1;
    NSString *stringToCheckForChar = guess;
    
    while(!validGuess && numOfCurrentLetter <= numOfLettersInSet)
    {
        NSRange letterToCheck = {2 * numOfCurrentLetter - 2, 1};
        NSString *charToCheck = [setOfLetters substringWithRange:letterToCheck];
        
        if(numOfCurrentLetter == 1)
        {
            NSInteger letterLocationInWord = [guess rangeOfString:[setOfLetters substringWithRange:letterToCheck] options:NSCaseInsensitiveSearch].location;
        }
        else
        {
            NSInteger letterLocationInWord = [guess rangeOfString:[setOfLetters substringWithRange:letterToCheck] options:NSCaseInsensitiveSearch].location;
        }
        
        if(isCharInString(charToCheck, stringToCheckForChar))
        {
            if((letterLocationInWord == [guess length] - 1) && numOfCurrentLetter < numOfLettersInSet)
            {
                return validGuess;
            }
            
            NSRange rangeToCheckNext = {letterLocationInWord + 1, [guess length] - (letterLocationInWord+ 1)};
            stringToCheckForChar = [guess substringWithRange:rangeToCheckNext];
            
            if(numOfCurrentLetter == numOfLettersInSet)
            {
                validGuess = true;
            }
        }
        else
        {
            return validGuess;
        }
        numOfCurrentLetter++;
    }
    return validGuess;
}



//bool guessContainsValidTriple(NSString *randomTriple, NSRange firstLetter, NSRange secondLetter, NSRange thirdLetter, NSString *guess)
//{
//    bool validGuess = false;
//    
//    NSString *firstLetterOfTriple = [randomTriple substringWithRange:firstLetter];
//    NSString *secondLetterOfTriple = [randomTriple substringWithRange:secondLetter];
//    NSString *thirdLetterOfTriple = [randomTriple substringWithRange:thirdLetter];
//
//    if(isCharInString(guess, firstLetterOfTriple))
//    {
//        
//        NSInteger firstLetterLocation = [guess rangeOfString:[randomTriple substringWithRange:firstLetter] options:NSCaseInsensitiveSearch].location;
//        
//        if(firstLetterLocation == [guess length] - 1)
//        {
//            return validGuess;
//        }
//        
//        NSRange rangeForSecondLetter = {firstLetterLocation + 1, [guess length] - (firstLetterLocation + 1)};
//        
//        NSString *stringToCheckForSecondLetter = [guess substringWithRange:rangeForSecondLetter];
//        
//        if(isCharInString(stringToCheckForSecondLetter, secondLetterOfTriple))
//        {
//            NSInteger secondLetterLocation = [stringToCheckForSecondLetter rangeOfString:[randomTriple substringWithRange:secondLetter] options:NSCaseInsensitiveSearch].location + firstLetterLocation + 1;
//            
//            if(secondLetterLocation == [guess length] - 1)
//            {
//                return validGuess;
//            }
//            
//            NSRange rangeForThirdLetter = {secondLetterLocation + 1, [guess length] - (secondLetterLocation + 1)};
//            
//            NSString *stringToCheckForThirdLetter = [guess substringWithRange:rangeForThirdLetter];
//            
//            if(isCharInString(stringToCheckForThirdLetter, thirdLetterOfTriple))
//            {
//                validGuess = true;
//            }
//        }
//    }
//    
//    return validGuess;
//}
