package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
   import package_136.class_1179;
   import package_25.class_1620;
   import package_25.class_828;
   
   public class RoomDimmerPresetsHandler extends BaseHandler
   {
       
      
      public function RoomDimmerPresetsHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new class_828(onRoomDimmerPresets));
      }
      
      private function onRoomDimmerPresets(param1:IMessageEvent) : void
      {
         var _loc4_:int = 0;
         var _loc6_:class_1620 = null;
         var _loc5_:class_828;
         if((_loc5_ = param1 as class_828) == null || _loc5_.getParser() == null)
         {
            return;
         }
         var _loc2_:class_1179 = _loc5_.getParser();
         var _loc3_:IRoomSession = listener.getSession(var_1459);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc7_:RoomSessionDimmerPresetsEvent;
         (_loc7_ = new RoomSessionDimmerPresetsEvent("RSDPE_PRESETS",_loc3_)).selectedPresetId = _loc2_.selectedPresetId;
         _loc4_ = 0;
         while(_loc4_ < _loc2_.presetCount)
         {
            if((_loc6_ = _loc2_.getPreset(_loc4_)) != null)
            {
               _loc7_.storePreset(_loc6_.id,_loc6_.type,_loc6_.color,_loc6_.light);
            }
            _loc4_++;
         }
         if(listener && false)
         {
            listener.events.dispatchEvent(_loc7_);
         }
      }
   }
}
