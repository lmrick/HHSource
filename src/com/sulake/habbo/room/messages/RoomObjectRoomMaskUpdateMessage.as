package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const ADD_MASK:String = "RORMUM_ADD_MASK";
      
      public static const REMOVE_MASK:String = "RORMUM_ADD_MASK";
      
      public static const MASK_TYPE_DOOR:String = "door";
      
      public static const MASK_CATEGORY_WINDOW:String = "window";
      
      public static const MASK_CATEGORY_HOLE:String = "hole";
       
      
      private var var_271:String = "";
      
      private var var_3787:String = "";
      
      private var var_4241:String = "";
      
      private var var_4043:Vector3d = null;
      
      private var var_3905:String = "window";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         var_271 = param1;
         var_3787 = param2;
         var_4241 = param3;
         if(param4 != null)
         {
            var_4043 = new Vector3d(param4.x,param4.y,param4.z);
         }
         var_3905 = param5;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get maskId() : String
      {
         return var_3787;
      }
      
      public function get maskType() : String
      {
         return var_4241;
      }
      
      public function get maskLocation() : IVector3d
      {
         return var_4043;
      }
      
      public function get maskCategory() : String
      {
         return var_3905;
      }
   }
}
