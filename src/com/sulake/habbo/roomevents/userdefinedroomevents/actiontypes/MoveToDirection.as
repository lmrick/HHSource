package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class MoveToDirection extends DefaultActionType
   {
       
      
      public function MoveToDirection()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.MOVE_TO_DIRECTION;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
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
         var _loc4_:int = int(param2.intParams[0]);
         var _loc3_:int = int(param2.intParams[1]);
         getStartDirSelector(param1).setSelected(getStartDirRadio(param1,_loc4_));
         getTurnSelector(param1).setSelected(getTurnRadio(param1,_loc3_));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getStartDirSelector(param1).getSelected().id);
         _loc2_.push(getTurnSelector(param1).getSelected().id);
         return _loc2_;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getStartDirRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("startdir_" + param2 + "_radio"));
      }
      
      private function getTurnRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("turn_" + param2 + "_radio"));
      }
      
      private function getStartDirSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("startdir_selector"));
      }
      
      private function getTurnSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("turn_selector"));
      }
   }
}
