package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import package_79.class_1554;
   
   public class GiveScoreToPredefinedTeam extends GiveScore
   {
       
      
      public function GiveScoreToPredefinedTeam()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.GIVE_SCORE_TO_PREDEFINED_TEAM;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         super.onEditStart(param1,param2);
         var _loc3_:int = int(param2.intParams[2]);
         getTeamSelector(param1).setSelected(getTeamRadio(param1,_loc3_));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:Array = super.readIntParamsFromForm(param1);
         _loc2_.push(getTeamSelector(param1).getSelected().id);
         return _loc2_;
      }
      
      private function getTeamRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("team_" + param2 + "_radio"));
      }
      
      private function getTeamSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("team_selector"));
      }
   }
}
