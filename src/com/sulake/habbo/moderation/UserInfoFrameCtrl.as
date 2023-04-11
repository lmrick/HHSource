package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import package_137.class_1612;
   
   public class UserInfoFrameCtrl implements class_13, ITrackedWindow
   {
       
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var var_339:int;
      
      private var _frame:class_3281;
      
      private var _disposed:Boolean;
      
      private var var_2740:com.sulake.habbo.moderation.UserInfoCtrl;
      
      private var var_3425:class_1612;
      
      public function UserInfoFrameCtrl(param1:com.sulake.habbo.moderation.ModerationManager, param2:int, param3:class_1612 = null)
      {
         super();
         _main = param1;
         var_339 = param2;
         var_3425 = param3;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function show() : void
      {
         _frame = class_3281(_main.getXmlWindow("user_info_frame"));
         _frame.caption = "User Info";
         var _loc1_:class_3127 = _frame.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_2740 = new com.sulake.habbo.moderation.UserInfoCtrl(_frame,_main,var_3425,null,true);
         var_2740.load(_frame.content,var_339);
         _frame.visible = true;
      }
      
      public function getType() : int
      {
         return 1;
      }
      
      public function getId() : String
      {
         return "" + var_339;
      }
      
      public function getFrame() : class_3281
      {
         return _frame;
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         dispose();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(_frame != null)
         {
            _frame.destroy();
            _frame = null;
         }
         if(var_2740 != null)
         {
            var_2740.dispose();
            var_2740 = null;
         }
         var_3425 = null;
         _main = null;
      }
   }
}
