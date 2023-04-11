package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class BotGiveHandItem extends DefaultActionType
   {
       
      
      private var var_1460:HabboUserDefinedRoomEvents;
      
      private var _cont:class_3151;
      
      private var initialHandItems:Array;
      
      public function BotGiveHandItem()
      {
         super();
      }
      
      private static function getCodeInHandItemLoc(param1:String) : int
      {
         return parseInt(param1.substr(10,param1.length - 11));
      }
      
      override public function get code() : int
      {
         return class_3520.BOT_GIVE_HAND_ITEM;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         var_1460 = param2;
         _cont = param1;
         initialHandItems = getHandItemMenu().enumerateSelection();
         getBotUsageCheckBox().addEventListener("WE_SELECT",onUseBot);
         getBotUsageCheckBox().addEventListener("WE_UNSELECT",onNotUseBot);
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         return !!getBotUsageCheckBox().isSelected ? getBotInput().text : "";
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getSelectedHandItemCode());
         return _loc2_;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:* = param2.stringParam != "";
         getBotInput().text = param2.stringParam;
         if(_loc3_)
         {
            getBotUsageCheckBox().select();
            getBotInput().visible = true;
         }
         else
         {
            getBotUsageCheckBox().unselect();
            getBotInput().visible = false;
         }
         setSelectedHandItemByCode(param2.intParams[0]);
         param1.findChildByName("capture_handitem").procedure = captureHanditem;
      }
      
      private function getSelectedHandItemCode() : int
      {
         var _loc2_:Array = getHandItemMenu().enumerateSelection();
         var _loc1_:int = getHandItemMenu().selection;
         if(_loc1_ == -1)
         {
            return 0;
         }
         return getCodeInHandItemLoc(_loc2_[_loc1_]);
      }
      
      private function setSelectedHandItemByCode(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Array = null;
         var _loc5_:class_3287;
         (_loc5_ = getHandItemMenu()).populate(initialHandItems);
         var _loc3_:Array = _loc5_.enumerateSelection();
         var _loc6_:* = -1;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(getCodeInHandItemLoc(_loc3_[_loc4_]) == param1)
            {
               _loc6_ = _loc4_;
            }
            _loc4_++;
         }
         if(_loc6_ == -1 && param1 >= 0)
         {
            _loc2_ = initialHandItems.concat();
            _loc2_.push("${handitem" + param1 + "}");
            _loc5_.populate(_loc2_);
            _loc6_ = _loc5_.numMenuItems - 1;
         }
         _loc5_.selection = _loc6_;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getBotInput() : ITextFieldWindow
      {
         return ITextFieldWindow(_cont.findChildByName("bot_name"));
      }
      
      private function getHandItemMenu() : class_3287
      {
         return class_3287(_cont.findChildByName("menu_handitem"));
      }
      
      private function getBotUsageCheckBox() : class_3176
      {
         return class_3176(_cont.findChildByName("use_bot_checkbox"));
      }
      
      private function onUseBot(param1:class_3134) : void
      {
         getBotInput().visible = true;
      }
      
      private function onNotUseBot(param1:class_3134) : void
      {
         getBotInput().visible = false;
      }
      
      private function captureHanditem(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = int(var_1460.roomEngine.getRoomObject(this.var_1460.roomSession.roomId,this.var_1460.roomSession.ownUserRoomId,100).getModel().getNumber("figure_carry_object"));
            setSelectedHandItemByCode(_loc3_);
         }
      }
   }
}
