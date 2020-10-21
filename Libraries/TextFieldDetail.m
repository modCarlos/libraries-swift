//
//  TextFieldDetail.m
//  MYO
//
//  Created by Carlos Fuentes on 04/04/16.
//  Copyright © 2016 Carlos Fuentes. All rights reserved.
//

#import "TextFieldDetail.h"

@implementation TextFieldDetail
{
    UILabel *DetailLabel;
    NSString *PlaceHolderBackup;
}

- (BOOL)becomeFirstResponder
{
    BOOL outcome = [super becomeFirstResponder];
    
    if (outcome)
    {
        if (!DetailLabel)
        {
           
            DetailLabel = [[UILabel alloc] initWithFrame:self.frame];
           
            DetailLabel.text = self.placeholder;
            //DetailLabel.font = [DisplayTools FontAppWithSize:8];
            DetailLabel.adjustsFontSizeToFitWidth = YES;
            DetailLabel.textColor = [UIColor lightGrayColor];
            DetailLabel.alpha = 0;
            
            //[DetailLabel setBackgroundColor:[UIColor redColor]];
            
            PlaceHolderBackup = self.placeholder;
            
            [self addSubview:DetailLabel];
            
            CGRect LabelFrame = self.frame;
            
            LabelFrame.size.height = self.frame.size.height / 3.8;
            LabelFrame.size.width = self.frame.size.width / 2;
            LabelFrame.origin.y = self.frame.origin.y + 2;
            
            if (self.tag == 45)
            {
                LabelFrame.origin.y = self.frame.origin.y + 0.5;
                LabelFrame.origin.x = 0;
            }
            
            if (self.tag == 90)
            {
                LabelFrame.origin.y = 0;
                LabelFrame.origin.x = 0;
                DetailLabel.textColor = [UIColor whiteColor];
            }
            
            [UIView animateWithDuration:0.20 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
            {
                DetailLabel.alpha = 1;
                DetailLabel.frame = LabelFrame;
                self.placeholder = @"";
                
            } completion:nil];
            
        }
        else
        {
        
            CGRect LabelFrame = self.frame;
            LabelFrame.size.height = self.frame.size.height / 3.8;
            LabelFrame.size.width = self.frame.size.width / 2;
            LabelFrame.origin.y = self.frame.origin.y + 2;
            
            [UIView animateWithDuration:0.20 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
             {
                 DetailLabel.alpha = 1;
                 DetailLabel.frame = LabelFrame;
                 self.placeholder = @"";
                 
             } completion:nil];
        }
    }
    return outcome;
}

- (BOOL)resignFirstResponder
{
    BOOL outcome = [super resignFirstResponder];
    if (outcome)
    {
        self.backgroundColor = [UIColor clearColor];
        
        if ([self.text isEqualToString:@""])
        {
            if (DetailLabel)
            {
                [UIView animateWithDuration:0.20 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
                 {
                     self.placeholder = PlaceHolderBackup;
                     DetailLabel.alpha = 0;
                     CGRect LabelFrame = self.frame;
                     DetailLabel.frame =  LabelFrame;
                     
                 } completion:nil];
            }
        }
    }
    return outcome;
}

-(void)setText:(NSString *)text {
    [super setText:text];
    
    if (!DetailLabel)
    {
        
        DetailLabel = [[UILabel alloc] initWithFrame:self.frame];
        
        DetailLabel.text = self.placeholder;
        //DetailLabel.font = [DisplayTools FontAppWithSize:8];
        DetailLabel.adjustsFontSizeToFitWidth = YES;
        DetailLabel.textColor = [UIColor lightGrayColor];
        DetailLabel.alpha = 0;
        
        //[DetailLabel setBackgroundColor:[UIColor redColor]];
        
        PlaceHolderBackup = self.placeholder;
        
        [self addSubview:DetailLabel];
        
        CGRect LabelFrame = self.frame;
        
        LabelFrame.size.height = self.frame.size.height / 3.8;
        LabelFrame.size.width = self.frame.size.width / 2;
        LabelFrame.origin.y = self.frame.origin.y + 2;
        
        if (self.tag == 45)
        {
            LabelFrame.origin.y = self.frame.origin.y + 0.5;
            LabelFrame.origin.x = 0;
        }
        
        if (self.tag == 90)
        {
            LabelFrame.origin.y = 0;
            LabelFrame.origin.x = 0;
            DetailLabel.textColor = [UIColor whiteColor];
        }
        
        [UIView animateWithDuration:0.20 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
         {
             DetailLabel.alpha = 1;
             DetailLabel.frame = LabelFrame;
             self.placeholder = @"";
             
         } completion:nil];
        
    }
    else
    {
        
        CGRect LabelFrame = self.frame;
        LabelFrame.size.height = self.frame.size.height / 3.8;
        LabelFrame.size.width = self.frame.size.width / 2;
        LabelFrame.origin.y = self.frame.origin.y + 2;
        
        [UIView animateWithDuration:0.20 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
         {
             DetailLabel.alpha = 1;
             DetailLabel.frame = LabelFrame;
             self.placeholder = @"";
             
         } completion:nil];
    }
}



/*
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if(object == textField && [keyPath isEqual:@"isFirstResponder"]) {
        //fiddle with object here
    }
}
 */

@end
