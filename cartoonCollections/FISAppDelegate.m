//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

/**
 
 *  Define your method implementations here.
 
 */
-(NSString *)stringByRollCallingDwarfsInArray:(NSArray *)dwarfs{
    
    NSMutableString *rollCall = [NSMutableString new];
    
    
    for (NSUInteger i = 0; i < [dwarfs count]; i++) {
      
        [rollCall appendFormat:@"%lu. %@",i + 1, dwarfs[i]]; // dwarfs[i] so it knows where in array it is and adds + 1 so roll call integer to fix "off by one" error, (since index starts at 0).
        
        if (i < [dwarfs count] - 1 ) { // subtracting 1 so that it knows to stop adding pipe after second to last item in array
            [rollCall appendString:@" | "];
        }
    }
    return rollCall;
}

-(NSArray *)arrayOfPlaneteerShoutsFromArray:(NSArray *)powers{

    NSMutableArray *powersAsShouts = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < [powers count]; i++){
    NSString *power = powers[i];
    NSString *uppercasePower = [power uppercaseString];
    NSString *shoutPower =[uppercasePower stringByAppendingString:@"!"];
    
    [powersAsShouts addObject:shoutPower];
        
    }
    
    return powersAsShouts;
}

-(NSString *)summonCaptainPlanetWithPowers:(NSArray *)powers{
    
    NSMutableString *captainPlanetSummons = [NSMutableString new];
    
    //NSMutableString *powersCombined =[[NSMutableString alloc] initWithString:@"Let our powers combine:"];  this is an alternative to initializing NSMutableString, done all at once instead of creating another string that stores the first call.
    
    NSString *letPowersCombine = @"Let our powers combine:\n";// we don't want it done every single time so must be outside 'for' loop and starts the call so must go first.
    
    [captainPlanetSummons appendString:letPowersCombine];// to add starting phrase to mutable string once so that's why it's outside the loop
    
    NSArray *planeteerShouts = [self arrayOfPlaneteerShoutsFromArray:powers];//called on method
    
    for (NSUInteger i =0; i <[powers count]; i++){
        [captainPlanetSummons appendFormat:@"%@\n", planeteerShouts[i]];// provided index so doesn't print the entire array of shouts each time.
    
    }
    
    [captainPlanetSummons appendString:@"Go Planet!"];//outside the loop because only adding once at the end. use appendString and not stringByAppendingString (NSString method) because NSMutableMethod (methods aren't interchangeable).
    
    return captainPlanetSummons;
}

-(NSString *)firstPremiumCheeseInStock:(NSArray *)cheesesInStock premiumCheeseNames:(NSArray *)premiumCheeseNames{
  
    
    
    for (NSUInteger i = 0; i < [premiumCheeseNames count]; i++){
        NSString *firstCheeseInStock = cheesesInStock[i];
        NSString *cheeseName = premiumCheeseNames[i];
        
        if ([firstCheeseInStock isEqualToString:cheeseName]){
            return cheeseName;
        }
    }
    return @"No premium cheeses in stock.";

}

-(NSArray *)arrayByConvertingMoneyBagsIntoPaperBills:(NSArray *)moneybags{
    
    NSMutableArray *paperBills = [NSMutableArray new];
    for (NSUInteger i = 0; i < [moneybags count]; i++) {
        NSString *moneyBag = moneybags[i];
        NSUInteger moneyBagLength = [moneyBag length];
        NSString *paperBill =[NSString stringWithFormat:@"$%lu", moneyBagLength];
        
        [paperBills addObject:paperBill];
    }
    return paperBills;
}
@end
