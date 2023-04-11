package com.sulake.habbo.avatar.actions
{
   public class ActionType
   {
       
      
      private var var_247:int;
      
      private var var_195:int;
      
      private var var_3282:Array;
      
      private var var_3530:Boolean = true;
      
      private var var_3299:Boolean = true;
      
      public function ActionType(param1:XML)
      {
         var_3282 = [];
         super();
         var_247 = parseInt(param1.@value);
         var_195 = parseInt(param1.@value);
         var _loc3_:String = String(param1.@prevents);
         if(_loc3_ != "")
         {
            var_3282 = _loc3_.split(",");
         }
         var_3530 = String(param1.@preventheadturn) == "true";
         var _loc2_:String = String(param1.@animated);
         if(_loc2_ == "")
         {
            var_3299 = true;
         }
         else
         {
            var_3299 = _loc2_ == "true";
         }
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get value() : int
      {
         return var_195;
      }
      
      public function get prevents() : Array
      {
         return var_3282;
      }
      
      public function get preventHeadTurn() : Boolean
      {
         return var_3530;
      }
      
      public function get isAnimated() : Boolean
      {
         return var_3299;
      }
   }
}
