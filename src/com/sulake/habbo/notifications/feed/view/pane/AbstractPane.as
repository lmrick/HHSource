package com.sulake.habbo.notifications.feed.view.pane
{
   import com.sulake.core.runtime.exceptions.Exception;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.notifications.feed.NotificationView;
   
   public class AbstractPane implements class_3413
   {
      
      public static const PANE_VIEW_LEVEL_BASE:int = 0;
      
      public static const PANE_VIEW_LEVEL_FEED:int = 1;
      
      public static const PANE_VIEW_LEVEL_MODAL:int = 2;
       
      
      protected var var_311:Boolean;
      
      protected var var_2160:Boolean;
      
      private var var_3855:int;
      
      protected var _window:class_3151;
      
      protected var var_1534:NotificationView;
      
      protected var _name:String;
      
      public function AbstractPane(param1:String, param2:NotificationView, param3:class_3151, param4:int)
      {
         super();
         if(param3 == null)
         {
            throw new Exception("Window was null for feed pane: " + param1);
         }
         _name = param1;
         var_1534 = param2;
         var_3855 = param4;
         _window = param3;
      }
      
      public function dispose() : void
      {
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get paneLevel() : int
      {
         return var_3855;
      }
      
      public function set isVisible(param1:Boolean) : void
      {
         var_2160 = param1;
         _window.visible = var_2160;
      }
      
      public function get isVisible() : Boolean
      {
         return var_2160;
      }
   }
}
