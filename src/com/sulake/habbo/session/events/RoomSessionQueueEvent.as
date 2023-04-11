package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionQueueEvent extends RoomSessionEvent
   {
      
      public static const QUEUE_STATUS:String = "RSQE_QUEUE_STATUS";
      
      public static const const_736:String = "c";
      
      public static const QUEUE_TYPE_NORMAL:String = "d";
      
      public static const const_654:int = 2;
      
      public static const const_642:int = 1;
       
      
      private var _name:String;
      
      private var var_319:int;
      
      private var var_431:class_24;
      
      private var var_2105:Boolean;
      
      private var var_4352:String;
      
      public function RoomSessionQueueEvent(param1:IRoomSession, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super("RSQE_QUEUE_STATUS",param1,param5,param6);
         _name = param2;
         var_319 = param3;
         var_431 = new class_24();
         var_2105 = param4;
      }
      
      public function get isActive() : Boolean
      {
         return var_2105;
      }
      
      public function get queueSetName() : String
      {
         return _name;
      }
      
      public function get queueSetTarget() : int
      {
         return var_319;
      }
      
      public function get queueTypes() : Array
      {
         return var_431.getKeys();
      }
      
      public function getQueueSize(param1:String) : int
      {
         return var_431.getValue(param1);
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         var_431.add(param1,param2);
      }
   }
}
