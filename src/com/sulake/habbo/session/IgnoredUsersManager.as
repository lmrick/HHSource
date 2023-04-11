package com.sulake.habbo.session
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import package_5.class_518;
   import package_5.class_634;
   import package_7.class_332;
   import package_7.class_342;
   import package_7.class_676;
   import package_7.class_795;
   
   public class IgnoredUsersManager implements class_13
   {
       
      
      private var _sessionDataManager:com.sulake.habbo.session.SessionDataManager;
      
      private var var_3206:IMessageEvent;
      
      private var var_3395:IMessageEvent;
      
      private var _ignoredUsers:Array;
      
      public function IgnoredUsersManager(param1:com.sulake.habbo.session.SessionDataManager)
      {
         _ignoredUsers = [];
         super();
         _sessionDataManager = param1;
         if(false)
         {
            var_3206 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new class_518(onIgnoreResult));
            var_3395 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new class_634(onIgnoreList));
         }
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(false)
         {
            _sessionDataManager.communication.removeHabboConnectionMessageEvent(var_3206);
            _sessionDataManager.communication.removeHabboConnectionMessageEvent(var_3395);
         }
         var_3206 = null;
         var_3395 = null;
         _sessionDataManager = null;
      }
      
      public function initIgnoreList() : void
      {
         _sessionDataManager.send(new class_676(_sessionDataManager.userName));
      }
      
      private function onIgnoreList(param1:class_634) : void
      {
         _ignoredUsers = param1.ignoredUsers;
      }
      
      private function onIgnoreResult(param1:class_518) : void
      {
         var _loc2_:String = param1.name;
         switch(param1.result)
         {
            case 0:
               break;
            case 1:
               addUserToIgnoreList(_loc2_);
               break;
            case 2:
               addUserToIgnoreList(_loc2_);
               _ignoredUsers.shift();
               break;
            case 3:
               removeUserFromIgnoreList(_loc2_);
         }
      }
      
      private function addUserToIgnoreList(param1:String) : void
      {
         if(_ignoredUsers.indexOf(param1) < 0)
         {
            _ignoredUsers.push(param1);
         }
      }
      
      private function removeUserFromIgnoreList(param1:String) : void
      {
         var _loc2_:int = _ignoredUsers.indexOf(param1);
         if(_loc2_ >= 0)
         {
            _ignoredUsers.splice(_loc2_,1);
         }
      }
      
      public function ignoreUserId(param1:int) : void
      {
         _sessionDataManager.send(new class_795(param1));
      }
      
      public function ignoreUser(param1:String) : void
      {
         _sessionDataManager.send(new class_342(param1));
      }
      
      public function unignoreUser(param1:String) : void
      {
         _sessionDataManager.send(new class_332(param1));
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return _ignoredUsers.indexOf(param1) >= 0;
      }
      
      public function get disposed() : Boolean
      {
         return _sessionDataManager == null;
      }
   }
}
