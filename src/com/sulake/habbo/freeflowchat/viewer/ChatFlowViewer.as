package com.sulake.habbo.freeflowchat.viewer
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_41;
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.freeflowchat.viewer.simulation.ChatFlowStage;
   import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class ChatFlowViewer implements class_13, class_41
   {
       
      
      private const VIEW_BOTTOM_DEFAULT:int = 230;
      
      private var var_1460:HabboFreeFlowChat;
      
      private var var_1766:ChatFlowStage;
      
      private var _rootDisplayObject:DisplayObjectContainer;
      
      private var var_4217:int;
      
      private var var_3635:int = 0;
      
      private var _runTime:uint = 0;
      
      private var var_4324:Number = 0.25;
      
      private var var_1559:Vector.<PooledChatBubble>;
      
      private var _toRemove:Vector.<PooledChatBubble>;
      
      public function ChatFlowViewer(param1:HabboFreeFlowChat, param2:ChatFlowStage)
      {
         var_1559 = new Vector.<PooledChatBubble>(0);
         _toRemove = new Vector.<PooledChatBubble>(0);
         super();
         _rootDisplayObject = new Sprite();
         var_1460 = param1;
         var_1460.registerUpdateReceiver(this,1);
         var_1766 = param2;
      }
      
      public function dispose() : void
      {
         if(var_1460)
         {
            var_1460.removeUpdateReceiver(this);
            var_1460 = null;
         }
         var_1766 = null;
         _rootDisplayObject = null;
      }
      
      public function get disposed() : Boolean
      {
         return _rootDisplayObject == null && var_1460 == null;
      }
      
      public function insertBubble(param1:PooledChatBubble, param2:Point) : void
      {
         param1.roomPanOffsetX = var_3635;
         var_1559.push(param1);
         _rootDisplayObject.addChild(param1);
         param1.warpTo(param2.x,param2.y);
         param1.repositionPointer();
         var_4217 = param1.roomId;
      }
      
      public function update(param1:uint) : void
      {
         var _loc6_:int = 0;
         _runTime += param1;
         var _loc3_:Point = var_1460.roomEngine.getRoomCanvasScreenOffset(var_4217);
         if(_loc3_ != null)
         {
            if(_loc3_.x != var_3635 && false)
            {
               for each(var _loc2_ in var_1559)
               {
                  _loc2_.roomPanOffsetX = _loc3_.x;
               }
            }
            var_3635 = _loc3_.x;
         }
         for each(var _loc4_ in var_1559)
         {
            _loc4_.update(param1);
            if(_loc4_.readyToRecycle)
            {
               _toRemove.push(_loc4_);
            }
         }
         if(false)
         {
            for each(var _loc5_ in _toRemove)
            {
               _rootDisplayObject.removeChild(_loc5_);
               _loc6_ = var_1559.indexOf(_loc5_);
               var_1559.splice(_loc6_,1);
               _loc5_.unregister();
               var_1460.chatBubbleFactory.recycle(_loc5_);
            }
            _toRemove = new Vector.<PooledChatBubble>(0);
         }
      }
      
      public function get rootDisplayObject() : DisplayObjectContainer
      {
         return _rootDisplayObject;
      }
      
      public function get viewBottom() : int
      {
         if(true)
         {
            return 230;
         }
         return _rootDisplayObject.stage.stageHeight * var_4324;
      }
      
      public function resize(param1:int, param2:int) : void
      {
         if(var_1766)
         {
            var_1766.resize(param1,param2);
         }
      }
   }
}
