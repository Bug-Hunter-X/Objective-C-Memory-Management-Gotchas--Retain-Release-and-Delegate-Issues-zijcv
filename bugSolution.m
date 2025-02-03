To fix the memory leak in the first example, ensure that you release any objects that you have a strong reference to in your `dealloc` method:

```objectivec
@interface MyClass : NSObject
@property (strong) NSString *myString;
@end

@implementation MyClass
- (void)dealloc {
    [_myString release]; // Correctly release myString
    [super dealloc];
}
@end
```

Alternatively, use ARC (Automatic Reference Counting), which handles memory management automatically, avoiding this kind of error completely:

```objectivec
@interface MyClass : NSObject
@property (strong) NSString *myString;
@end
```

For the second example, ensure that the delegate is assigned using weak reference:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, weak) id <MyDelegate> delegate;
@end
```

This will prevent retain cycles. Using a `weak` property ensures that the delegate is not retained by the class.  Careful consideration of object lifecycles and appropriate use of `weak` properties are crucial to prevent these issues.
