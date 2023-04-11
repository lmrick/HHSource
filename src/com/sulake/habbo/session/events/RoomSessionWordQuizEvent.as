package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.session.IRoomSession;
   import flash.utils.Dictionary;
   
   public class RoomSessionWordQuizEvent extends RoomSessionEvent
   {
      
      public static const const_466:String = "RWPUW_NEW_QUESTION";
      
      public static const FINISHED:String = "RWPUW_QUESION_FINSIHED";
      
      public static const const_459:String = "RWPUW_QUESTION_ANSWERED";
       
      
      private var var_247:int = -1;
      
      private var var_517:String = null;
      
      private var var_382:int = -1;
      
      private var var_327:int = -1;
      
      private var _duration:int = -1;
      
      private var _question:Dictionary = null;
      
      private var var_339:int = -1;
      
      private var var_195:String;
      
      private var var_256:class_24;
      
      public function RoomSessionWordQuizEvent(param1:String, param2:IRoomSession, param3:int = -1)
      {
         var_247 = param3;
         super(param1,param2);
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get pollType() : String
      {
         return var_517;
      }
      
      public function set pollType(param1:String) : void
      {
         var_517 = param1;
      }
      
      public function get pollId() : int
      {
         return var_382;
      }
      
      public function set pollId(param1:int) : void
      {
         var_382 = param1;
      }
      
      public function get questionId() : int
      {
         return var_327;
      }
      
      public function set questionId(param1:int) : void
      {
         var_327 = param1;
      }
      
      public function get duration() : int
      {
         return _duration;
      }
      
      public function set duration(param1:int) : void
      {
         _duration = param1;
      }
      
      public function get question() : Dictionary
      {
         return _question;
      }
      
      public function set question(param1:Dictionary) : void
      {
         _question = param1;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function set userId(param1:int) : void
      {
         var_339 = param1;
      }
      
      public function get value() : String
      {
         return var_195;
      }
      
      public function set value(param1:String) : void
      {
         var_195 = param1;
      }
      
      public function get answerCounts() : class_24
      {
         return var_256;
      }
      
      public function set answerCounts(param1:class_24) : void
      {
         var_256 = param1;
      }
   }
}
