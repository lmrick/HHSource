package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetCreditFurniRedeemMessage extends RoomWidgetMessage
   {
      
      public static const const_1025:String = "RWFCRM_REDEEM";
       
      
      private var var_347:int;
      
      public function RoomWidgetCreditFurniRedeemMessage(param1:String, param2:int)
      {
         super(param1);
         var_347 = param2;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
   }
}
