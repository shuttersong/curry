//
//  NSArrayTests.m
//  Created by Devin on 7/18/12.
//
/*
 
 curry || https://github.com/devinross/curry
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */


#import "NSArrayTests.h"
#import "NSArray+TKCategory.h"

@implementation NSArrayTests


- (void) testShouldReturnFirstObject{
		
	XCTAssertNil([@[] firstObject]);
	NSArray *ar = @[@"BOB"];
	XCTAssertEqualObjects([ar firstObject], @"BOB");
	XCTAssertEqual([ar firstObject], ar[0]);

}

- (void) testShouldReturnRandomObjects{
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:5000];
	for(NSInteger i=0;i<5000;i++){
		[array addObject:@(i)];
	}
	

	NSNumber *lastNumber = [array randomObject];
	NSInteger equal = 0, different = 0;
	for(NSInteger i=0;i<500;i++){
		
		NSNumber *number = [array randomObject];
		
		if([number isEqualToNumber:lastNumber]){
			equal++;
		}else{
			different++;
		}
		
		lastNumber = number;
		
	}
	
	XCTAssert(different>equal);
	
	
}


@end
