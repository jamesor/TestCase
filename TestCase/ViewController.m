//
//  ViewController.m
//  TestCase
//

#import "ViewController.h"

extern char * CompressCodeData(const char * strToCompress);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)testNow:(id)sender {
    [self performSelectorInBackground:@selector(analyze) withObject:nil];
}

- (void)analyze
{
    @synchronized(self) {
        
        const char *testData = [[NSString stringWithFormat:@"%d", (int)(arc4random() % 100000000)] UTF8String];
        NSLog(@"Test Data = %s", testData);
        
        char *compressed = CompressCodeData(testData);
        NSLog(@"Returned Value = %s", compressed);
        
        NSString *casted = [NSString stringWithCString:compressed encoding:NSASCIIStringEncoding];
        NSLog(@"Casted Value = %@\n\n", casted);
        
        free(compressed);
    }
}

@end
