package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import flash.events.EventDispatcher;
   
   public class BackgroundObject implements class_13, class_41
   {
       
      
      private var var_247:int;
      
      private var _window:class_3127;
      
      private var name_1:EventDispatcher;
      
      private var var_2082:IStaticBitmapWrapperWindow;
      
      public function BackgroundObject(param1:int, param2:class_3151, param3:EventDispatcher, param4:HabboLandingView, param5:String, param6:Boolean = false)
      {
         super();
         var_247 = param1;
         _window = param2;
         name_1 = param3;
         if(param6)
         {
            var_2082 = IStaticBitmapWrapperWindow(param4.getXmlWindow("moving_object"));
         }
         else
         {
            var_2082 = IStaticBitmapWrapperWindow(param4.getXmlWindow("moving_object_floating"));
         }
         param2.addChild(var_2082);
      }
      
      public function dispose() : void
      {
         _window = null;
         var_2082 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _window == null;
      }
      
      public function set sprite(param1:IStaticBitmapWrapperWindow) : void
      {
         var_2082 = param1;
      }
      
      public function get sprite() : IStaticBitmapWrapperWindow
      {
         return var_2082;
      }
      
      public function get window() : class_3127
      {
         return _window;
      }
      
      public function set window(param1:class_3127) : void
      {
         _window = param1;
      }
      
      public function get events() : EventDispatcher
      {
         return name_1;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_2082)
         {
            return;
         }
      }
   }
}
