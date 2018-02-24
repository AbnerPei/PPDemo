//
//  NSData+Base64.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/15.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

#import "NSData+Base64.h"

@implementation NSData (Base64)
#pragma mark --- base64
-(NSString *)pp_dataBase64
{
    if (self.length == 0) {
        return @"";
    }
    
    char *character = malloc((self.length+2)/3*4);
    if (character == NULL) {
        return @"";
    }
    
    NSUInteger length = 0;
    NSUInteger i = 0;
    
    while (i < [self length]) {
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < [self length])
            buffer[bufferLength++] = ((char *)[self bytes])[i++];
        character[length++] = encodingTable[(buffer[0] & 0xFC) >> 2];
        character[length++] = encodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1)
            character[length++] = encodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        else character[length++] = '=';
        if (bufferLength > 2)
            character[length++] = encodingTable[buffer[2] & 0x3F];
        else character[length++] = '=';
    }
    
    return [[NSString alloc] initWithBytesNoCopy:character length:length encoding:NSASCIIStringEncoding freeWhenDone:YES] ;
}
@end
