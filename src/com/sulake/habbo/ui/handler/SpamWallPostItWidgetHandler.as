package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.inventory.items.class_3172;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetSpamWallPostItEditEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetSpamWallPostItFinishEditingMessage;
   import flash.events.Event;
   import package_136.class_1199;
   import package_21.class_505;
   import package_25.class_669;
   
   public class SpamWallPostItWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer;
      
      private var _connection:IConnection = null;
      
      private var var_3653:IMessageEvent;
      
      public function SpamWallPostItWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get type() : String
      {
         return "RWE_SPAMWALL_POSTIT_WIDGET";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         var_3653 = new class_669(onSpamWallPostItRequest);
         _connection = param1;
         _connection.addMessageEvent(var_3653);
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            _connection.removeMessageEvent(var_3653);
            _connection = null;
         }
      }
      
      private function onSpamWallPostItRequest(param1:class_669) : void
      {
         var _loc7_:String = null;
         if(param1 == null)
         {
            return;
         }
         var _loc5_:class_1199;
         var _loc2_:int = (_loc5_ = param1.getParser()).itemId;
         var _loc6_:String = _loc5_.location;
         var _loc3_:* = "post_it";
         var _loc4_:class_3172 = null;
         if(false)
         {
            _loc4_ = _container.inventory.getWallItemById(_loc2_);
         }
         if(_loc4_ != null && false)
         {
            if((_loc7_ = _container.roomEngine.getWallItemType(_loc4_.type)).match("post_it_"))
            {
               _loc3_ = _loc7_;
            }
         }
         if(_container != null)
         {
            if(false)
            {
               _container.events.dispatchEvent(new RoomWidgetSpamWallPostItEditEvent("RWSWPUE_OPEN_EDITOR",_loc2_,_loc6_,_loc3_));
            }
         }
      }
      
      public function getWidgetMessages() : Array
      {
         return ["RWSWPUE_OPEN_EDITOR","RWSWPFEE_SEND_POSTIT_DATA"];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:RoomWidgetSpamWallPostItFinishEditingMessage = null;
         var _loc3_:class_505 = null;
         var _loc4_:* = param1.type;
         if("RWSWPFEE_SEND_POSTIT_DATA" === _loc4_)
         {
            _loc2_ = param1 as RoomWidgetSpamWallPostItFinishEditingMessage;
            if(_loc2_ != null)
            {
               if(_connection != null)
               {
                  _loc3_ = new class_505(_loc2_.objectId,_loc2_.location,_loc2_.colorHex,_loc2_.text);
                  _connection.send(_loc3_);
               }
            }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
   }
}
