package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class FurnitureEditableInternalLinkLogic extends class_3126
   {
       
      
      private var _showStateOneOnceRendered:Boolean = false;
      
      private var _updateCount:int = 0;
      
      public function FurnitureEditableInternalLinkLogic()
      {
         super();
      }
      
      override public function initialize(param1:XML) : void
      {
         super.initialize(param1);
         if(param1 == null)
         {
            return;
         }
         var _loc2_:XMLList = param1.action;
         if(_loc2_.length() != 0)
         {
            object.getModelController().setString("furniture_internal_link",_loc2_.@link);
            if(_loc2_.@startState == "1")
            {
               _showStateOneOnceRendered = true;
            }
         }
      }
      
      override public function getEventTypes() : Array
      {
         return getAllEventTypes(super.getEventTypes(),["ROWRE_INTERNAL_LINK"]);
      }
      
      override public function useObject() : void
      {
         if(eventDispatcher != null && object != null)
         {
            eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent("ROWRE_INTERNAL_LINK",object));
         }
      }
      
      override public function update(param1:int) : void
      {
         super.update(param1);
         if(!_showStateOneOnceRendered)
         {
            return;
         }
         _updateCount++;
         if(_showStateOneOnceRendered && _updateCount == 20)
         {
            setAnimationState(1);
         }
      }
      
      public function setAnimationState(param1:int) : void
      {
         if(object == null)
         {
            return;
         }
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(_loc2_ != null)
         {
            _loc2_.setNumber("furniture_automatic_state_index",param1,false);
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type == "doubleClick" && _showStateOneOnceRendered)
         {
            setAnimationState(0);
         }
         super.mouseEvent(param1,param2);
      }
   }
}
