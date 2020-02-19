@interface BorderLabel : UIView
@end

@interface _UIBatteryView : UIView
@end

static bool didTransform = false;
%hook _UIBatteryView
-(void)layoutSubviews{
  %orig;
  if(didTransform == false){
    for (UIView *obj in self.subviews){
      if([NSStringFromClass([obj class]) isEqualToString:@"BorderLabel"]){
        obj.transform  = CGAffineTransformMake(-1, 0, 0, 1, 0, 0);
      }
    }
  }
}
%end

%ctor {

    dlopen("/Library/MobileSubstrate/DynamicLibraries/nicebarx.dylib", RTLD_LAZY);
      %init;

}
