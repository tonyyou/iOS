//
//  RSAEncrypt.h
//  RSA
//
//  Created by FISC on 2017/8/15.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSAEncrypt : NSObject
{
    SecKeyRef publicKey;
    SecCertificateRef certificate;
    SecPolicyRef policy;
    SecTrustRef trust;
    size_t maxPlainLen;
}
- (NSData *) encryptWithData:(NSData *)content;
- (NSData *) encryptWithString:(NSString *)content;
- (NSString *) encryptToString:(NSString *)content;
@end
