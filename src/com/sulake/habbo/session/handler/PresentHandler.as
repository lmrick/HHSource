package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import package_136.class_1277;
   import package_25.class_158;
   
   public class PresentHandler extends BaseHandler
   {
       
      
      public function PresentHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new class_158(onPresentOpened));
      }
      
      private function onPresentOpened(param1:IMessageEvent) : void
      {
         var _loc2_:class_1277 = (param1 as class_158).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(var_1459);
         if(_loc3_ == null)
         {
            return;
         }
         if(listener && false)
         {
            listener.events.dispatchEvent(new RoomSessionPresentEvent("RSPE_PRESENT_OPENED",_loc3_,_loc2_.classId,_loc2_.itemType,_loc2_.productCode,_loc2_.placedItemId,_loc2_.placedItemType,_loc2_.placedInRoom,_loc2_.petFigureString));
         }
      }
   }
}
