package com.sulake.habbo.session
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import package_10.class_847;
   import package_5.class_579;
   import package_7.class_546;
   
   public class HabboGroupInfoManager implements class_13
   {
       
      
      private var _sessionDataManager:com.sulake.habbo.session.SessionDataManager;
      
      private var var_110:class_24;
      
      private var var_4132:IMessageEvent;
      
      private var var_2559:IMessageEvent;
      
      public function HabboGroupInfoManager(param1:com.sulake.habbo.session.SessionDataManager)
      {
         super();
         _sessionDataManager = param1;
         var_110 = new class_24();
         if(false)
         {
            var_4132 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new class_847(onRoomReady));
            var_2559 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new class_579(onHabboGroupBadges));
         }
      }
      
      public function get disposed() : Boolean
      {
         return _sessionDataManager == null;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(false)
         {
            _sessionDataManager.communication.removeHabboConnectionMessageEvent(var_4132);
            _sessionDataManager.communication.removeHabboConnectionMessageEvent(var_2559);
         }
         var_110 = null;
         _sessionDataManager = null;
      }
      
      private function onRoomReady(param1:IMessageEvent) : void
      {
         _sessionDataManager.send(new class_546());
      }
      
      private function onHabboGroupBadges(param1:class_579) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:class_24 = param1.badges;
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc2_.getKey(_loc4_);
            var_110.remove(_loc3_);
            var_110.add(_loc3_,_loc2_.getWithIndex(_loc4_));
            _loc4_++;
         }
      }
      
      public function getBadgeId(param1:int) : String
      {
         return var_110.getValue(param1);
      }
   }
}
