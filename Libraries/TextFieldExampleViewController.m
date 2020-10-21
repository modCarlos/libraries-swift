//
//  TextFieldViewController.m
//  Libraries
//
//  Created by Carlos Fuentes on 06/02/17.
//  Copyright © 2017 Carlos Fuentes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextFieldExampleViewController.h"

#define TEXT_FIELD_MONEY        0
#define TEXT_FIELD_FILTER       1
#define ACCEPTABLE_CHARACTERS   @"ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóúÁÉÍÓÚ 0123456789"

@implementation TextFieldExampleViewController {
    NSNumberFormatter *formatter;
}

-(void)viewDidLoad {

    formatter = [NSNumberFormatter new];
    [formatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [formatter setLenient:YES];
    [formatter setGeneratesDecimalNumbers:YES];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en-US"]];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    ///Formato numerico, para campos con cantidades
    if (TEXT_FIELD_MONEY) {
        NSString *replaced = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSDecimalNumber *amount = (NSDecimalNumber*) [formatter numberFromString:replaced];
        if (amount == nil) {
            // Something screwed up the parsing. Probably an alpha character.
            return NO;
        }
        
        short powerOf10 = 0;
        if ([textField.text isEqualToString:@""]) {
            powerOf10 = -formatter.maximumFractionDigits;
        }
        else if (range.location + formatter.maximumFractionDigits >= textField.text.length) {
            if (range.length) {
                powerOf10 = -range.length;
            }
            else {
                powerOf10 = [string length];
            }
        }
        
        amount = [amount decimalNumberByMultiplyingByPowerOf10:powerOf10];
        textField.text = [formatter stringFromNumber:amount];
        return NO;
    }
    
    ///Filtrar caracteres especiales en los textfields
    if (TEXT_FIELD_FILTER) {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARACTERS] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
    }
    

    return NO;
}

@end
