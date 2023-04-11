package com.sulake.habbo.localization
{
   public class BadgeBaseAndLevel
   {
       
      
      private var var_632:String = "";
      
      private var var_262:int = 1;
      
      public function BadgeBaseAndLevel(param1:String)
      {
         super();
         var _loc2_:int = param1.length - 1;
         while(_loc2_ > 0 && isNumber(param1.charAt(_loc2_)))
         {
            _loc2_--;
         }
         var_632 = param1.substring(0,_loc2_ + 1);
         var _loc3_:String = param1.substring(_loc2_ + 1,param1.length);
         if(_loc3_ != null && _loc3_ != "")
         {
            var_262 = int(_loc3_);
         }
      }
      
      private function isNumber(param1:String) : Boolean
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ >= 48 && _loc2_ <= 57;
      }
      
      public function get base() : String
      {
         return var_632;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function set level(param1:int) : void
      {
         var_262 = Math.max(1,param1);
      }
      
      public function get badgeId() : String
      {
         return var_632 + var_262;
      }
   }
}
