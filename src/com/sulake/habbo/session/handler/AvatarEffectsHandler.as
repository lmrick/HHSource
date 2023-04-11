package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import package_131.class_1325;
   import package_61.class_1007;
   
   public class AvatarEffectsHandler extends BaseHandler
   {
       
      
      public function AvatarEffectsHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
      }
      
      private function onAvatarEffects(param1:IMessageEvent) : void
      {
         var _loc3_:class_1007 = param1 as class_1007;
         var _loc2_:class_1325 = _loc3_.getParser() as class_1325;
         class_14.log("Received active avatar effects: " + _loc2_.effects);
         if(listener && false)
         {
         }
      }
   }
}
