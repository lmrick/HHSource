package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const REQUEST_COMMANDS:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const PET_COMMAND:String = "RWPCM_PET_COMMAND";
      
      public static const BREED_TRAIN_COMMAND_ID:int = 46;
       
      
      private var var_421:int = 0;
      
      private var var_195:String;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         var_421 = param2;
         var_195 = param3;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get value() : String
      {
         return var_195;
      }
   }
}
