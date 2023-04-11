package com.sulake.habbo.utils
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.components.IIconWindow;
   import flash.events.Event;
   import flash.utils.Timer;
   
   public class LoadingIcon implements class_13
   {
      
      private static const FRAMES:Array = [23,24,25,26];
       
      
      private var var_1635:Timer;
      
      private var _icon:IIconWindow;
      
      private var var_2554:int;
      
      public function LoadingIcon()
      {
         var_1635 = new Timer(160);
         super();
         var_1635.addEventListener("timer",onTimer);
      }
      
      public function dispose() : void
      {
         if(var_1635)
         {
            var_1635.removeEventListener("timer",onTimer);
            var_1635.stop();
            var_1635 = null;
         }
         _icon = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_1635 == null;
      }
      
      public function setVisible(param1:IIconWindow, param2:Boolean) : void
      {
         _icon = param1;
         _icon.visible = param2;
         if(param2)
         {
            _icon.style = FRAMES[var_2554];
            var_1635.start();
         }
         else
         {
            var_1635.stop();
         }
      }
      
      private function onTimer(param1:Event) : void
      {
         if(_icon == null)
         {
            return;
         }
         var_2554++;
         if(var_2554 >= FRAMES.length)
         {
            var_2554 = 0;
         }
         _icon.style = FRAMES[var_2554];
      }
   }
}
