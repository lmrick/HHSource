package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   
   public class AbstractButtonElementHandler implements IElementHandler, class_13, ILayoutNameProvider
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var _window:class_3127;
      
      public function AbstractButtonElementHandler()
      {
         super();
      }
      
      public function get layoutName() : String
      {
         return "element_button";
      }
      
      public function dispose() : void
      {
         _landingView = null;
         _window = null;
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         _landingView = param1;
         _window = param2;
         var _loc5_:String = String(param3[1]);
         param2.procedure = onButton;
         param2.caption = "${" + _loc5_ + "}";
      }
      
      private function onButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            onClick();
         }
      }
      
      protected function onClick() : void
      {
      }
      
      public function refresh() : void
      {
      }
      
      public function get landingView() : HabboLandingView
      {
         return _landingView;
      }
      
      public function get window() : class_3127
      {
         return _window;
      }
   }
}
