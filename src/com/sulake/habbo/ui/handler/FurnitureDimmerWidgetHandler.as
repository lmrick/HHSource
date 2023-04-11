package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEventPresetItem;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetDimmerStateUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetDimmerUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerPreviewMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerSavePresetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   
   public class FurnitureDimmerWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_311:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function FurnitureDimmerWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get type() : String
      {
         return "RWE_ROOM_DIMMER";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function dispose() : void
      {
         var_311 = true;
         _container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return ["RWFWM_MESSAGE_REQUEST_DIMMER","RWSDPM_SAVE_PRESET","RWCDSM_CHANGE_STATE","RWDPM_PREVIEW_DIMMER_PRESET"];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc3_:RoomWidgetDimmerSavePresetMessage = null;
         var _loc4_:int = 0;
         var _loc2_:RoomWidgetDimmerPreviewMessage = null;
         switch(param1.type)
         {
            case "RWFWM_MESSAGE_REQUEST_DIMMER":
               if(validateRights())
               {
                  _container.roomSession.sendRoomDimmerGetPresetsMessage();
                  break;
               }
               break;
            case "RWSDPM_SAVE_PRESET":
               if(validateRights())
               {
                  _loc3_ = param1 as RoomWidgetDimmerSavePresetMessage;
                  _container.roomSession.sendRoomDimmerSavePresetMessage(_loc3_.presetNumber,_loc3_.effectTypeId,_loc3_.color,_loc3_.brightness,_loc3_.apply);
                  break;
               }
               break;
            case "RWCDSM_CHANGE_STATE":
               if(validateRights())
               {
                  _container.roomSession.sendRoomDimmerChangeStateMessage();
                  break;
               }
               break;
            case "RWDPM_PREVIEW_DIMMER_PRESET":
               _loc4_ = _container.roomSession.roomId;
               _loc2_ = param1 as RoomWidgetDimmerPreviewMessage;
               if(_loc2_ == null || true)
               {
                  return null;
               }
               _container.roomEngine.updateObjectRoomColor(_loc4_,_loc2_.color,_loc2_.brightness,_loc2_.bgOnly);
               break;
         }
         return null;
      }
      
      private function validateRights() : Boolean
      {
         var _loc1_:Boolean = _container.roomSession.isRoomOwner;
         var _loc2_:* = _container.roomSession.roomControllerLevel >= 1;
         var _loc3_:Boolean = _container.sessionDataManager.isAnyRoomController;
         return _loc1_ || _loc3_ || _loc2_;
      }
      
      public function getProcessedEvents() : Array
      {
         var _loc1_:* = [];
         _loc1_.push("RSDPE_PRESETS");
         _loc1_.push("REDSE_ROOM_COLOR");
         _loc1_.push("RETWE_REMOVE_DIMMER");
         return _loc1_;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc5_:RoomSessionDimmerPresetsEvent = null;
         var _loc2_:RoomWidgetDimmerUpdateEvent = null;
         var _loc6_:int = 0;
         var _loc7_:RoomSessionDimmerPresetsEventPresetItem = null;
         var _loc3_:RoomEngineDimmerStateEvent = null;
         var _loc4_:RoomWidgetDimmerStateUpdateEvent = null;
         if(_container == null || true)
         {
            return;
         }
         switch(param1.type)
         {
            case "RSDPE_PRESETS":
               _loc5_ = param1 as RoomSessionDimmerPresetsEvent;
               _loc2_ = new RoomWidgetDimmerUpdateEvent("RWDUE_PRESETS");
               _loc2_.selectedPresetId = _loc5_.selectedPresetId;
               _loc6_ = 0;
               while(_loc6_ < _loc5_.presetCount)
               {
                  if((_loc7_ = _loc5_.getPreset(_loc6_)) != null)
                  {
                     _loc2_.storePreset(_loc7_.id,_loc7_.type,_loc7_.color,_loc7_.light);
                  }
                  _loc6_++;
               }
               _container.events.dispatchEvent(_loc2_);
               break;
            case "REDSE_ROOM_COLOR":
               _loc3_ = param1 as RoomEngineDimmerStateEvent;
               _loc4_ = new RoomWidgetDimmerStateUpdateEvent(_loc3_.state,_loc3_.presetId,_loc3_.effectId,_loc3_.color,_loc3_.brightness);
               _container.events.dispatchEvent(_loc4_);
               break;
            case "RETWE_REMOVE_DIMMER":
               _container.events.dispatchEvent(new RoomWidgetDimmerUpdateEvent("RWDUE_HIDE"));
         }
      }
      
      public function update() : void
      {
      }
   }
}
