package com.sulake.habbo.game.events
{
   import flash.events.Event;
   
   public class GameChatEvent extends Event
   {
      
      public static const GAME_CHAT:String = "gce_game_chat";
       
      
      private var var_339:int;
      
      private var var_357:String;
      
      private var var_831:int;
      
      private var _color:uint;
      
      private var var_427:String;
      
      private var var_122:String;
      
      private var _name:String;
      
      private var var_905:int;
      
      private var var_2435:Boolean;
      
      public function GameChatEvent(param1:String, param2:int, param3:String, param4:int, param5:uint, param6:String, param7:String, param8:String, param9:int, param10:Boolean, param11:Boolean = false, param12:Boolean = false)
      {
         super(param1,param11,param12);
         var_339 = param2;
         var_357 = param3;
         var_831 = param4;
         _color = param5;
         var_427 = param6;
         var_122 = param7;
         _name = param8;
         var_905 = param9;
         var_2435 = param10;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get message() : String
      {
         return var_357;
      }
      
      public function get locX() : int
      {
         return var_831;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get teamId() : int
      {
         return var_905;
      }
      
      public function get notify() : Boolean
      {
         return var_2435;
      }
   }
}
