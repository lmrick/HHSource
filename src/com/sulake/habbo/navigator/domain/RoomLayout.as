package com.sulake.habbo.navigator.domain
{
   import com.sulake.core.window.class_3151;
   
   public class RoomLayout
   {
       
      
      private var var_262:int;
      
      private var var_3747:int;
      
      private var _name:String;
      
      private var var_1430:class_3151;
      
      public function RoomLayout(param1:int, param2:int, param3:String)
      {
         super();
         var_262 = param1;
         var_3747 = param2;
         _name = param3;
      }
      
      public function get requiredClubLevel() : int
      {
         return var_262;
      }
      
      public function get tileSize() : int
      {
         return var_3747;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get view() : class_3151
      {
         return var_1430;
      }
      
      public function set view(param1:class_3151) : void
      {
         var_1430 = param1;
      }
   }
}
