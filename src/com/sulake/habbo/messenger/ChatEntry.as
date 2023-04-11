package com.sulake.habbo.messenger
{
   import flash.utils.getTimer;
   
   public class ChatEntry
   {
      
      public static const TYPE_OWN_CHAT:int = 1;
      
      public static const TYPE_OTHER_CHAT:int = 2;
      
      public static const const_1076:int = 3;
      
      public static const TYPE_INFO:int = 4;
      
      public static const const_1028:int = 5;
       
      
      private var var_271:int;
      
      private var var_1323:int;
      
      private var var_357:String;
      
      private var var_1364:int;
      
      private var _clientReceiveTime:int;
      
      private var var_1271:String;
      
      public function ChatEntry(param1:int, param2:int, param3:String, param4:int, param5:String = null)
      {
         super();
         var_271 = param1;
         var_1323 = param2;
         var_357 = param3;
         var_1364 = param4;
         _clientReceiveTime = getTimer();
         var_1271 = param5;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get senderId() : int
      {
         return var_1323;
      }
      
      public function get message() : String
      {
         return var_357;
      }
      
      public function get extraData() : String
      {
         return var_1271;
      }
      
      public function get secondsSinceSent() : int
      {
         var _loc1_:int = (getTimer() - _clientReceiveTime) / 1000;
         return var_1364 + _loc1_;
      }
      
      public function sentTimeStamp() : Number
      {
         return new Date().getTime() - secondsSinceSent * 1000;
      }
      
      public function prefixMessageWith(param1:String) : void
      {
         var_357 = param1 + "\n" + var_357;
      }
   }
}
