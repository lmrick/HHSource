package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   
   public class ImageElementHandler implements IElementHandler
   {
       
      
      public function ImageElementHandler()
      {
         super();
      }
      
      public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         var _loc5_:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(param2);
         var _loc6_:String = "${image.library.url}" + param3[1];
         _loc5_.assetUri = _loc6_;
         _loc5_.x = int(param3[2]);
      }
      
      public function refresh() : void
      {
      }
   }
}
