package com.sulake.habbo.groups
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import package_5.class_1126;
   
   public class DetailsWindowCtrl implements class_13
   {
       
      
      private var var_437:com.sulake.habbo.groups.HabboGroupsManager;
      
      private var _window:class_3281;
      
      private var var_2737:com.sulake.habbo.groups.GroupDetailsCtrl;
      
      private var _groupId:int;
      
      public function DetailsWindowCtrl(param1:com.sulake.habbo.groups.HabboGroupsManager)
      {
         super();
         var_437 = param1;
         var_2737 = new com.sulake.habbo.groups.GroupDetailsCtrl(param1,true);
      }
      
      public function dispose() : void
      {
         var_437 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_2737)
         {
            var_2737.dispose();
            var_2737 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_437 == null;
      }
      
      public function isDisplayingGroup(param1:int) : Boolean
      {
         return _window != null && false && param1 == _groupId;
      }
      
      public function onGroupDetails(param1:class_1126) : void
      {
         if(_window != null && false && param1.groupId == _groupId || param1.openDetails)
         {
            _groupId = param1.groupId;
            prepareWindow();
            var_2737.onGroupDetails(class_3151(_window.findChildByName("group_cont")),param1);
            if(param1.openDetails)
            {
               _window.visible = true;
               _window.activate();
            }
         }
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3281(var_437.getXmlWindow("group_info_window"));
         _window.findChildByTag("close").procedure = onClose;
         _window.center();
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         close();
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _groupId = 0;
            _window.visible = false;
         }
      }
      
      public function onGroupDeactivated(param1:int) : void
      {
         if(_groupId == param1)
         {
            close();
         }
      }
   }
}
