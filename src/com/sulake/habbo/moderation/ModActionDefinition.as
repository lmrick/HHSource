package com.sulake.habbo.moderation
{
   public class ModActionDefinition
   {
      
      public static const ALERT:int = 1;
      
      public static const MUTE:int = 2;
      
      public static const BAN:int = 3;
      
      public static const KICK:int = 4;
      
      public static const TRADING_LOCK:int = 5;
      
      public static const MESSAGE:int = 6;
       
      
      private var var_4246:int;
      
      private var _name:String;
      
      private var var_593:int;
      
      private var var_3997:int;
      
      private var _actionLengthHours:int;
      
      public function ModActionDefinition(param1:int, param2:String, param3:int, param4:int, param5:int)
      {
         super();
         var_4246 = param1;
         _name = param2;
         var_593 = param3;
         var_3997 = param4;
         _actionLengthHours = param5;
      }
      
      public function get actionId() : int
      {
         return var_4246;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get actionType() : int
      {
         return var_593;
      }
      
      public function get sanctionTypeId() : int
      {
         return var_3997;
      }
      
      public function get actionLengthHours() : int
      {
         return _actionLengthHours;
      }
   }
}
