//
//  main.m
//  2023_09_27_appVerificacionesRegex
//
//  Created by Ivanovicx Nuñez on 27/09/23.
//

#import <Foundation/Foundation.h>
#import <iostream>

using namespace std;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSMutableString *expresionReg = [[NSMutableString alloc] init];
        [expresionReg appendString:@"^[A-Z0-9a-z._!#$%&]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,5}$"];
        
        string correo;
        cout << "Correo: ";
        cin >> correo;
        
        NSString *cadena = [NSString stringWithUTF8String:correo.c_str()];
        
        NSError *error = nil;
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expresionReg options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSArray *matches = [regex matchesInString:cadena options:0 range:NSMakeRange(0, cadena.length)];
        
        for(NSTextCheckingResult *matchResultado in matches){
            NSString *match = [cadena substringWithRange:matchResultado.range];
            NSLog(@"El correo %@ es válido", match);
        }
    }
    return 0;
}
