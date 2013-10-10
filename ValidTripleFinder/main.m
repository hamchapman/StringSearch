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
bool wordContainsLetters(NSString *, NSString *, NSRegularExpression *);
NSRegularExpression *createRegexFromLetters(NSString *);
bool lettersAreInWord (NSString *, NSString *);

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSLog(@"Staring program now");
        
        NSArray *alphabet = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
        
        NSMutableArray *doubles = [[NSMutableArray alloc] init];
        NSMutableArray *triples = [[NSMutableArray alloc] init];
        NSMutableArray *quads = [[NSMutableArray alloc] init];

        NSMutableArray *validDoubles = [[NSMutableArray alloc] init];
        NSMutableArray *validTriples = [[NSMutableArray alloc] init];
        NSMutableArray *validQuads = [[NSMutableArray alloc] init];

        
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
        
        NSLog(@"Now the regex solution is starting");
        NSLog(@"*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n");
        
        for(NSString __strong *doub in doubles)
        {
            NSInteger numberOfOccurrences = 0;
            
            NSRegularExpression *regex = createRegexFromLetters(doub);
            
            for(NSString *word in words)
            {
                if(wordContainsLetters(word, doub, regex))
                {
                    numberOfOccurrences++;
                }
            }
            
            NSString *numOfOccString = [NSString stringWithFormat:@"%ld", (long)numberOfOccurrences];
            
            if(numberOfOccurrences > 0)
            {
                doub = [doub stringByAppendingString:@" "];
                doub = [doub stringByAppendingString:(@"%lu", numOfOccString)];
                [validDoubles addObject:doub];
            }
        }
 
        NSLog(@"Now the regex solution has finised");
        NSLog(@"*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n");
        
        NSLog(@"Now the non-regex solution is starting");
        NSLog(@"*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n");
        
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
                [validDoubles addObject:doub];
            }
        }
        
        NSLog(@"Now the non-regex solution has finished");
        NSLog(@"*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n*\n");
        
        
//        for(NSString __strong *triple in triples)
//        {
//            NSInteger numberOfOccurrences = 0;
//            
//            for(NSString *word in words)
//            {
//                if(wordContainsLetters(word, triple))
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
//                if(wordContainsLetters(word, quad))
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
        
        NSString *listOfValidDoubles = [NSString stringWithFormat:@"%@", [validDoubles componentsJoinedByString:@"\n"]];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex: 0];
        NSString *doublesFile = [docDir stringByAppendingPathComponent: @"ValidDoubles.txt"];
        
        [listOfValidDoubles writeToFile: doublesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];

//        NSString *listOfValidTriples = [NSString stringWithFormat:@"%@", [validTriples componentsJoinedByString:@"\n"]];
//        NSString *triplesFile = [docDir stringByAppendingPathComponent: @"ValidTriples.txt"];
//        
//        [listOfValidTriples writeToFile: triplesFile atomically: NO encoding:NSUTF8StringEncoding error:NULL];
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

NSRegularExpression *createRegexFromLetters(NSString *setOfLetters)
{
    NSString *regexString = @".*";
    for (NSString *letter in letters(setOfLetters))
    {
        regexString = [regexString stringByAppendingString:letter];
        regexString = [regexString stringByAppendingString:@".*"];
    }
    return [NSRegularExpression regularExpressionWithPattern:(@"%@", regexString)
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
}

bool wordContainsLetters(NSString *word, NSString *setOfLetters, NSRegularExpression *regex)
{
    return [regex numberOfMatchesInString:word options:0 range:NSMakeRange(0, [word length])] > 0;
}