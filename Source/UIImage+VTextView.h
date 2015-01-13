//
//  UIImage+VTextView.h
//  VEmotionText
//
//  Created by Vic Zhou on 1/5/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VTextAttachment.h"

static void AttachmentRunDelegateDealloc(void *refCon) {
    //    CFBridgingRelease(refCon);
}

static CGSize AttachmentRunDelegateGetSize(void *refCon) {
    id <VTextAttachment> attachment = (__bridge id<VTextAttachment>)(refCon);
    if ([attachment respondsToSelector: @selector(attachmentSize)]) {
        return [attachment attachmentSize];
    } else {
        return [[attachment attachmentView] frame].size;
    }
}

static CGFloat AttachmentRunDelegateGetAscent(void *refCon) {
    return AttachmentRunDelegateGetSize(refCon).height-4.f;
}

static CGFloat AttachmentRunDelegateGetDescent(void *refCon) {
    return 4.f;
}

static CGFloat AttachmentRunDelegateGetWidth(void *refCon) {
    return AttachmentRunDelegateGetSize(refCon).width;
}

@interface UIImage (VTextView) <VTextAttachment>

@end
