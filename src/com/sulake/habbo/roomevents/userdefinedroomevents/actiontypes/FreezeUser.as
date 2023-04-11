package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_79.class_1554;
   
   public class FreezeUser extends DefaultActionType
   {
       
      
      private var _cont:class_3151;
      
      public function FreezeUser()
      {
         super();
      }
      
      private static function getFreezeEffectId(param1:String) : int
      {
         var _loc2_:Array = param1.split(".");
         return parseInt(_loc2_[4]);
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
         return class_3520.FREEZE_USER;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _cont = param1;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         setSelectedFreezeEffectByCode(param2.intParams[0]);
         select(getTeleportCancelInput(),param2.getBoolean(1));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getSelectedFreezeEffectId());
         _loc2_.push(!!getTeleportCancelInput().isSelected ? 1 : 0);
         return _loc2_;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getFreezeEffectMenu() : class_3287
      {
         return class_3287(_cont.findChildByName("menu_freezeeffect"));
      }
      
      private function getSelectedFreezeEffectId() : int
      {
         var _loc2_:Array = getFreezeEffectMenu().enumerateSelection();
         var _loc1_:int = getFreezeEffectMenu().selection;
         if(_loc1_ == -1)
         {
            return 0;
         }
         return getFreezeEffectId(_loc2_[_loc1_]);
      }
      
      private function setSelectedFreezeEffectByCode(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:class_3287;
         var _loc2_:Array = (_loc4_ = getFreezeEffectMenu()).enumerateSelection();
         var _loc5_:* = -1;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(getFreezeEffectId(_loc2_[_loc3_]) == param1)
            {
               _loc5_ = _loc3_;
            }
            _loc3_++;
         }
         _loc4_.selection = _loc5_;
      }
      
      private function getTeleportCancelInput() : class_3176
      {
         return class_3176(_cont.findChildByName("cancel_on_teleport_checkbox"));
      }
   }
}
