package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_79.class_1554;
   
   public class ActorFacingDirection extends DefaultConditionType
   {
       
      
      private var _cont:class_3151;
      
      public function ActorFacingDirection()
      {
         super();
      }
      
      private static function select(param1:class_3176, param2:Boolean) : void
      {
         if(param2)
         {
            param1.select();
         }
         else
         {
            param1.unselect();
         }
      }
      
      override public function get code() : int
      {
         return class_3523.USER_DIRECTION;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _cont = param1;
         param2.refreshButton(param1,"move_0",true,null,0);
         param2.refreshButton(param1,"move_1",true,null,0);
         param2.refreshButton(param1,"move_2",true,null,0);
         param2.refreshButton(param1,"move_3",true,null,0);
         param2.refreshButton(param1,"move_4",true,null,0);
         param2.refreshButton(param1,"move_5",true,null,0);
         param2.refreshButton(param1,"move_6",true,null,0);
         param2.refreshButton(param1,"move_7",true,null,0);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc5_:int = 0;
         var _loc3_:class_3176 = null;
         var _loc4_:* = false;
         var _loc6_:int = int(param2.intParams[0]);
         _loc5_ = 0;
         while(_loc5_ < 8)
         {
            _loc3_ = getDirectionCheckbox(_loc5_);
            _loc4_ = (_loc6_ & 1 << _loc5_) > 0;
            select(_loc3_,_loc4_);
            _loc5_++;
         }
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:class_3176 = null;
         var _loc2_:* = [];
         var _loc5_:* = 0;
         _loc4_ = 0;
         while(_loc4_ < 8)
         {
            _loc3_ = getDirectionCheckbox(_loc4_);
            if(_loc3_.isSelected)
            {
               _loc5_ |= 1 << _loc4_;
            }
            _loc4_++;
         }
         _loc2_.push(_loc5_);
         return _loc2_;
      }
      
      private function getDirectionCheckbox(param1:int) : class_3176
      {
         return class_3176(_cont.findChildByName("dir_" + param1 + "_checkbox"));
      }
   }
}
