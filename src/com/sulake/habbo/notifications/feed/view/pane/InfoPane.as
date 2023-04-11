package com.sulake.habbo.notifications.feed.view.pane
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3258;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.notifications.feed.NotificationView;
   
   public class InfoPane extends AbstractPane
   {
       
      
      public function InfoPane(param1:String, param2:NotificationView, param3:class_3151)
      {
         super(param1,param2,param3,2);
         (_window.findChildByName("info_ok") as class_3258).addEventListener("WME_CLICK",onOkClick);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         if(_window)
         {
            _loc1_ = _window.findChildByName("info_ok") as class_3258;
            if(_loc1_)
            {
               _loc1_.removeEventListener("WME_CLICK",onOkClick);
               _loc1_ = null;
            }
         }
      }
      
      private function onOkClick(param1:WindowMouseEvent) : void
      {
         var_1534.closePaneLevel(2);
      }
   }
}
