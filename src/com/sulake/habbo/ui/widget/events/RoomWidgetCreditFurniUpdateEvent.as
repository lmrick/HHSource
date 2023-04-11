package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetCreditFurniUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const UPDATE_CREDIT_FURNI:String = "RWCFUE_CREDIT_FURNI_UPDATE";
       
      
      private var var_347:int;
      
      private var var_3895:Number;
      
      public function RoomWidgetCreditFurniUpdateEvent(param1:String, param2:int, param3:Number, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         var_3895 = param3;
         var_347 = param2;
      }
      
      public function get creditValue() : Number
      {
         return var_3895;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
   }
}
