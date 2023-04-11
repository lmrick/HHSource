package com.sulake.habbo.room.utils
{
   public class RoomData
   {
       
      
      private var var_354:int;
      
      private var var_45:XML;
      
      private var var_351:String = null;
      
      private var var_371:String = null;
      
      private var var_558:String = null;
      
      public function RoomData(param1:int, param2:XML)
      {
         super();
         var_354 = param1;
         var_45 = param2;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get data() : XML
      {
         return var_45;
      }
      
      public function get floorType() : String
      {
         return var_351;
      }
      
      public function set floorType(param1:String) : void
      {
         var_351 = param1;
      }
      
      public function get wallType() : String
      {
         return var_371;
      }
      
      public function set wallType(param1:String) : void
      {
         var_371 = param1;
      }
      
      public function get landscapeType() : String
      {
         return var_558;
      }
      
      public function set landscapeType(param1:String) : void
      {
         var_558 = param1;
      }
   }
}
