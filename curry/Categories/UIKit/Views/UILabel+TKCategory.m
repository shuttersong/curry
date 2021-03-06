//
//  UILabel+TKCategory.m
//  Created by Devin Ross on 10/7/14.
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

#import "UILabel+TKCategory.h"

@implementation UILabel (TKCategory)

- (void) sizeToFitWithAlignment{
	
	if(self.textAlignment != NSTextAlignmentCenter && self.textAlignment != NSTextAlignmentRight){
		[self sizeToFit];
		return;
	}
	
	CGRect frame = self.frame;
	[self sizeToFit];
	
	CGRect newFrame = self.frame;
	NSInteger xPad = (CGRectGetWidth(frame) - CGRectGetWidth(newFrame));
	if(self.textAlignment == NSTextAlignmentCenter)
		xPad /= 2;
	newFrame.origin.x = CGRectGetMinX(frame) + xPad;
	self.frame = newFrame;

}

- (void) sizeToFitWithAlignmentAndVerticalCentering{
	
	CGRect frame = self.frame;
	[self sizeToFitWithAlignment];
	CGRect newFrame = self.frame;
	NSInteger yPad = (CGRectGetHeight(frame) - CGRectGetHeight(newFrame)) / 2;
	newFrame.origin.y = CGRectGetMinY(frame) + yPad;
	self.frame = newFrame;

}

- (void) sizeToFitHeight{
	CGFloat width = CGRectGetWidth(self.frame);
	[self sizeToFit];
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

@end
