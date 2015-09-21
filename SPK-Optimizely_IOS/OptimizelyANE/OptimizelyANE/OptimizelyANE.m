//
//  OptimizelyANE.m
//  OptimizelyANE
//
//  Created by Steve Warren on 9/18/15.
//  Copyright (c) 2015 Speakaboos. All rights reserved.
//

#import "FlashRuntimeExtensions.h"
#import "OptimizelyANE.h"
#import <Optimizely/Optimizely.h>

@implementation OptimizelyANE

@end

FREObject helloWorld(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"helloWorld");
    
    //Create function confirmation string
    NSString *returnString = @"helloWorld";
    const char *str = [returnString UTF8String];
    FREObject retStr;
    FRENewObjectFromUTF8((uint8_t)strlen(str)+1, (const uint8_t*)str, &retStr);
    
    // Return data back to ActionScript
    return retStr;
}


FREObject initOptimizely(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    
    // Extract Token
    uint32_t string1Length;
    const uint8_t *tokenCString;
    FREGetObjectAsUTF8(argv[0], &string1Length, &tokenCString);
    NSString *projectID = [NSString stringWithUTF8String:(char*)tokenCString];
    
    NSLog(@"initOptimizely projectID: %@", projectID);
    
    [Optimizely startOptimizelyWithAPIToken:
     @"AAM7hIkBTKOPcZDtXoIcmtNb6Gk2v8t2~3527793126"
                              launchOptions:NULL];
    
    
    
    //Create function confirmation string
    NSString *returnString = @"initOptimizely - initialized";
    const char *str = [returnString UTF8String];
    FREObject retStr;
    FRENewObjectFromUTF8((uint8_t)strlen(str)+1, (const uint8_t*)str, &retStr);
    
    // Return data back to ActionScript
    return retStr;
    
}


//-----------INITIALIZE AND FINALIZE-------------

// ContextInitializer()
// The context initializer is called when the runtime creates the extension context instance.
void OptimizelyANEContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    NSLog(@"Entering ContextInitializer()");
    
    *numFunctionsToTest = 2;
    FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction) * 2);
    
    func[0].name = (const uint8_t*)"helloWorld";
    func[0].functionData = NULL;
    func[0].function = &helloWorld;
    
    func[1].name = (const uint8_t*)"initOptimizely";
    func[1].functionData = NULL;
    func[1].function = &initOptimizely;
    
    //    func[2].name = (const uint8_t*)"trackEvent";
    //    func[2].functionData = NULL;
    //    func[2].function = &trackEvent;
    //
    //    func[3].name = (const uint8_t*)"registerSuperProperties";
    //    func[3].functionData = NULL;
    //    func[3].function = &registerSuperProperties;
    
    *functionsToSet = func;
    
    NSLog(@"Exiting ContextInitializer()");
}

// ContextFinalizer()
// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().

void OptimizelyANEContextFinalizer(FREContext ctx) {
    
    NSLog(@"Entering ContextFinalizer()");
    
    // Nothing to clean up.
    
    NSLog(@"Exiting ContextFinalizer()");
    
    return;
}

// ExtInitializer()
//
// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.

void OptimizelyANEInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                              FREContextFinalizer* ctxFinalizerToSet) {
    
    NSLog(@"Entering ExtInitializer()");
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &OptimizelyANEContextInitializer;
    *ctxFinalizerToSet = &OptimizelyANEContextFinalizer;
    
    NSLog(@"Exiting ExtInitializer()");
}

// ExtFinalizer()
//
// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.

void OptimizelyANEFinalizer(void* extData) {
    
    NSLog(@"Entering ExtFinalizer()");
    
    // Nothing to clean up.
    
    NSLog(@"Exiting ExtFinalizer()");
    
    return;
}




