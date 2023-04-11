package com.sulake.habbo.game
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.communication.class_25;
   import package_42.class_1024;
   import package_42.class_649;
   import package_42.class_903;
   
   public class IncomingMessages implements class_13
   {
       
      
      private var _gameManager:com.sulake.habbo.game.HabboGameManager;
      
      private var var_311:Boolean = false;
      
      public function IncomingMessages(param1:com.sulake.habbo.game.HabboGameManager)
      {
         super();
         _gameManager = param1;
         var _loc2_:class_25 = _gameManager.communication;
         _loc2_.addHabboConnectionMessageEvent(new class_1024(onHotelClosed));
         _loc2_.addHabboConnectionMessageEvent(new class_903(onHotelClosed));
         _loc2_.addHabboConnectionMessageEvent(new class_649(onHotelClosed));
      }
      
      public function dispose() : void
      {
         _gameManager = null;
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      private function onHotelClosed(param1:IMessageEvent) : void
      {
         _gameManager.hotelClosed = true;
      }
   }
}
