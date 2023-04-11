package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetPollMessage extends RoomWidgetMessage
   {
      
      public static const START:String = "RWPM_START";
      
      public static const REJECT:String = "RWPM_REJECT";
      
      public static const ANSWER:String = "RWPM_ANSWER";
       
      
      private var var_247:int = -1;
      
      private var var_327:int = 0;
      
      private var _answers:Array = null;
      
      public function RoomWidgetPollMessage(param1:String, param2:int)
      {
         var_247 = param2;
         super(param1);
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get questionId() : int
      {
         return var_327;
      }
      
      public function set questionId(param1:int) : void
      {
         var_327 = param1;
      }
      
      public function get answers() : Array
      {
         return _answers;
      }
      
      public function set answers(param1:Array) : void
      {
         _answers = param1;
      }
   }
}
