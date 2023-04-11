package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class MoveFurni extends DefaultActionType
   {
       
      
      public function MoveFurni()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.MOVE_FURNI;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         param2.refreshButton(param1,"move_0",true,null,0);
         param2.refreshButton(param1,"move_2",true,null,0);
         param2.refreshButton(param1,"move_4",true,null,0);
         param2.refreshButton(param1,"move_6",true,null,0);
         param2.refreshButton(param1,"move_diag",true,null,0);
         param2.refreshButton(param1,"move_rnd",true,null,0);
         param2.refreshButton(param1,"move_vrt",true,null,0);
         param2.refreshButton(param1,"rotate_ccw",true,null,0);
         param2.refreshButton(param1,"rotate_cw",true,null,0);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         var _loc4_:int = int(param2.intParams[1]);
         getMoveSelector(param1).setSelected(getMoveRadio(param1,_loc3_));
         getRotateSelector(param1).setSelected(getRotateRadio(param1,_loc4_));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         var _loc4_:int = int(getMoveSelector(param1).getSelected().id);
         var _loc3_:int = int(getRotateSelector(param1).getSelected().id);
         _loc2_.push(_loc4_);
         _loc2_.push(_loc3_);
         return _loc2_;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getMoveRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("move_" + param2 + "_radio"));
      }
      
      private function getRotateRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("rotate_" + param2 + "_radio"));
      }
      
      private function getMoveSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("move_selector"));
      }
      
      private function getRotateSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("rotate_selector"));
      }
   }
}
