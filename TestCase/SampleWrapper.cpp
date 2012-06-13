//
//  SampleWrapper.cpp
//  TestCase
//

#include <iostream>
#include <string.h>
#include <CoreFoundation/CoreFoundation.h>

using namespace std;

extern "C" 
{
    extern void NSLog(CFStringRef format, ...); 
    
    /**
     * This function simply wraps a library function so that 
     * it can be used in objective-c.
     */
    const char * CompressCodeData(const char * strToCompress) 
    {
        const string s(strToCompress);
        
        // Omitted call to static method in c++ library
        // to simplify this test case.
        
        //const char *result = SomeStaticLibraryFunction(s);
        const char *result = s.c_str();
        
        NSLog(CFSTR("In Compress %s"), result);
        return result;
    }
    
}