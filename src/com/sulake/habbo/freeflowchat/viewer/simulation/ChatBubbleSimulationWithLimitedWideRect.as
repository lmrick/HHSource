package com.sulake.habbo.freeflowchat.viewer.simulation
{
   import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
   import flash.geom.Rectangle;
   
   public class ChatBubbleSimulationWithLimitedWideRect extends ChatBubbleSimulationEntity
   {
      
      public static const WIDERECT_WIDTH:int = 240;
       
      
      private var _wideRectOffset:Number;
      
      public function ChatBubbleSimulationWithLimitedWideRect(param1:PooledChatBubble)
      {
         super(param1,false);
         var_1478 = new Rectangle();
         var_1478.width = 240;
         var_1478.height = 0;
         _wideRectOffset = -120;
         var_1478.x = var_1458.x + _wideRectOffset;
         var_1478.y = var_1458.y;
      }
      
      override public function set x(param1:Number) : void
      {
         var_29 += (param1 - var_29) * 0.9;
         var_1458.x = var_29;
         if(var_1478)
         {
            var_1478.x = var_1458.x + _wideRectOffset;
         }
      }
      
      override public function initializePosition(param1:Number, param2:Number) : void
      {
         var _loc3_:Rectangle = _visualization.overlap;
         var_29 = param1 + (!!_loc3_ ? _loc3_.x : 0);
         var_28 = param2 + (!!_loc3_ ? _loc3_.y : 0);
         var_1458.x = var_29;
         var_1458.y = var_28;
         if(var_1478)
         {
            var_1478.x = var_1458.x + _wideRectOffset;
            var_1478.y = var_1458.y;
         }
      }
      
      public function get wideRectOffset() : Number
      {
         return _wideRectOffset;
      }
      
      public function set wideRectOffset(param1:Number) : void
      {
         _wideRectOffset = param1;
      }
   }
}
