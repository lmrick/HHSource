package com.sulake.habbo.roomevents.userdefinedroomevents.addons
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class OrConditionEvaluation extends DefaultAddonType
   {
       
      
      public function OrConditionEvaluation()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3513.var_4316;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
   }
}
