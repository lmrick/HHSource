package com.sulake.habbo.moderation
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.userclassification.UserClassificationData;
   import com.sulake.habbo.window.utils.class_3132;
   import flash.utils.Dictionary;
   import package_10.class_606;
   import package_137.*;
   import package_154.class_1256;
   import package_159.class_1128;
   import package_165.class_1148;
   import package_165.class_1168;
   import package_17.class_486;
   import package_36.class_1634;
   import package_36.class_173;
   import package_36.class_659;
   import package_50.*;
   import package_59.class_349;
   import package_86.class_345;
   
   public class ModerationMessageHandler
   {
       
      
      private var _moderationManager:com.sulake.habbo.moderation.ModerationManager;
      
      private var _userInfoListeners:Array;
      
      private var _roomVisitsListeners:Array;
      
      private var var_3296:Array;
      
      private var _chatlogListeners:Array;
      
      private var _roomInfoListeners:Array;
      
      private var _roomEnterListeners:Array;
      
      public function ModerationMessageHandler(param1:com.sulake.habbo.moderation.ModerationManager)
      {
         _userInfoListeners = [];
         _roomVisitsListeners = [];
         var_3296 = [];
         _chatlogListeners = [];
         _roomInfoListeners = [];
         _roomEnterListeners = [];
         super();
         _moderationManager = param1;
         var _loc2_:IConnection = param1.connection;
         _loc2_.addMessageEvent(new class_805(onRoomChatlog));
         _loc2_.addMessageEvent(new class_1003(onModeratorInit));
         _loc2_.addMessageEvent(new class_480(onIssueDeleted));
         _loc2_.addMessageEvent(new class_383(onUserInfo));
         _loc2_.addMessageEvent(new class_606(onRoomExit));
         _loc2_.addMessageEvent(new class_651(onModeratorToolPreferences));
         _loc2_.addMessageEvent(new class_232(onCfhChatlog));
         _loc2_.addMessageEvent(new class_659(onSanctions));
         _loc2_.addMessageEvent(new class_545(onUserChatlog));
         _loc2_.addMessageEvent(new class_486(onRoomEnter));
         _loc2_.addMessageEvent(new class_962(onRoomVisits));
         _loc2_.addMessageEvent(new class_490(onRoomInfo));
         _loc2_.addMessageEvent(new class_455(onIssuePickFailed));
         _loc2_.addMessageEvent(new class_345(onRoomUserClassification));
         _loc2_.addMessageEvent(new class_399(onModeratorActionResult));
         _loc2_.addMessageEvent(new class_173(onCfhTopics));
         _loc2_.addMessageEvent(new class_1018(onIssueInfo));
      }
      
      private function onIssueInfo(param1:class_1018) : void
      {
         if(param1 == null || _moderationManager == null)
         {
            return;
         }
         var _loc2_:class_1515 = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:class_1612 = _loc2_.issueData;
         _moderationManager.issueManager.playSound(_loc3_);
         _moderationManager.issueManager.updateIssue(_loc3_);
      }
      
      private function onModeratorInit(param1:class_1003) : void
      {
         var _loc4_:* = null;
         if(param1 == null || _moderationManager == null)
         {
            return;
         }
         var _loc3_:class_1454 = param1.getParser();
         if(_loc3_ == null || _loc3_.data == null)
         {
            return;
         }
         var _loc2_:class_1649 = _loc3_.data;
         var _loc6_:Array = _loc2_.issues;
         var _loc5_:Array = _loc2_.messageTemplates;
         for each(_loc4_ in _loc6_)
         {
            _moderationManager.issueManager.updateIssue(_loc4_);
         }
         _moderationManager.issueManager.updateIssueBrowser();
         _moderationManager.initMsg = _loc2_;
         _moderationManager.startPanel.show();
      }
      
      private function onModeratorToolPreferences(param1:class_651) : void
      {
         var _loc2_:class_1153 = null;
         if(_moderationManager && false)
         {
            _loc2_ = param1.getParser();
            _moderationManager.issueManager.setToolPreferences(_loc2_.windowX,_loc2_.windowY,_loc2_.windowHeight,_loc2_.windowWidth);
         }
      }
      
      private function onIssuePickFailed(param1:class_455) : void
      {
         var alert:Boolean;
         var issues:Array;
         var retryEnabled:Boolean;
         var retryCount:int;
         var pickedAlready:Boolean;
         var event:class_455 = param1;
         var parser:class_1435 = event.getParser();
         if(parser == null)
         {
            return;
         }
         alert = true;
         issues = parser.issues;
         retryEnabled = false;
         retryCount = 0;
         pickedAlready = _moderationManager.issueManager.issuePickFailed(issues);
         if(pickedAlready)
         {
            if(retryEnabled)
            {
               if(retryCount < 10)
               {
                  alert = false;
                  _moderationManager.issueManager.autoPick("pick failed retry",retryEnabled,retryCount);
               }
            }
         }
         if(alert)
         {
            _moderationManager.windowManager.alert("Error","Issue picking failed",0,function(param1:class_3132, param2:class_3134):void
            {
               param1.dispose();
            });
         }
      }
      
      private function onIssueDeleted(param1:class_480) : void
      {
         if(param1 == null || _moderationManager == null)
         {
            return;
         }
         var _loc2_:class_1204 = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         _moderationManager.issueManager.removeIssue(_loc2_.issueId);
      }
      
      private function onUserInfo(param1:class_383) : void
      {
         var _loc3_:class_1069 = param1.getParser();
         class_14.log("GOT USER INFO: " + _loc3_.data.userId + ", " + _loc3_.data.cautionCount);
         for each(var _loc2_ in _userInfoListeners)
         {
            _loc2_.onUserInfo(_loc3_.data);
         }
      }
      
      private function onRoomInfo(param1:class_490) : void
      {
         var _loc2_:* = null;
         var _loc3_:class_1499 = param1.getParser();
         for each(_loc2_ in _roomInfoListeners)
         {
            _loc2_.onRoomInfo(_loc3_.data);
         }
      }
      
      private function onCfhChatlog(param1:class_232) : void
      {
         var _loc3_:class_1176 = param1.getParser();
         var _loc2_:* = [];
         _loc2_.push(_loc3_.data.chatRecord);
         var _loc4_:Dictionary;
         (_loc4_ = new Dictionary())[_loc3_.data.callerUserId] = 0;
         _loc4_[_loc3_.data.reportedUserId] = 1;
         onChatlog("Call For Help Evidence #" + _loc3_.data.chatRecordId,3,_loc3_.data.callId,_loc2_,_loc4_);
      }
      
      private function onRoomChatlog(param1:class_805) : void
      {
         var _loc3_:class_1505 = param1.getParser();
         var _loc2_:* = [];
         _loc2_.push(_loc3_.data);
         var _loc4_:Dictionary = new Dictionary();
         onChatlog("Room Chatlog: " + _loc3_.data.roomName,4,_loc3_.data.roomId,_loc2_,_loc4_);
      }
      
      private function onUserChatlog(param1:class_545) : void
      {
         var _loc2_:class_1260 = param1.getParser();
         var _loc3_:Dictionary = new Dictionary();
         _loc3_[_loc2_.data.userId] = 0;
         onChatlog("User Chatlog: " + _loc2_.data.userName,5,_loc2_.data.userId,_loc2_.data.rooms,_loc3_);
      }
      
      private function onChatlog(param1:String, param2:int, param3:int, param4:Array, param5:Dictionary) : void
      {
         var _loc6_:Array = _chatlogListeners.concat();
         for each(var _loc7_ in _loc6_)
         {
            _loc7_.onChatlog(param1,param2,param3,param4,param5);
         }
      }
      
      private function onRoomVisits(param1:class_962) : void
      {
         var _loc2_:* = null;
         var _loc4_:class_1205 = param1.getParser();
         var _loc3_:Array = _roomVisitsListeners.concat();
         for each(_loc2_ in _loc3_)
         {
            _loc2_.onRoomVisits(_loc4_.data);
         }
      }
      
      private function onRoomUserClassification(param1:class_345) : void
      {
         var _loc9_:* = null;
         var _loc5_:class_1128;
         var _loc10_:class_24 = (_loc5_ = (param1 as class_345).getParser()).classifiedUsernameMap;
         var _loc3_:class_24 = _loc5_.classifiedUserTypeMap;
         var _loc7_:* = [];
         for each(var _loc8_ in _loc10_.getKeys())
         {
            _loc7_.push(new UserClassificationData(_loc8_,_loc10_[_loc8_],_loc3_[_loc8_]));
         }
         var _loc2_:UserClassificationCtrl = new UserClassificationCtrl(_moderationManager,1);
         _loc2_.show();
         var _loc4_:Array = var_3296.concat();
         for each(_loc9_ in _loc4_)
         {
            _loc9_.onUserClassification(1,_loc7_);
         }
      }
      
      private function onSanctions(param1:class_659) : void
      {
         var _loc2_:class_1148 = param1.getParser();
         class_14.log("Got sanction data..." + [_loc2_.issueId,_loc2_.accountId,_loc2_.sanctionType]);
         _moderationManager.issueManager.updateSanctionData(_loc2_.issueId,_loc2_.accountId,_loc2_.sanctionType);
      }
      
      private function onCfhTopics(param1:class_173) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:class_1168 = param1.getParser();
         _loc2_ = _loc3_.callForHelpCategories;
         _moderationManager.cfhTopics = _loc2_;
      }
      
      private function onRoomEnter(param1:class_486) : void
      {
         var _loc2_:* = null;
         var _loc3_:class_1256 = param1.getParser();
         this._moderationManager.currentFlatId = _loc3_.guestRoomId;
         this._moderationManager.startPanel.guestRoomEntered(_loc3_);
         for each(_loc2_ in _roomEnterListeners)
         {
            _loc2_.onRoomChange();
         }
      }
      
      private function onRoomExit(param1:class_606) : void
      {
         var _loc2_:* = null;
         this._moderationManager.currentFlatId = 0;
         this._moderationManager.startPanel.roomExited();
         for each(_loc2_ in _roomEnterListeners)
         {
            _loc2_.onRoomChange();
         }
      }
      
      private function onModeratorActionResult(param1:class_399) : void
      {
         var _loc2_:class_1247 = param1.getParser();
         class_14.log("GOT MOD ACTION RESULT: " + _loc2_.userId + ", " + _loc2_.success);
         if(_loc2_.success)
         {
            _moderationManager.connection.send(new class_349(_loc2_.userId));
         }
         else
         {
            _moderationManager.windowManager.alert("Alert","Moderation action failed. If you tried to ban a user, please check if the user is already banned.",0,onAlertClose);
         }
      }
      
      public function addUserInfoListener(param1:class_3372) : void
      {
         _userInfoListeners.push(param1);
      }
      
      public function removeUserInfoListener(param1:class_3372) : void
      {
         var _loc3_:* = [];
         for each(var _loc2_ in _userInfoListeners)
         {
            if(_loc2_ != param1)
            {
               _loc3_.push(_loc2_);
            }
         }
         _userInfoListeners = _loc3_;
      }
      
      public function addRoomInfoListener(param1:RoomToolCtrl) : void
      {
         _roomInfoListeners.push(param1);
      }
      
      public function removeRoomInfoListener(param1:RoomToolCtrl) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = [];
         for each(_loc2_ in _roomInfoListeners)
         {
            if(_loc2_ != param1)
            {
               _loc3_.push(_loc2_);
            }
         }
         _roomInfoListeners = _loc3_;
      }
      
      public function addRoomEnterListener(param1:RoomToolCtrl) : void
      {
         _roomEnterListeners.push(param1);
      }
      
      public function removeRoomEnterListener(param1:RoomToolCtrl) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = [];
         for each(_loc2_ in _roomEnterListeners)
         {
            if(_loc2_ != param1)
            {
               _loc3_.push(_loc2_);
            }
         }
         _roomEnterListeners = _loc3_;
      }
      
      public function addRoomVisitsListener(param1:RoomVisitsCtrl) : void
      {
         _roomVisitsListeners.push(param1);
      }
      
      public function removeRoomVisitsListener(param1:RoomVisitsCtrl) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = [];
         for each(_loc2_ in _roomVisitsListeners)
         {
            if(_loc2_ != param1)
            {
               _loc3_.push(_loc2_);
            }
         }
         _roomVisitsListeners = _loc3_;
      }
      
      public function addChatlogListener(param1:class_3350) : void
      {
         _chatlogListeners.push(param1);
      }
      
      public function removeChatlogListener(param1:class_3350) : void
      {
         var _loc3_:* = [];
         for each(var _loc2_ in _chatlogListeners)
         {
            if(_loc2_ != param1)
            {
               _loc3_.push(_loc2_);
            }
         }
         _chatlogListeners = _loc3_;
      }
      
      public function addUserClassificationListener(param1:UserClassificationCtrl) : void
      {
         var_3296.push(param1);
      }
      
      public function removeUserClassificationListener(param1:UserClassificationCtrl) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = [];
         for each(_loc2_ in var_3296)
         {
            if(_loc2_ != param1)
            {
               _loc3_.push(_loc2_);
            }
         }
         _roomVisitsListeners = _loc3_;
      }
      
      private function onAlertClose(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
   }
}
