package com.sulake.habbo.room.events
{
   public class RoomEngineObjectPlaySoundEvent extends RoomEngineObjectEvent
   {
      
      public static const PLAY_SOUND:String = "REPSE_PLAY_SOUND";
      
      public static const PLAY_SOUND_AT_PITCH:String = "REPSE_PLAY_SOUND_AT_PITCH";
       
      
      private var var_3765:String;
      
      private var var_2661:Number;
      
      public function RoomEngineObjectPlaySoundEvent(param1:String, param2:int, param3:int, param4:int, param5:String, param6:Number = 1, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param2,param3,param4);
         var_3765 = param5;
         var_2661 = param6;
      }
      
      public function get soundId() : String
      {
         return var_3765;
      }
      
      public function get pitch() : Number
      {
         return var_2661;
      }
   }
}
