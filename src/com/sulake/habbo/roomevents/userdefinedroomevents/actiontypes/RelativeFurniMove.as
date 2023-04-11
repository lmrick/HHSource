package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.RelativeMoveAxis;
   import package_79.class_1554;
   
   public class RelativeFurniMove extends DefaultActionType
   {
       
      
      private var xAxis:RelativeMoveAxis;
      
      private var yAxis:RelativeMoveAxis;
      
      public function RelativeFurniMove()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.RELATIVE_FURNI_MOVE;
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
         xAxis = new RelativeMoveAxis("horizontal",param1,param2);
         yAxis = new RelativeMoveAxis("vertical",param1,param2);
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc4_:int = int(param2.intParams[0]);
         var _loc3_:int = int(param2.intParams[1]);
         xAxis.setValue(_loc4_);
         yAxis.setValue(_loc3_);
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(xAxis.getValue());
         _loc2_.push(yAxis.getValue());
         return _loc2_;
      }
   }
}
