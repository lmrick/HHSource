package com.sulake.room.events
{
   import com.sulake.room.object.IRoomObject;
   
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const ROOM_OBJECT_MOUSE_CLICK:String = "ROE_MOUSE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_ENTER:String = "ROE_MOUSE_ENTER";
      
      public static const ROOM_OBJECT_MOUSE_MOVE:String = "ROE_MOUSE_MOVE";
      
      public static const ROOM_OBJECT_MOUSE_LEAVE:String = "ROE_MOUSE_LEAVE";
      
      public static const ROOM_OBJECT_MOUSE_DOUBLE_CLICK:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_3591:String = "";
      
      private var _altKey:Boolean;
      
      private var _ctrlKey:Boolean;
      
      private var _shiftKey:Boolean;
      
      private var var_4148:Boolean;
      
      private var var_710:int;
      
      private var var_884:int;
      
      private var var_4161:int;
      
      private var var_3878:int;
      
      public function RoomObjectMouseEvent(param1:String, param2:IRoomObject, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param8,param9);
         var_3591 = param3;
         _altKey = param4;
         _ctrlKey = param5;
         _shiftKey = param6;
         var_4148 = param7;
      }
      
      public function get eventId() : String
      {
         return var_3591;
      }
      
      public function get altKey() : Boolean
      {
         return _altKey;
      }
      
      public function get ctrlKey() : Boolean
      {
         return _ctrlKey;
      }
      
      public function get shiftKey() : Boolean
      {
         return _shiftKey;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_4148;
      }
      
      public function get localX() : int
      {
         return var_710;
      }
      
      public function get localY() : int
      {
         return var_884;
      }
      
      public function get spriteOffsetX() : int
      {
         return var_4161;
      }
      
      public function get spriteOffsetY() : int
      {
         return var_3878;
      }
      
      public function set localX(param1:int) : void
      {
         var_710 = param1;
      }
      
      public function set localY(param1:int) : void
      {
         var_884 = param1;
      }
      
      public function set spriteOffsetX(param1:int) : void
      {
         var_4161 = param1;
      }
      
      public function set spriteOffsetY(param1:int) : void
      {
         var_3878 = param1;
      }
   }
}
