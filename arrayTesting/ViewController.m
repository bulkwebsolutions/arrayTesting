//
//  ViewController.m
//  arrayTesting
//
//  Created by Alex Cruz on 9/14/15.
//  Copyright (c) 2015 Alex Cruz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //-----Array practice #1
    
    NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                             @"Opel", @"Volkswagen", @"Audi"];
    
    NSArray *ukMakes = [NSArray arrayWithObjects:@"Aston Martin",
                        @"Lotus", @"Jaguar", @"Bentley", nil];
    
    NSLog(@"First german make: %@", germanMakes[0]);
    
    NSLog(@"First U.K. make: %@", [ukMakes objectAtIndex:0]);
    
    //-----Array practice #1 re-write
    
    NSArray *americanMakes = @[@"Chevrolets", @"Buick"];
    
    NSLog(@"First American make: %@", americanMakes[1]);
    
    
    //-----Array practice #2
    
    
    NSArray *germanMakes1 = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                             @"Opel", @"Volkswagen", @"Audi"];
    // With fast-enumeration
    for (NSString *item in germanMakes1) {
        NSLog(@"%@", item);
    }
    
    // With a traditional for loop
    for (int i=0; i < [germanMakes1 count]; i++) {
        NSLog(@"%d: %@", i, germanMakes1[i]);
    }
    
    [germanMakes1 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%ld: %@", idx, obj);
    }];
    
    //-----Array practice #3
    
    
    NSArray *germanMakes2 = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                             @"Opel", @"Volkswagen", @"Audi", @"use"];
    NSArray *sameGermanMakes = [NSArray arrayWithObjects:@"Mercedes-Benz",
                                @"BMW", @"Porsche", @"Opel",
                                @"Volkswagen", @"Audi", nil];
    
    if ([germanMakes2 isEqualToArray:sameGermanMakes]) {
        NSLog(@"Oh good, literal arrays are the same as NSArrays");
    } else {
        NSLog(@"Oh no, literal arrays are not the same as NSArrays");
    }

    
    //-----Array practice #4
    
    
    NSArray *germanMakes3 = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                             @"Opel", @"Volkswagen", @"Audi"];
    // BOOL checking
    if ([germanMakes3 containsObject:@"BMW"]) {
        NSLog(@"BMW is a German auto maker");
    }
    
    
    // Index checking
    NSUInteger index = [germanMakes3 indexOfObject:@"BMW"];
    if (index == NSNotFound) {
        NSLog(@"Well that's not quite right...");
    } else {
        NSLog(@"BMW is a German auto maker and is at index %ld", index);
    }
    
     //-----Array practice #5
    
    NSArray *germanMakes4 = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                             @"Opel", @"Volkswagen", @"Audi"];
    
    NSArray *sortedMakes = [germanMakes4 sortedArrayUsingComparator:
                            ^NSComparisonResult(id obj1, id obj2) {
                                if ([obj1 length] < [obj2 length]) {
                                    return NSOrderedAscending;
                                } else if ([obj1 length] > [obj2 length]) {
                                    return NSOrderedDescending;
                                } else {
                                    return NSOrderedSame;
                                }
                            }];
    
    NSLog(@"%@", sortedMakes);
    
    
    //-----Array practice #6
    
    NSArray *germanMakes5 = @[@"Mercedes-Benz", @"BMWWWWWWww", @"Porsche", @"Opel", @"Volkswagen", @"Audii", @"Volkswagen"];
    
    NSPredicate *beforeL = [NSPredicate predicateWithBlock:
                            ^BOOL(id evaluatedObject, NSDictionary *bindings) {
                                NSComparisonResult result = [@"Q" compare:evaluatedObject];
                                if (result == NSOrderedDescending) {
                                    return YES;
                                } else {
                                    return NO;
                                }
                            }];
    
    NSArray *makesBeforeL = [germanMakes5 filteredArrayUsingPredicate:beforeL];
    NSLog(@"I get %@", makesBeforeL);    // BMW, Audi
    
    
    
    //-----Array practice #7
    
    
//    NSArray *germanMakes7 = @[@"Mercedes-Benz", @"BMW", @"Porsche",
//                             @"Opel", @"Volkswagen", @"Audi"];
//    
//    NSArray *lastTwo = [germanMakes7 subarrayWithRange:NSMakeRange(1, 5)];
//    NSLog(@"%@", lastTwo);    // Volkswagen, Audi
//    
//    
//    //-----Array practice #8
//    
//    NSArray *germanMakes8 = @[@"Mercedes-Benz", @"BMW", @"Porsche",
//                             @"Opel", @"Volkswagen", @"Audi"];
//    NSArray *ukMakes8 = @[@"Aston Martin", @"Lotus", @"Jaguar", @"Bentley"];
//    
//    NSArray *allMakes = [germanMakes8 arrayByAddingObjectsFromArray:ukMakes8];
//    NSLog(@"%@", allMakes);
//    
//    
//    //-----Array practice #9
//    
//    NSArray *ukMakes1 = @[@"Aston Martin", @"Lotus", @"Jaguar", @"Bentley"];
//    NSLog(@"%@", [ukMakes1 componentsJoinedByString:@", "]);
//    
//    
//    //-----Array practice #10
//    
//    NSMutableArray *brokenCars = [NSMutableArray arrayWithObjects:
//                                  @"Audi A6", @"BMW Z3",
//                                  @"Audi Quattro", @"Audi TT", nil];
//    [brokenCars addObject:@"BMW F25"];
//    NSLog(@"%@", brokenCars);       // BMW F25 added to end
//    [brokenCars removeLastObject];
//    NSLog(@"%@", brokenCars);       // BMW F25 removed from end
//    
//    [brokenCars replaceObjectAtIndex:1 withObject:@"Audi Q5"];
//    NSLog(@"%@", brokenCars);
//    
//    
//     //-----Array practice #11
//    
//    
//    NSDictionary *car1 = @{
//                           @"make": @"Volkswagen",
//                           @"model": @"Golf",
//                           @"price": [NSDecimalNumber decimalNumberWithString:@"18750.00"]
//                           };
//    NSDictionary *car2 = @{
//                           @"make": @"Volkswagen",
//                           @"model": @"Eos",
//                           @"price": [NSDecimalNumber decimalNumberWithString:@"35820.00"]
//                           };
//    NSDictionary *car3 = @{
//                           @"make": @"Volkswagen",
//                           @"model": @"Jetta A5",
//                           @"price": [NSDecimalNumber decimalNumberWithString:@"16675.00"]
//                           };
//    NSDictionary *car4 = @{
//                           @"make": @"Volkswagen",
//                           @"model": @"Jetta A4",
//                           @"price": [NSDecimalNumber decimalNumberWithString:@"16675.00"]
//                           };
//    NSMutableArray *cars = [NSMutableArray arrayWithObjects:
//                            car1, car2, car3, car4, nil];
//    
//    NSSortDescriptor *priceDescriptor = [NSSortDescriptor
//                                         sortDescriptorWithKey:@"price"
//                                         ascending:YES
//                                         selector:@selector(compare:)];
//    NSSortDescriptor *modelDescriptor = [NSSortDescriptor
//                                         sortDescriptorWithKey:@"model"
//                                         ascending:YES
//                                         selector:@selector(caseInsensitiveCompare:)];
//    
//    NSArray *descriptors = @[priceDescriptor, modelDescriptor];
//    [cars sortUsingDescriptors:descriptors];
//    NSLog(@"%@", cars);    // car4, car3, car1, car2
//    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
