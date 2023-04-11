package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.data.class_1663;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.furniture.highscore.HighScoreDisplayWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class HighScoreFurniWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_311:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_1429:HighScoreDisplayWidget = null;
      
      private var var_2006:RoomEngineObjectEvent = null;
      
      public function HighScoreFurniWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get type() : String
      {
         return "RWE_HIGH_SCORE_DISPLAY";
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function set widget(param1:HighScoreDisplayWidget) : void
      {
         var_1429 = param1;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         _container.addUpdateListener(this);
      }
      
      public function dispose() : void
      {
         if(_container)
         {
            _container.removeUpdateListener(this);
         }
         var_311 = true;
         _container = null;
         var_1429 = null;
      }
      
      public function getProcessedEvents() : Array
      {
         return ["RETWE_REQUEST_HIGH_SCORE_DISPLAY","RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY"];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc4_:RoomEngineObjectEvent = null;
         var _loc2_:IRoomObject = null;
         var _loc5_:IRoomObjectModel = null;
         var _loc3_:class_1663 = null;
         if(disposed || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case "RETWE_REQUEST_HIGH_SCORE_DISPLAY":
               _loc4_ = RoomEngineObjectEvent(param1);
               _loc2_ = _container.roomEngine.getRoomObject(_loc4_.roomId,_loc4_.objectId,_loc4_.category);
               if(_loc2_ != null)
               {
                  if((_loc5_ = _loc2_.getModel()) != null)
                  {
                     _loc3_ = new class_1663();
                     _loc3_.initializeFromRoomObjectModel(_loc5_);
                     var_1429.open(_loc4_.objectId,_loc4_.roomId,_loc3_);
                  }
                  var_2006 = _loc4_;
                  break;
               }
               break;
            case "RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY":
               if((_loc4_ = RoomEngineObjectEvent(param1)).roomId == var_1429.roomId && _loc4_.objectId == var_1429.roomObjId)
               {
                  var_1429.close();
                  break;
               }
         }
      }
      
      public function getWidgetMessages() : Array
      {
         return null;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         return null;
      }
      
      public function update() : void
      {
         var _loc1_:IRoomObject = null;
         var _loc2_:Point = null;
         if(var_2006 && false)
         {
            _loc1_ = _container.roomEngine.getRoomObject(var_2006.roomId,var_2006.objectId,var_2006.category);
            if(_loc1_ != null)
            {
               _loc2_ = _container.roomEngine.getRoomObjectScreenLocation(var_2006.roomId,var_2006.objectId,var_2006.category);
               if(_loc2_ != null)
               {
                  var_1429.setRelativePositionToRoomObjectAt(_loc2_.x,_loc2_.y);
               }
            }
         }
      }
   }
}
