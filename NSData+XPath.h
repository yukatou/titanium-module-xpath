//
//  NSData+XPath.h
// 

#import <Foundation/Foundation.h>

@interface XPathResult : NSObject
{}

@property (readwrite,nonatomic,retain) NSString* xpath;
@property (readwrite,nonatomic,retain) NSString* name;
@property (readwrite,nonatomic,retain) NSString* content;
@property (readwrite,nonatomic,retain) NSDictionary* attributes;

@end

typedef void (^XPathResultBlock)(XPathResult* r);

@interface NSData(XPath)

/** executes the block for each xpath result encountered */
- (void) findXPath:(NSString*)xpath usingNamespaces:(NSDictionary*)namespaces executeBlock:(XPathResultBlock)block;

/** yields a single array with all xpath result objects */
- (NSArray*) findXPath:(NSString *)query usingNamespaces:(NSDictionary *)namespaces;

/** yields a single value with the content of the first result at given xpath */
- (NSString*) contentAtXPath:(NSString*)query usingNamespaces:(NSDictionary *)namespaces;

@end

