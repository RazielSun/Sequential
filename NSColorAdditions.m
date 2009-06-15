/* Copyright © 2007-2008, The Sequential Project
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the the Sequential Project nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE SEQUENTIAL PROJECT ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE SEQUENTIAL PROJECT BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */
#import "NSColorAdditions.h"

#define PGCheckerboardSquareSize 8
#define PGCheckerboardSize (PGCheckerboardSquareSize * 2)

@implementation NSColor (AEAdditions)

#pragma mark +NSColor(AEAdditions)

+ (NSColor *)AE_bezelBackgroundColor
{
	return [NSColor colorWithDeviceWhite:(48.0f / 255.0f) alpha:0.75f];
}
+ (NSColor *)AE_bezelForegroundColor
{
	return [NSColor colorWithDeviceWhite:0.95f alpha:0.9f];
}

#pragma mark -NSColor(AEAdditions)

- (NSColor *)AE_checkerboardPatternColor
{
	NSImage *const checkerboard = [[[NSImage alloc] initWithSize:NSMakeSize(PGCheckerboardSize, PGCheckerboardSize)] autorelease];
	[checkerboard lockFocus];
	[self set];
	NSRectFill(NSMakeRect(0, 0, PGCheckerboardSize, PGCheckerboardSize));
	[[NSColor colorWithDeviceWhite:1 alpha:0.07] set];
	NSRectFillUsingOperation(NSMakeRect(0, 0, PGCheckerboardSquareSize, PGCheckerboardSquareSize), NSCompositeSourceOver);
	NSRectFillUsingOperation(NSMakeRect(PGCheckerboardSquareSize, PGCheckerboardSquareSize, PGCheckerboardSquareSize, PGCheckerboardSquareSize), NSCompositeSourceOver);
	[[NSColor colorWithDeviceWhite:0 alpha:0.07] set];
	NSRectFillUsingOperation(NSMakeRect(0, PGCheckerboardSquareSize, PGCheckerboardSquareSize, PGCheckerboardSquareSize), NSCompositeSourceOver);
	NSRectFillUsingOperation(NSMakeRect(PGCheckerboardSquareSize, 0, PGCheckerboardSquareSize, PGCheckerboardSquareSize), NSCompositeSourceOver);
	[checkerboard unlockFocus];
	return [NSColor colorWithPatternImage:checkerboard];
}

@end
