package com.sulake.habbo.sound.events
{
   import flash.events.Event;
   
   public class SongInfoReceivedEvent extends Event
   {
      
      public static const TRAX_SONG_INFO_RECEIVED:String = "SIR_TRAX_SONG_INFO_RECEIVED";
       
      
      private var var_247:int;
      
      public function SongInfoReceivedEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         var_247 = param2;
      }
      
      public function get id() : int
      {
         return var_247;
      }
   }
}
