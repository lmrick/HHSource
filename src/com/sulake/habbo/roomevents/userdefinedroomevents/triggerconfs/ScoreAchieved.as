package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class ScoreAchieved extends DefaultTriggerConf
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_2627:SliderWindowController;
      
      private var _cont:class_3151;
      
      public function ScoreAchieved()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3431.SCORE_ACHIEVED;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(var_2627.getValue());
         _loc2_.push(getTeamSelector().getSelected().id);
         return _loc2_;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _roomEvents = param2;
         _cont = param1;
         var_2627 = new SliderWindowController(param2,getScoreSlider(),param2.assets,1,1000,1);
         var_2627.setValue(1);
         var_2627.addEventListener("change",onScoreChange);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         var _loc4_:int = int(param2.intParams[1]);
         var_2627.setValue(_loc3_);
         getTeamSelector().setSelected(getTeamRadio(_loc4_));
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getTeamRadio(param1:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("team_" + param1 + "_radio"));
      }
      
      private function getTeamSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("team_selector"));
      }
      
      private function getScoreSlider() : class_3151
      {
         return _cont.findChildByName("score_slider_cont") as class_3151;
      }
      
      private function onScoreChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getValue();
               _loc4_ = _loc3_;
               _roomEvents.localization.registerParameter("wiredfurni.params.setscore","points","" + _loc4_);
            }
         }
      }
   }
}
