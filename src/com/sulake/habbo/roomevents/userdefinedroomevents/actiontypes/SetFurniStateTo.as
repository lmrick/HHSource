package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class SetFurniStateTo extends DefaultActionType
   {
       
      
      public function SetFurniStateTo()
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
         return class_3520.var_4307;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID;
      }
      
      override public function get hasStateSnapshot() : Boolean
      {
         return true;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         select(getStateInput(param1),param2.getBoolean(0));
         select(getRotationInput(param1),param2.getBoolean(1));
         select(getLocationInput(param1),param2.getBoolean(2));
         select(getAltitudeInput(param1),param2.getBoolean(3));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getIntState(getStateInput(param1)));
         _loc2_.push(getIntState(getRotationInput(param1)));
         _loc2_.push(getIntState(getLocationInput(param1)));
         _loc2_.push(getIntState(getAltitudeInput(param1)));
         return _loc2_;
      }
      
      private function getIntState(param1:class_3176) : int
      {
         return !!param1.isSelected ? 1 : 0;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getStateInput(param1:class_3151) : class_3176
      {
         return class_3176(param1.findChildByName("include_state_checkbox"));
      }
      
      private function getRotationInput(param1:class_3151) : class_3176
      {
         return class_3176(param1.findChildByName("include_rotation_checkbox"));
      }
      
      private function getLocationInput(param1:class_3151) : class_3176
      {
         return class_3176(param1.findChildByName("include_location_checkbox"));
      }
      
      private function getAltitudeInput(param1:class_3151) : class_3176
      {
         return class_3176(param1.findChildByName("include_altitude_checkbox"));
      }
   }
}
