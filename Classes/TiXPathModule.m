/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiXPathModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "NSData+XPath.h"

@implementation TiXPathModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"f50593d3-dcb1-4000-93da-80b6d92ae2ae";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"TiXPath";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)findXPath:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    ENSURE_TYPE_OR_NIL(args,NSDictionary);
    
    
    NSString* xmlDoc = [args objectForKey:@"doc"];
	ENSURE_CLASS_OR_NIL(xmlDoc, [NSString class]);
    
    NSString* xpath = [args objectForKey:@"xpath"];
	ENSURE_CLASS_OR_NIL(xpath, [NSString class]);
    
    NSDictionary* namespaces = [args objectForKey:@"namespaces"];
    ENSURE_CLASS_OR_NIL(namespaces, [NSDictionary class]);
    
    NSData *data = [xmlDoc dataUsingEncoding:NSUTF8StringEncoding];
    //NSArray* results = [data findXPath:xpath usingNamespaces:namespaces];
    //XPathResult* r = [results objectAtIndex:0];
    
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    
    [data findXPath:xpath usingNamespaces:namespaces executeBlock:^(XPathResult *r) {
        [arr addObject: r.content];
    }];
    
    return (id)arr;
}

@end
