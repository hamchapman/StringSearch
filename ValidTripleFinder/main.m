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
NSInteger numberOfLettersInSet(NSString *);
NSArray *letters(NSString *);
bool lettersAreInWord (NSString *, NSString *);

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSArray *alphabet = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
        
        NSMutableArray *doubles = [[NSMutableArray alloc] init];
        NSMutableArray *triples = [[NSMutableArray alloc] init];
        NSMutableArray *quads = [[NSMutableArray alloc] init];
        
        NSMutableArray *remedialDoubles = [[NSMutableArray alloc] init];
        NSMutableArray *easyDoubles = [[NSMutableArray alloc] init];
        NSMutableArray *mediumDoubles = [[NSMutableArray alloc] init];
        NSMutableArray *hardDoubles = [[NSMutableArray alloc] init];
        NSMutableArray *insaneDoubles = [[NSMutableArray alloc] init];
        NSMutableArray *impossibleDoubles = [[NSMutableArray alloc] init];
        
        NSMutableArray *remedialTriples = [[NSMutableArray alloc] init];
        NSMutableArray *easyTriples = [[NSMutableArray alloc] init];
        NSMutableArray *mediumTriples = [[NSMutableArray alloc] init];
        NSMutableArray *hardTriples = [[NSMutableArray alloc] init];
        NSMutableArray *insaneTriples = [[NSMutableArray alloc] init];
        NSMutableArray *impossibleTriples = [[NSMutableArray alloc] init];
        
        NSMutableArray *remedialQuads = [[NSMutableArray alloc] init];
        NSMutableArray *easyQuads = [[NSMutableArray alloc] init];
        NSMutableArray *mediumQuads = [[NSMutableArray alloc] init];
        NSMutableArray *hardQuads = [[NSMutableArray alloc] init];
        NSMutableArray *insaneQuads = [[NSMutableArray alloc] init];
        NSMutableArray *impossibleQuads = [[NSMutableArray alloc] init];

        
        for(NSString *letter in alphabet)
        {
            NSString *word1Spaceless = (@"%@", letter);
            NSString *word1 = [word1Spaceless stringByAppendingString:@" "];
            
            for(NSString *letter2 in alphabet)
            {
                NSString *word2Spaceless = [word1 stringByAppendingString:(@"%@", letter2)];
                
                [doubles addObject:word2Spaceless];
                
                NSString *word2 = [word2Spaceless stringByAppendingString:@" "];
                
                for(NSString *letter3 in alphabet)
                {
                    NSString *word3Spaceless = [word2 stringByAppendingString:(@"%@", letter3)];

                    [triples addObject:word3Spaceless];
                    
                    NSString *word3 = [word3Spaceless stringByAppendingString:@" "];
                    
                    for(NSString *letter4 in alphabet)
                    {
                        NSString *word4Spaceless = [word3 stringByAppendingString:(@"%@", letter4)];
                        
                        [quads addObject:word4Spaceless];
                    }
                }
            }
        }
        
        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                         encoding: NSUTF8StringEncoding
                                                            error:NULL];
        
        NSArray *words = [wordString componentsSeparatedByString:@"\n"];
        
        for(NSString __strong *doub in doubles)
        {
            NSInteger numberOfOccurrences = 0;
            
            for(NSString *word in words)
            {
                if(lettersAreInWord(word, doub))
                {
                    numberOfOccurrences++;
                }
            }
            
            NSString *numOfOccString = [NSString stringWithFormat:@"%ld", (long)numberOfOccurrences];
            
            if(numberOfOccurrences > 0)
            {
                doub = [doub stringByAppendingString:@" "];
                doub = [doub stringByAppendingString:(@"%lu", numOfOccString)];
                
                if(numberOfOccurrences > 20000)
                {
                    [remedialDoubles addObject:doub];
                }
                else if (numberOfOccurrences > 10000)
                {
                    [easyDoubles addObject:doub];
                }
                else if (numberOfOccurrences > 5000)
                {
                    [mediumDoubles addObject:doub];
                }
                else if (numberOfOccurrences > 1000)
                {
                    [hardDoubles addObject:doub];
                }
                else if (numberOfOccurrences > 500)
                {
                    [insaneDoubles addObject:doub];
                }
                else
                {
                    [impossibleDoubles addObject:doub];
                }

            }
        }
        
        for(NSString __strong *triple in triples)
        {
            NSInteger numberOfOccurrences = 0;
            
            for(NSString *word in words)
            {
                if(lettersAreInWord(word, triple))
                {
                    numberOfOccurrences++;
                }
            }
            
            NSString *numOfOccString = [NSString stringWithFormat:@"%ld", (long)numberOfOccurrences];
            
            if(numberOfOccurrences > 0)
            {
                triple = [triple stringByAppendingString:@" "];
                triple = [triple stringByAppendingString:(@"%lu", numOfOccString)];
                
                if(numberOfOccurrences > 10000)
                {
                    [remedialTriples addObject:triple];
                }
                else if (numberOfOccurrences > 5000)
                {
                    [easyTriples addObject:triple];
                }
                else if (numberOfOccurrences > 1000)
                {
                    [mediumTriples addObject:triple];
                }
                else if (numberOfOccurrences > 250)
                {
                    [hardTriples addObject:triple];
                }
                else if (numberOfOccurrences > 10)
                {
                    [insaneTriples addObject:triple];
                }
                else
                {
                    [impossibleTriples addObject:triple];
                }
                
            }

        }

        for(NSString __strong *quad in quads)
        {
            NSInteger numberOfOccurrences = 0;
            
            for(NSString *word in words)
            {
                if(lettersAreInWord(word, quad))
                {
                    numberOfOccurrences++;
                }
            }
            
            NSString *numOfOccString = [NSString stringWithFormat:@"%ld", (long)numberOfOccurrences];
            
            if(numberOfOccurrences > 0)
            {
                quad = [quad stringByAppendingString:@" "];
                quad = [quad stringByAppendingString:(@"%lu", numOfOccString)];
                
                if(numberOfOccurrences > 1500)
                {
                    [remedialQuads addObject:quad];
                }
                else if (numberOfOccurrences > 500)
                {
                    [easyQuads addObject:quad];
                }
                else if (numberOfOccurrences > 100)
                {
                    [mediumQuads addObject:quad];
                }
                else if (numberOfOccurrences > 22)
                {
                    [hardQuads addObject:quad];
                }
                else if (numberOfOccurrences > 7)
                {
                    [insaneQuads addObject:quad];
                }
                else
                {
                    [impossibleQuads addObject:quad];
                }
            }
        }
            
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex: 0];
        
        NSString *listOfRemedialDoubles = [NSString stringWithFormat:@"%@", [remedialDoubles componentsJoinedByString:@"\n"]];
        NSString *remedialDoublesFile = [docDir stringByAppendingPathComponent: @"RemedialDoubles.txt"];
        [listOfRemedialDoubles writeToFile: remedialDoublesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfEasyDoubles = [NSString stringWithFormat:@"%@", [easyDoubles componentsJoinedByString:@"\n"]];
        NSString *easyDoublesFile = [docDir stringByAppendingPathComponent: @"EasyDoubles.txt"];
        [listOfEasyDoubles writeToFile: easyDoublesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfMediumDoubles = [NSString stringWithFormat:@"%@", [mediumDoubles componentsJoinedByString:@"\n"]];
        NSString *mediumDoublesFile = [docDir stringByAppendingPathComponent: @"MediumDoubles.txt"];
        [listOfMediumDoubles writeToFile: mediumDoublesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfHardDoubles = [NSString stringWithFormat:@"%@", [hardDoubles componentsJoinedByString:@"\n"]];
        NSString *hardDoublesFile = [docDir stringByAppendingPathComponent: @"HardDoubles.txt"];
        [listOfHardDoubles writeToFile: hardDoublesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfInsaneDoubles = [NSString stringWithFormat:@"%@", [insaneDoubles componentsJoinedByString:@"\n"]];
        NSString *insaneDoublesFile = [docDir stringByAppendingPathComponent: @"InsaneDoubles.txt"];
        [listOfInsaneDoubles writeToFile: insaneDoublesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfImpossibleDoubles = [NSString stringWithFormat:@"%@", [impossibleDoubles componentsJoinedByString:@"\n"]];
        NSString *impossibleDoublesFile = [docDir stringByAppendingPathComponent: @"ImpossibleDoubles.txt"];
        [listOfImpossibleDoubles writeToFile: impossibleDoublesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfRemedialTriples = [NSString stringWithFormat:@"%@", [remedialTriples componentsJoinedByString:@"\n"]];
        NSString *remedialTriplesFile = [docDir stringByAppendingPathComponent: @"RemedialTriples.txt"];
        [listOfRemedialTriples writeToFile: remedialTriplesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfEasyTriples = [NSString stringWithFormat:@"%@", [easyTriples componentsJoinedByString:@"\n"]];
        NSString *easyTriplesFile = [docDir stringByAppendingPathComponent: @"EasyTriples.txt"];
        [listOfEasyTriples writeToFile: easyTriplesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfMediumTriples= [NSString stringWithFormat:@"%@", [mediumTriples componentsJoinedByString:@"\n"]];
        NSString *mediumTriplesFile = [docDir stringByAppendingPathComponent: @"MediumTriples.txt"];
        [listOfMediumTriples writeToFile: mediumTriplesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfHardTriples = [NSString stringWithFormat:@"%@", [hardTriples componentsJoinedByString:@"\n"]];
        NSString *hardTriplesFile = [docDir stringByAppendingPathComponent: @"HardTriples.txt"];
        [listOfHardTriples writeToFile: hardTriplesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfInsaneTriples = [NSString stringWithFormat:@"%@", [insaneTriples componentsJoinedByString:@"\n"]];
        NSString *insaneTriplesFile = [docDir stringByAppendingPathComponent: @"InsaneTriples.txt"];
        [listOfInsaneTriples writeToFile: insaneTriplesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfImpossibleTriples = [NSString stringWithFormat:@"%@", [impossibleTriples componentsJoinedByString:@"\n"]];
        NSString *impossibleTriplesFile = [docDir stringByAppendingPathComponent: @"ImpossibleTriples.txt"];
        [listOfImpossibleTriples writeToFile: impossibleTriplesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfRemedialQuads = [NSString stringWithFormat:@"%@", [remedialQuads componentsJoinedByString:@"\n"]];
        NSString *remedialQuadsFile = [docDir stringByAppendingPathComponent: @"RemedialQuads.txt"];
        [listOfRemedialQuads writeToFile: remedialQuadsFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfEasyQuads = [NSString stringWithFormat:@"%@", [easyQuads componentsJoinedByString:@"\n"]];
        NSString *easyQuadsFile = [docDir stringByAppendingPathComponent: @"EasyQuads.txt"];
        [listOfEasyQuads writeToFile: easyQuadsFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfMediumQuads = [NSString stringWithFormat:@"%@", [mediumQuads componentsJoinedByString:@"\n"]];
        NSString *mediumQuadsFile = [docDir stringByAppendingPathComponent: @"MediumQuads.txt"];
        [listOfMediumQuads writeToFile: mediumQuadsFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfHardQuads = [NSString stringWithFormat:@"%@", [hardQuads componentsJoinedByString:@"\n"]];
        NSString *hardQuadsFile = [docDir stringByAppendingPathComponent: @"HardQuads.txt"];
        [listOfHardQuads writeToFile: hardQuadsFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfInsaneQuads = [NSString stringWithFormat:@"%@", [insaneQuads componentsJoinedByString:@"\n"]];
        NSString *insaneQuadsFile = [docDir stringByAppendingPathComponent: @"InsaneQuads.txt"];
        [listOfInsaneQuads writeToFile: insaneQuadsFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *listOfImpossibleQuads = [NSString stringWithFormat:@"%@", [impossibleQuads componentsJoinedByString:@"\n"]];
        NSString *impossibleQuadsFile = [docDir stringByAppendingPathComponent: @"ImpossibleQuads.txt"];
        [listOfImpossibleQuads writeToFile: impossibleQuadsFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
        
    }
    return 0;
}

NSInteger numberOfLettersInSet(NSString *setOfLetters)
{
    return [letters(setOfLetters) count];
}

NSArray *letters(NSString *setOfLetters)
{
    return [setOfLetters componentsSeparatedByString:@" "];
}

bool lettersAreInWord (NSString *word, NSString *setOfLetters)
{
    if(setOfLetters.length == 1)
    {
        return [word rangeOfString:setOfLetters options:NSCaseInsensitiveSearch].location != NSNotFound;
    }
    
    if([word rangeOfString:[setOfLetters substringToIndex:1] options:NSCaseInsensitiveSearch].location != NSNotFound)
    {
        NSString *newWord = [word substringFromIndex:[word rangeOfString:[setOfLetters substringToIndex:1] options:NSCaseInsensitiveSearch].location + 1];
        word = [word substringFromIndex:[word rangeOfString:[setOfLetters substringToIndex:1] options:NSCaseInsensitiveSearch].location];
        return lettersAreInWord(newWord, [setOfLetters substringFromIndex:2]);
    }
    else
    {
        return false;
    }
}