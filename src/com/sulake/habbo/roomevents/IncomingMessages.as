package com.sulake.habbo.roomevents
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.communication.class_25;
   import package_10.class_606;
   import package_133.class_1188;
   import package_143.class_1078;
   import package_143.class_1080;
   import package_143.class_1123;
   import package_143.class_1229;
   import package_143.class_1319;
   import package_143.class_1497;
   import package_143.class_1524;
   import package_154.class_1200;
   import package_17.class_194;
   import package_5.class_564;
   import package_57.class_786;
   import package_6.class_530;
   import package_79.class_319;
   import package_79.class_351;
   import package_79.class_459;
   import package_79.class_556;
   import package_79.class_702;
   import package_79.class_739;
   import package_79.class_971;
   import package_79.class_978;


   public class IncomingMessages implements class_13
   {
       
      
      private var _roomEvents:com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      public function IncomingMessages(param1:com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents)
      {
         super();
         _roomEvents = param1;
         _messageEvents = new Vector.<IMessageEvent>(0);
         var _loc2_:class_25 = _roomEvents.communication;
         addMessageEvent(new class_194(onObjectRemove));
         addMessageEvent(new class_702(onAddon));
         addMessageEvent(new class_564(onGuildMemberships));
         addMessageEvent(new class_459(onRewardFailed));
         addMessageEvent(new class_319(onOpen));
         addMessageEvent(new class_606(onRoomExit));
         addMessageEvent(new class_530(onUserObject));
         addMessageEvent(new class_978(onSaveSuccess));
         addMessageEvent(new class_556(onAction));
         addMessageEvent(new class_351(onTrigger));
         addMessageEvent(new class_739(onValidationError));
         addMessageEvent(new class_971(onCondition));
      }
      
      private function addMessageEvent(param1:IMessageEvent) : void
      {
         _messageEvents.push(_roomEvents.communication.addHabboConnectionMessageEvent(param1));
      }
      
      private function onOpen(param1:IMessageEvent) : void
      {
         var _loc2_:class_1080 = (param1 as class_319).getParser();
         _roomEvents.send(new class_786(_loc2_.stuffId));
      }
      
      private function onTrigger(param1:IMessageEvent) : void
      {
         var _loc2_:class_1497 = (param1 as class_351).getParser();
         _roomEvents.userDefinedRoomEventsCtrl.prepareForUpdate(_loc2_.def);
      }
      
      private function onAction(param1:IMessageEvent) : void
      {
         var _loc2_:class_1078 = (param1 as class_556).getParser();
         _roomEvents.userDefinedRoomEventsCtrl.prepareForUpdate(_loc2_.def);
      }
      
      private function onCondition(param1:IMessageEvent) : void
      {
         var _loc2_:class_1229 = (param1 as class_971).getParser();
         _roomEvents.userDefinedRoomEventsCtrl.prepareForUpdate(_loc2_.def);
      }
      
      private function onAddon(param1:IMessageEvent) : void
      {
         var _loc2_:class_1123 = (param1 as class_702).getParser();
         _roomEvents.userDefinedRoomEventsCtrl.prepareForUpdate(_loc2_.def);
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:class_1188 = (param1 as class_530).getParser();
         _roomEvents.userName = _loc2_.name;
      }
      
      private function onRoomExit(param1:IMessageEvent) : void
      {
         _roomEvents.userDefinedRoomEventsCtrl.close();
      }
      
      private function onObjectRemove(param1:IMessageEvent) : void
      {
         var _loc2_:class_1200 = (param1 as class_194).getParser();
         class_14.log("Received object remove event: " + _loc2_.id + ", " + _loc2_.isExpired);
         _roomEvents.userDefinedRoomEventsCtrl.stuffRemoved(_loc2_.id);
      }
      
      private function onRewardFailed(param1:IMessageEvent) : void
      {
         var _loc2_:class_1319 = class_459(param1).getParser();
         if(_loc2_.reason == 6)
         {
            _roomEvents.windowManager.alert(_roomEvents.localization.getLocalization("wiredfurni.rewardsuccess.title"),_roomEvents.localization.getLocalization("wiredfurni.rewardsuccess.body"),0,null);
         }
         else if(_loc2_.reason == 7)
         {
            _roomEvents.windowManager.alert(_roomEvents.localization.getLocalization("wiredfurni.badgereceived.title"),_roomEvents.localization.getLocalization("wiredfurni.badgereceived.body"),0,null);
         }
         else
         {
            _roomEvents.windowManager.alert(_roomEvents.localization.getLocalization("wiredfurni.rewardfailed.title"),_roomEvents.localization.getLocalization("wiredfurni.rewardfailed.reason." + _loc2_.reason),0,null);
         }
      }
      
      private function onValidationError(param1:IMessageEvent) : void
      {
         var _loc2_:class_1524 = class_739(param1).getParser();
         _roomEvents.windowManager.alert("Update failed",_loc2_.info,0,null);
      }
      
      private function onSaveSuccess(param1:IMessageEvent) : void
      {
         _roomEvents.userDefinedRoomEventsCtrl.close();
      }
      
      private function onGuildMemberships(param1:class_564) : void
      {
         _roomEvents.userDefinedRoomEventsCtrl.onGuildMemberships(param1);
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         var _loc2_:class_25 = _roomEvents.communication;
         if(_messageEvents != null && _loc2_ != null)
         {
            for each(var _loc1_ in _messageEvents)
            {
               _loc2_.removeHabboConnectionMessageEvent(_loc1_);
            }
         }
         _roomEvents = null;
      }
      
      public function get disposed() : Boolean
      {
         return _roomEvents == null;
      }
   }
}
