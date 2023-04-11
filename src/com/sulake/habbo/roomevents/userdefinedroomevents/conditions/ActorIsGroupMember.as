package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_5.class_1633;
   import package_5.class_564;
   import package_7.class_735;
   import package_79.class_1554;
   
   public class class_3415 extends DefaultConditionType
   {
      
      private static var REQUEST_TIMEOUT:int = 5;
       
      
      private var _cont:class_3151;
      
      private var var_1460:HabboUserDefinedRoomEvents;
      
      private var var_292:Array;
      
      private var var_1664:int = -1;
      
      private var var_4258:Number = 0;
      
      public function class_3415()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.ACTOR_IS_GROUP_MEMBER;
      }
      
      override public function get negativeCode() : int
      {
         return class_3523.NOT_ACTOR_IS_GROUP_MEMBER;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         var _loc2_:int = 0;
         var _loc3_:class_1633 = null;
         if(getGroupTypeRadio(1).isSelected)
         {
            _loc2_ = getGroupMenu().selection;
            if(_loc2_ == -1)
            {
               return "";
            }
            _loc3_ = var_292[getGroupMenu().selection];
            return _loc3_.groupId.toString();
         }
         return "";
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         var_1460 = param2;
         _cont = param1;
         getGroupTypeRadio(1).addEventListener("WE_SELECT",onSpecifyGroupSelect);
         getGroupTypeRadio(1).addEventListener("WE_UNSELECT",onSpecifyGroupUnselect);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var_1664 = param2.stringParam == "" ? -1 : int(param2.stringParam);
         initGuilds(var_292 == null ? [] : var_292);
         maybeGetGuildMemberships();
         if(param2.stringParam != "")
         {
            getGroupTypeSelector().setSelected(getGroupTypeRadio(1));
            getGroupMenu().visible = true;
         }
         else
         {
            getGroupTypeSelector().setSelected(getGroupTypeRadio(0));
            getGroupMenu().visible = false;
         }
      }
      
      private function maybeGetGuildMemberships() : void
      {
         var _loc1_:Number = new Date().time;
         if(_loc1_ > var_4258 + 1000 * REQUEST_TIMEOUT)
         {
            var_4258 = _loc1_;
            var_1460.send(new class_735());
         }
      }
      
      private function initGuilds(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc2_:class_1633 = null;
         var _loc3_:* = -1;
         var_292 = param1;
         var _loc4_:Vector.<String> = new Vector.<String>();
         _loc5_ = 0;
         while(_loc5_ < var_292.length)
         {
            _loc2_ = var_292[_loc5_];
            _loc4_.push(_loc2_.groupName);
            if(_loc2_.groupId == var_1664)
            {
               _loc3_ = _loc5_;
            }
            _loc5_++;
         }
         getGroupMenu().populateWithVector(_loc4_);
         if(_loc3_ != -1)
         {
            getGroupMenu().selection = _loc3_;
         }
      }
      
      override public function onGuildMemberships(param1:class_564) : void
      {
         initGuilds(param1.guilds);
      }
      
      private function onSpecifyGroupSelect(param1:class_3134) : void
      {
         getGroupMenu().visible = true;
      }
      
      private function onSpecifyGroupUnselect(param1:class_3134) : void
      {
         getGroupMenu().visible = false;
      }
      
      private function getGroupMenu() : class_3287
      {
         return class_3287(_cont.findChildByName("menu_group"));
      }
      
      private function getGroupTypeRadio(param1:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("grouptype_" + param1 + "_radio"));
      }
      
      private function getGroupTypeSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("grouptype_selector"));
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
   }
}
