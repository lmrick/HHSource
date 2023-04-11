package com.sulake.habbo.window.utils
{
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import package_28.class_756;
   
   public class ElementPointerHandler
   {
       
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_3733:class_756;
      
      public function ElementPointerHandler(param1:HabboWindowManagerComponent)
      {
         super();
         _windowManager = param1;
         if(false)
         {
            var_3733 = new class_756(onElementPointerMessage);
            _windowManager.communication.addHabboConnectionMessageEvent(var_3733);
         }
      }
      
      private function onElementPointerMessage(param1:class_756) : void
      {
         var _loc2_:String = param1.getParser().key;
         if(_loc2_ == null || _loc2_ == "")
         {
            _windowManager.hideHint();
         }
         else
         {
            _windowManager.showHint(_loc2_);
         }
      }
      
      public function dispose() : void
      {
         if(false)
         {
            _windowManager.communication.removeHabboConnectionMessageEvent(var_3733);
         }
         _windowManager = null;
      }
   }
}
