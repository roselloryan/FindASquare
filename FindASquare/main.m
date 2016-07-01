//
//  main.m
//  FindASquare


#import <Foundation/Foundation.h>


int squaredDistanceBetweenPointArrays(NSArray *firstPoint, NSArray *secondPoint) {
    
    int firstPointX = [[firstPoint objectAtIndex: 0] intValue];
    int firstPointY = [[firstPoint objectAtIndex: 1] intValue];
    int secondPointX = [[secondPoint objectAtIndex: 0] intValue];
    int secondPointY = [[secondPoint objectAtIndex: 1] intValue];
    int xDiff = firstPointX - secondPointX;
    int yDiff = firstPointY - secondPointY;

    return (xDiff * xDiff) + (yDiff * yDiff);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *line = @"(1,6), (6,7), (2,7), (9,1)";
        
        NSMutableArray *arrayOfPointsInParentheses = [[line componentsSeparatedByString:@", "]mutableCopy];
        
        NSArray *pointA = [[NSArray alloc]init];
        NSArray *pointB = [[NSArray alloc]init];
        NSArray *pointC = [[NSArray alloc]init];
        NSArray *pointD = [[NSArray alloc]init];
        
        NSInteger i = 0;
        for (i = 0; i < arrayOfPointsInParentheses.count; i++) {
            
            NSMutableString *pointWithCommaMutString = [arrayOfPointsInParentheses[i] mutableCopy];
            
            NSRange firstParenthRange = NSMakeRange(0, 1);
            NSRange lastParenthRange = NSMakeRange(pointWithCommaMutString.length - 1, 1);
            [pointWithCommaMutString deleteCharactersInRange:lastParenthRange];
            [pointWithCommaMutString deleteCharactersInRange:firstParenthRange];
            
            NSArray *sepArray = [pointWithCommaMutString componentsSeparatedByString:@","];
            if (i == 0) {
                pointA = sepArray;
            }
            else if (i == 1) {
                pointB = sepArray;
            }
            else if (i == 2) {
                pointC = sepArray;
            }
            else {
                pointD = sepArray;
            }
        }
        // Pythagorean Theorum: a^2 + b^2 = c^2
        // No need for srt() to check equal distances
        NSInteger distAB = squaredDistanceBetweenPointArrays(pointA, pointB);
        NSInteger distBC = squaredDistanceBetweenPointArrays(pointB, pointC);
        NSInteger distCD = squaredDistanceBetweenPointArrays(pointC, pointD);
        NSInteger distDA = squaredDistanceBetweenPointArrays(pointD, pointA);
        NSInteger distCA = squaredDistanceBetweenPointArrays(pointC, pointA);
        NSInteger distBD = squaredDistanceBetweenPointArrays(pointB, pointD);
        

        // USE two triangles AB, BC, AC and AD, DC, CA.
        NSInteger t1shortSideOne = 0;
        NSInteger t1shortSideTwo = 0;
        NSInteger t1longSide = 0;
        
        NSInteger t2shortSideOne = 0;
        NSInteger t2shortSideTwo = 0;
        NSInteger t2longSide = 0;
        
        if (distAB > distBC) {
            t1longSide = distAB;
            t1shortSideOne = distBC;
            t1shortSideTwo = distCA;
        }
        else if (distAB < distBC) {
            t1longSide = distBC;
            t1shortSideOne = distAB;
            t1shortSideTwo = distCA;
        }
        else {
            t1longSide = distCA;
            t1shortSideOne = distAB;
            t1shortSideTwo = distBC;
        }
        // Triangle  DA, CD, CA.
        if (distDA > distCD) {
            t2longSide = distDA;
            t2shortSideOne = distCD;
            t2shortSideTwo = distCA;
        }
        else if (distDA < distCD) {
            t2longSide = distCD;
            t2shortSideOne = distDA;
            t2shortSideTwo = distCA;
        }
        else {
            t2longSide = distCA;
            t2shortSideOne = distAB;
            t2shortSideTwo = distBC;
        }
        
//        NSLog(@"%lu, %lu, %lu", t1shortSideOne, t1shortSideTwo, t1longSide);
//        NSLog(@"%lu, %lu, %lu", t2shortSideOne, t2shortSideTwo, t2longSide);
        
        BOOL shortSidesEqual = NO;
        BOOL longSidesEqual = NO;
        
        if (t1shortSideOne == t1shortSideTwo && t2shortSideOne == t2shortSideTwo && t1shortSideOne == t2shortSideOne && t1shortSideOne != 0) {
            shortSidesEqual = YES;
        }
        if (t1longSide == t2longSide) {
            longSidesEqual = YES;
        }
        
        if (shortSidesEqual && longSidesEqual) {
            NSLog(@"true");
        }
        else {
            NSLog(@"false");
        }

        
    }
    return 0;
}
