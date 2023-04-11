package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   
   public class GenericElementHandler implements IElementHandler
   {
       
      
      public function GenericElementHandler()
      {
         super();
      }
      
      public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         param2.height = int(param3[1]);
      }
      
      public function refresh() : void
      {
      }
   }
}
