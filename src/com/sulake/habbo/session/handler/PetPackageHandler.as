package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
   import package_136.class_1097;
   import package_136.class_1511;
   import package_25.class_690;
   import package_25.class_773;
   
   public class PetPackageHandler extends BaseHandler
   {
       
      
      public function PetPackageHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new class_690(onOpenPetPackageRequested));
         param1.addMessageEvent(new class_773(onOpenPetPackageResult));
      }
      
      private function onOpenPetPackageRequested(param1:IMessageEvent) : void
      {
         var _loc2_:class_1511 = (param1 as class_690).getParser();
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
            listener.events.dispatchEvent(new RoomSessionPetPackageEvent("RSOPPE_OPEN_PET_PACKAGE_REQUESTED",_loc3_,_loc2_.objectId,_loc2_.figureData,0,null));
         }
      }
      
      private function onOpenPetPackageResult(param1:IMessageEvent) : void
      {
         var _loc2_:class_1097 = (param1 as class_773).getParser();
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
            listener.events.dispatchEvent(new RoomSessionPetPackageEvent("RSOPPE_OPEN_PET_PACKAGE_RESULT",_loc3_,_loc2_.objectId,null,_loc2_.nameValidationStatus,_loc2_.nameValidationInfo));
         }
      }
   }
}
