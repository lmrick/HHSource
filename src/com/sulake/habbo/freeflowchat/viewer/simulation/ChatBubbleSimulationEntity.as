package com.sulake.habbo.freeflowchat.viewer.simulation
{
   import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
   import flash.geom.Rectangle;
   
   public class ChatBubbleSimulationEntity
   {
      
      public static const VISUALIZATION_OVERLAP_VERTICAL:int = 10;
       
      
      protected const MOVE_NEGATIVE_FEEDBACK:Number = 0.1;
      
      protected var _visualization:PooledChatBubble;
      
      protected var var_29:Number;
      
      protected var var_28:Number;
      
      protected var var_1458:Rectangle;
      
      protected var var_1478:Rectangle = null;
      
      protected var var_2930:Number;
      
      protected var var_3051:Number;
      
      private const const_916:int = 2500;
      
      private var var_2572:Vector.<com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity>;
      
      private var var_4058:Boolean = false;
      
      public function ChatBubbleSimulationEntity(param1:PooledChatBubble, param2:Boolean = false)
      {
         var_1458 = new Rectangle();
         var_2572 = new Vector.<com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity>(0);
         super();
         _visualization = param1;
         var _loc3_:Rectangle = param1.overlap;
         var_29 = param1.x + (!!_loc3_ ? _loc3_.x : 0);
         var_28 = param1.y + (!!_loc3_ ? _loc3_.y : 0);
         var_1458.x = var_29;
         var_1458.y = var_28;
         var_1458.width = 0 - (!!_loc3_ ? _loc3_.x + _loc3_.width : 0);
         var_1458.height = -10 - (!!_loc3_ ? _loc3_.y + _loc3_.height : 0);
         if(true)
         {
            var_1458.height = _visualization.minHeight;
         }
         if(param2)
         {
            var_1478 = new Rectangle();
            var_1478.width = NaN;
            var_1478.height = _visualization.minHeight != -1 ? _visualization.minHeight : 0;
            var_1478.x = -2500;
            var_1478.y = var_1458.y;
         }
      }
      
      public function dispose() : void
      {
         if(_visualization)
         {
            _visualization.readyToRecycle = true;
         }
         _visualization = null;
         var_1458 = null;
         var_2572 = null;
         var_1478 = null;
      }
      
      public function get y() : Number
      {
         return var_28;
      }
      
      public function set y(param1:Number) : void
      {
         var_28 = param1;
         var_1458.y = var_28;
         if(var_1478)
         {
            var_1478.y = var_1458.y;
         }
      }
      
      public function get x() : Number
      {
         return var_29;
      }
      
      public function set x(param1:Number) : void
      {
         var_29 += (param1 - var_29) * 0.9;
         var_1458.x = var_29;
         if(var_1478)
         {
            var_1478.x = -2500;
         }
      }
      
      public function get visualRect() : Rectangle
      {
         return var_1458;
      }
      
      public function get wideRect() : Rectangle
      {
         return !!var_1478 ? var_1478 : var_1458;
      }
      
      public function get hasWideRect() : Boolean
      {
         return var_1478 != null;
      }
      
      public function get centerX() : Number
      {
         return var_29 + 0;
      }
      
      public function initializePosition(param1:Number, param2:Number) : void
      {
         var _loc3_:Rectangle = _visualization.overlap;
         var_29 = param1 + (!!_loc3_ ? _loc3_.x : 0);
         var_28 = param2 + (!!_loc3_ ? _loc3_.y : 0);
         var_1458.x = var_29;
         var_1458.y = var_28;
         if(var_1478)
         {
            var_1478.x = -2500;
            var_1478.y = var_1458.y;
         }
      }
      
      public function addHorizontalImpulse(param1:Number) : void
      {
         var_2930 += param1;
      }
      
      public function addCollisionHandled(param1:com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity) : void
      {
         var_2572.push(param1);
      }
      
      public function hasCollidedWith(param1:com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity) : Boolean
      {
         return var_2572.indexOf(param1) != -1;
      }
      
      public function addVerticalImpulse(param1:Number) : void
      {
         var_3051 += param1;
      }
      
      public function applyImpulseForces(param1:int) : void
      {
         x += var_2930;
         y += Math.max(var_3051,-param1);
      }
      
      public function resetSimulationStep() : void
      {
         var_2930 = 0;
         var_3051 = 0;
         var_2572 = new Vector.<com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity>(0);
      }
      
      public function syncToVisualization(param1:Boolean = false) : void
      {
         var _loc2_:Rectangle = _visualization.overlap;
         if(!param1)
         {
            _visualization.moveTo(int(var_29 - (!!_loc2_ ? _loc2_.x : 0)),int(var_28 - (!!_loc2_ ? _loc2_.y : 0)));
         }
         else
         {
            _visualization.warpTo(int(var_29 - (!!_loc2_ ? _loc2_.x : 0)),int(var_28 - (!!_loc2_ ? _loc2_.y : 0)));
         }
      }
      
      public function set fullHeightCollision(param1:Boolean) : void
      {
         if(var_1478)
         {
            var_1478.height = param1 ? var_1458.height : 0;
         }
      }
      
      public function get visualizationHasHitMargin() : Boolean
      {
         return _visualization.hasHitDesktopMargin;
      }
      
      public function set readyToRecycle(param1:Boolean) : void
      {
         _visualization.readyToRecycle = param1;
      }
      
      public function get readyToRecycle() : Boolean
      {
         return _visualization.readyToRecycle;
      }
      
      public function get timeStamp() : uint
      {
         return _visualization.timeStamp;
      }
      
      public function get isSpacer() : Boolean
      {
         return var_4058;
      }
      
      public function set isSpacer(param1:Boolean) : void
      {
         var_4058 = param1;
      }
      
      public function intersectsWith(param1:com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity) : Boolean
      {
         if(var_1478)
         {
            return var_1458.intersects(param1.var_1458) || var_1478.intersects(param1.wideRect);
         }
         if(param1.var_1478)
         {
            return var_1458.intersects(param1.var_1458) || var_1458.intersects(param1.var_1478);
         }
         return var_1458.intersects(param1.var_1458);
      }
      
      public function visualIntertersectsWith(param1:com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity) : Boolean
      {
         return var_1458.intersects(param1.var_1458);
      }
   }
}
