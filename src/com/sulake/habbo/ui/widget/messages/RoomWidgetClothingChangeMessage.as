package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetClothingChangeMessage extends RoomWidgetMessage
   {
      
      public static const REQUEST_EDITOR:String = "RWCCM_REQUEST_EDITOR";
       
      
      private var var_347:int = 0;
      
      private var var_907:int = 0;
      
      private var var_354:int = 0;
      
      private var var_122:String = "";
      
      public function RoomWidgetClothingChangeMessage(param1:String, param2:String, param3:int, param4:int, param5:int)
      {
         super(param1);
         var_122 = param2;
         var_347 = param3;
         var_907 = param4;
         var_354 = param5;
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
      
      public function get gender() : String
      {
         return var_122;
      }
   }
}
