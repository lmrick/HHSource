package com.sulake.habbo.ui.widget.events
{
   public class UseProductItem
   {
       
      
      private var var_247:int;
      
      private var var_774:int;
      
      private var _name:String;
      
      private var var_3004:int;
      
      private var var_2795:int;
      
      private var var_3928:int;
      
      private var var_3877:Boolean;
      
      public function UseProductItem(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int = -1, param7:Boolean = false)
      {
         super();
         var_247 = param1;
         var_774 = param2;
         _name = param3;
         var_3004 = param4;
         var_2795 = param5;
         var_3928 = param6;
         var_3877 = param7;
      }
      
      public function dispose() : void
      {
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get requestRoomObjectId() : int
      {
         return var_3004;
      }
      
      public function get targetRoomObjectId() : int
      {
         return var_2795;
      }
      
      public function get requestInventoryStripId() : int
      {
         return var_3928;
      }
      
      public function get replace() : Boolean
      {
         return var_3877;
      }
   }
}
