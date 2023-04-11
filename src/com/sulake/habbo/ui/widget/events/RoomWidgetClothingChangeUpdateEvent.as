package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetClothingChangeUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const SHOW_GENDER_SELECTION:String = "RWCCUE_SHOW_GENDER_SELECTION";
      
      public static const SHOW_CLOTHING_EDITOR:String = "RWCCUE_SHOW_CLOTHING_EDITOR";
       
      
      private var var_347:int = -1;
      
      private var var_907:int = -1;
      
      private var var_354:int = -1;
      
      public function RoomWidgetClothingChangeUpdateEvent(param1:String, param2:int = 0, param3:int = 0, param4:int = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_347 = param2;
         var_907 = param3;
         var_354 = param4;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get objectCategory() : int
      {
         return var_907;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
   }
}
