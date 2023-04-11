package com.sulake.habbo.groups
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import package_7.class_197;
   
   public class GroupCreatedWindowCtrl implements class_13
   {
       
      
      private var var_437:com.sulake.habbo.groups.HabboGroupsManager;
      
      private var _window:class_3281;
      
      private var _groupId:int;
      
      public function GroupCreatedWindowCtrl(param1:com.sulake.habbo.groups.HabboGroupsManager)
      {
         super();
         var_437 = param1;
      }
      
      public function dispose() : void
      {
         var_437 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_437 == null;
      }
      
      public function show(param1:int) : void
      {
         _groupId = param1;
         prepareWindow();
         _window.visible = true;
         _window.activate();
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3281(var_437.getXmlWindow("group_created_window"));
         _window.findChildByTag("close").procedure = onClose;
         _window.findChildByName("ok_button").procedure = onClose;
         _window.center();
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            close();
            var_437.send(new class_197(_groupId,false));
         }
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _window.visible = false;
         }
      }
   }
}
