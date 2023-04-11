package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectTileCursorUpdateMessage extends RoomObjectUpdateMessage
   {
       
      
      private var var_47:Number;
      
      private var var_3923:String;
      
      private var var_805:Boolean;
      
      private var var_3906:Boolean;
      
      public function RoomObjectTileCursorUpdateMessage(param1:Vector3d, param2:Number, param3:Boolean, param4:String, param5:Boolean = false)
      {
         super(param1,null);
         var_47 = param2;
         var_805 = param3;
         var_3923 = param4;
         var_3906 = param5;
      }
      
      public function get height() : Number
      {
         return var_47;
      }
      
      public function get visible() : Boolean
      {
         return var_805;
      }
      
      public function get sourceEventId() : String
      {
         return var_3923;
      }
      
      public function get toggleVisibility() : Boolean
      {
         return var_3906;
      }
   }
}
