package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const OFFER:String = "RSPE_POLL_OFFER";
      
      public static const ERROR:String = "RSPE_POLL_ERROR";
      
      public static const CONTENT:String = "RSPE_POLL_CONTENT";
       
      
      private var var_247:int = -1;
      
      private var _headline:String;
      
      private var var_536:String;
      
      private var var_290:int = 0;
      
      private var _startMessage:String = "";
      
      private var _endMessage:String = "";
      
      private var _questionArray:Array = null;
      
      private var var_901:Boolean = false;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         var_247 = param3;
         super(param1,param2);
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get headline() : String
      {
         return _headline;
      }
      
      public function set headline(param1:String) : void
      {
         _headline = param1;
      }
      
      public function get summary() : String
      {
         return var_536;
      }
      
      public function set summary(param1:String) : void
      {
         var_536 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_290;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_290 = param1;
      }
      
      public function get startMessage() : String
      {
         return _startMessage;
      }
      
      public function set startMessage(param1:String) : void
      {
         _startMessage = param1;
      }
      
      public function get endMessage() : String
      {
         return _endMessage;
      }
      
      public function set endMessage(param1:String) : void
      {
         _endMessage = param1;
      }
      
      public function get questionArray() : Array
      {
         return _questionArray;
      }
      
      public function set questionArray(param1:Array) : void
      {
         _questionArray = param1;
      }
      
      public function get npsPoll() : Boolean
      {
         return var_901;
      }
      
      public function set npsPoll(param1:Boolean) : void
      {
         var_901 = param1;
      }
   }
}
