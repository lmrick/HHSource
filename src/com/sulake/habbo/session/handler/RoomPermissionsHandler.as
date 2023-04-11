package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import package_103.class_476;
   import package_103.class_663;
   import package_103.class_765;
   import package_160.class_1129;
   import package_160.class_1173;
   
   public class RoomPermissionsHandler extends BaseHandler
   {
       
      
      public function RoomPermissionsHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new class_765(onYouAreController));
         param1.addMessageEvent(new class_663(onYouAreNotController));
         param1.addMessageEvent(new class_476(onYouAreOwner));
      }
      
      private function onYouAreController(param1:IMessageEvent) : void
      {
         var _loc4_:class_765;
         if((_loc4_ = param1 as class_765) == null)
         {
            return;
         }
         var _loc2_:class_1173 = _loc4_.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(_loc2_.flatId);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.roomControllerLevel = _loc2_.roomControllerLevel;
      }
      
      private function onYouAreNotController(param1:IMessageEvent) : void
      {
         var _loc4_:class_663;
         if((_loc4_ = param1 as class_663) == null)
         {
            return;
         }
         var _loc2_:class_1129 = _loc4_.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(_loc2_.flatId);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.roomControllerLevel = 0;
      }
      
      private function onYouAreOwner(param1:IMessageEvent) : void
      {
         var _loc3_:class_476 = param1 as class_476;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:IRoomSession = listener.getSession(var_1459);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.isRoomOwner = true;
      }
   }
}
