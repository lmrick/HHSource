package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_79.class_1554;
   
   public class class_3498 extends DefaultConditionType
   {
       
      
      private var var_1460:HabboUserDefinedRoomEvents;
      
      private var _cont:class_3151;
      
      private var initialHandItems:Array;
      
      public function class_3498()
      {
         super();
      }
      
      private static function getCodeInHandItemLoc(param1:String) : int
      {
         return parseInt(param1.substr(10,param1.length - 11));
      }
      
      override public function get code() : int
      {
         return class_3523.ACTOR_HAS_HANDITEM;
      }
      
      override public function get negativeCode() : int
      {
         return class_3523.NOT_HAS_HANDITEM;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         var_1460 = param2;
         _cont = param1;
         initialHandItems = getHandItemMenu().enumerateSelection();
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getSelectedHandItemCode(param1));
         return _loc2_;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         setSelectedHandItemByCode(param2.intParams[0]);
         param1.findChildByName("capture_handitem").procedure = captureHanditem;
      }
      
      private function getSelectedHandItemCode(param1:class_3151) : int
      {
         var _loc3_:Array = getHandItemMenu().enumerateSelection();
         var _loc2_:int = getHandItemMenu().selection;
         if(_loc2_ == -1)
         {
            return 0;
         }
         return getCodeInHandItemLoc(_loc3_[_loc2_]);
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
      
      private function getHandItemMenu() : class_3287
      {
         return class_3287(_cont.findChildByName("menu_handitem"));
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
