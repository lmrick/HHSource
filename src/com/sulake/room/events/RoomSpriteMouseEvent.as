package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_271:String = "";
      
      private var var_3591:String = "";
      
      private var var_3541:String = "";
      
      private var var_3993:String = "";
      
      private var var_3748:Number = 0;
      
      private var var_4239:Number = 0;
      
      private var var_710:Number = 0;
      
      private var var_884:Number = 0;
      
      private var _ctrlKey:Boolean = false;
      
      private var _altKey:Boolean = false;
      
      private var _shiftKey:Boolean = false;
      
      private var var_4148:Boolean = false;
      
      private var var_4161:int = 0;
      
      private var var_3878:int = 0;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         var_271 = param1;
         var_3591 = param2;
         var_3541 = param3;
         var_3993 = param4;
         var_3748 = param5;
         var_4239 = param6;
         var_710 = param7;
         var_884 = param8;
         _ctrlKey = param9;
         _altKey = param10;
         _shiftKey = param11;
         var_4148 = param12;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get eventId() : String
      {
         return var_3591;
      }
      
      public function get canvasId() : String
      {
         return var_3541;
      }
      
      public function get spriteTag() : String
      {
         return var_3993;
      }
      
      public function get screenX() : Number
      {
         return var_3748;
      }
      
      public function get screenY() : Number
      {
         return var_4239;
      }
      
      public function get localX() : Number
      {
         return var_710;
      }
      
      public function get localY() : Number
      {
         return var_884;
      }
      
      public function get ctrlKey() : Boolean
      {
         return _ctrlKey;
      }
      
      public function get altKey() : Boolean
      {
         return _altKey;
      }
      
      public function get shiftKey() : Boolean
      {
         return _shiftKey;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_4148;
      }
      
      public function get spriteOffsetX() : int
      {
         return var_4161;
      }
      
      public function set spriteOffsetX(param1:int) : void
      {
         var_4161 = param1;
      }
      
      public function get spriteOffsetY() : int
      {
         return var_3878;
      }
      
      public function set spriteOffsetY(param1:int) : void
      {
         var_3878 = param1;
      }
   }
}
