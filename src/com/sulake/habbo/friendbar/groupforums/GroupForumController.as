package com.sulake.habbo.friendbar.groupforums
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.notifications.class_2082;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_155.class_1201;
   import package_155.class_1348;
   import package_155.class_1390;
   import package_155.class_1391;
   import package_155.class_1417;
   import package_155.class_1464;
   import package_155.class_1523;
   import package_155.class_1560;
   import package_155.class_1629;
   import package_155.class_1641;
   import package_155.class_1642;
   import package_20.class_152;
   import package_20.class_168;
   import package_20.class_451;
   import package_20.class_514;
   import package_20.class_540;
   import package_20.class_582;
   import package_20.class_615;
   import package_20.class_684;
   import package_20.class_862;
   import package_20.class_941;
   import package_20.class_952;
   import package_20.class_973;
   import package_7.class_313;
   import package_72.class_275;
   import package_72.class_291;
   import package_72.class_324;
   import package_72.class_329;
   import package_72.class_472;
   import package_72.class_544;
   import package_72.class_592;
   import package_72.class_738;
   import package_72.class_928;
   
   public class GroupForumController extends class_20 implements class_3272, ILinkEventTracker
   {
      
      public static const FORUMS_LIST_CODE_ACTIVE:int = 0;
      
      public static const FORUMS_LIST_CODE_POPULAR:int = 1;
      
      public static const FORUMS_LIST_CODE_MY_FORUMS:int = 2;
      
      public static const NO_ID:int = -1;
       
      
      private var _configurationManager:class_19;
      
      private var _communicationManager:class_25;
      
      private var _windowManager:class_1684;
      
      private var _localizationManager:class_18;
      
      private var _help:IHabboHelp;
      
      private var _notifications:class_2082;
      
      private var _soundManager:class_2089;
      
      private var _habboTracking:class_1693;
      
      private var var_1534:com.sulake.habbo.friendbar.groupforums.GroupForumView;
      
      private var var_2649:com.sulake.habbo.friendbar.groupforums.ComposeMessageView;
      
      private var var_3934:com.sulake.habbo.friendbar.groupforums.ForumSettingsView;
      
      private var var_2839:int = -1;
      
      private var var_2364:int = -1;
      
      private var var_506:class_1642;
      
      private var var_2750:int;
      
      private var var_1762:int = 0;
      
      private var var_1663:com.sulake.habbo.friendbar.groupforums.ForumsListData;
      
      private var var_1943:com.sulake.habbo.friendbar.groupforums.ThreadsListData;
      
      private var var_2353:com.sulake.habbo.friendbar.groupforums.MessagesListData;
      
      private var _lastReadMessageIndexByThread:Dictionary;
      
      private var var_3190:int = -1;
      
      private var var_3218:int;
      
      private var _lastPostTime:int = -30000;
      
      private var var_758:int = 0;
      
      private var var_2552:Timer;
      
      public function GroupForumController(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         _lastReadMessageIndexByThread = new Dictionary();
         super(param1,param2,param3);
      }
      
      public function get composeMessageView() : com.sulake.habbo.friendbar.groupforums.ComposeMessageView
      {
         return var_2649;
      }
      
      public function set composeMessageView(param1:com.sulake.habbo.friendbar.groupforums.ComposeMessageView) : void
      {
         var_2649 = param1;
      }
      
      public function get forumSettingsView() : com.sulake.habbo.friendbar.groupforums.ForumSettingsView
      {
         return var_3934;
      }
      
      public function set forumSettingsView(param1:com.sulake.habbo.friendbar.groupforums.ForumSettingsView) : void
      {
         var_3934 = param1;
      }
      
      public function get notifications() : class_2082
      {
         return _notifications;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get localizationManager() : class_18
      {
         return _localizationManager;
      }
      
      public function get lastPostTime() : int
      {
         return _lastPostTime;
      }
      
      public function get unreadForumsCount() : int
      {
         return var_758;
      }
      
      public function get tracking() : class_1693
      {
         return _habboTracking;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(),function(param1:class_19):void
         {
            _configurationManager = param1;
         }),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localizationManager = param1;
         }),new ComponentDependency(new IIDHabboHelp(),function(param1:IHabboHelp):void
         {
            _help = param1;
         }),new ComponentDependency(new IIDHabboNotifications(),function(param1:class_2082):void
         {
            _notifications = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboSoundManager(),function(param1:class_2089):void
         {
            _soundManager = param1;
         }),new ComponentDependency(new IIDHabboTracking(),function(param1:class_1693):void
         {
            _habboTracking = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),null)]);
      }
      
      override protected function initComponent() : void
      {
         _communicationManager.addHabboConnectionMessageEvent(new class_329(onForumsList));
         _communicationManager.addHabboConnectionMessageEvent(new class_472(onForumData));
         _communicationManager.addHabboConnectionMessageEvent(new class_544(onThreadList));
         _communicationManager.addHabboConnectionMessageEvent(new class_275(onThreadMessageList));
         _communicationManager.addHabboConnectionMessageEvent(new class_324(onUpdateMessage));
         _communicationManager.addHabboConnectionMessageEvent(new class_592(onUnreadForumsCountMessage));
         _communicationManager.addHabboConnectionMessageEvent(new class_928(onPostMessageMessage));
         _communicationManager.addHabboConnectionMessageEvent(new class_291(onUpdateThread));
         _communicationManager.addHabboConnectionMessageEvent(new class_738(onPostThreadMessage));
         context.addLinkEventTracker(this);
         startPollingForUnreadForumsCount();
      }
      
      override public function dispose() : void
      {
         if(var_2552 != null)
         {
            var_2552.stop();
            var_2552 = null;
         }
         super.dispose();
      }
      
      private function startPollingForUnreadForumsCount() : void
      {
         var _loc1_:int = int(_configurationManager.getInteger("groupforum.poll.period",300));
         var_2552 = new Timer(_loc1_ * 1000,0);
         var_2552.addEventListener("timer",onUnreadForumsCountUpdateTimerEvent);
         var_2552.start();
         onUnreadForumsCountUpdateTimerEvent(null);
      }
      
      public function openGroupForum(param1:int) : void
      {
         if(!_communicationManager)
         {
            return;
         }
         initForum(param1);
         requestThreadList(param1,0);
      }
      
      public function get linkPattern() : String
      {
         return "groupforum/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         if(!_communicationManager)
         {
            return;
         }
         var _loc3_:Array = param1.split("/");
         if(_loc3_.length < 2)
         {
            return;
         }
         if(_loc3_[1] == "list")
         {
            if(_loc3_.length == 3)
            {
               switch(_loc3_[2])
               {
                  case "active":
                     _loc5_ = 0;
                     break;
                  case "popular":
                     _loc5_ = 1;
                     break;
                  case "my":
                     _loc5_ = 2;
                     break;
                  default:
                     return;
               }
               openForumsList(_loc5_);
            }
         }
         else
         {
            if((_loc6_ = int(_loc3_[1])) == 0)
            {
               return;
            }
            var_1663 = null;
            if(_loc3_.length == 2)
            {
               openGroupForum(_loc6_);
            }
            else
            {
               _loc2_ = int(_loc3_[2]);
               _loc4_ = 0;
               if(_loc3_.length > 3)
               {
                  _loc4_ = int(_loc3_[3]);
               }
               initForum(_loc6_);
               _communicationManager.connection.send(new class_862(_loc6_,_loc2_));
               goToMessageIndex(_loc6_,_loc2_,_loc4_);
            }
         }
      }
      
      public function openForumsList(param1:int, param2:int = 0) : void
      {
         markForumAsRead();
         var_2839 = param1;
         var_2364 = -1;
         _communicationManager.connection.send(new class_514(param1,param2,20));
      }
      
      private function onForumsList(param1:class_329) : void
      {
         var _loc3_:class_1464 = param1.getParser();
         var _loc2_:com.sulake.habbo.friendbar.groupforums.ForumsListData = new com.sulake.habbo.friendbar.groupforums.ForumsListData(_loc3_);
         if(var_506 != null && var_1762 > 0)
         {
            _loc2_.updateUnreadMessages(var_506,var_1762);
         }
         if(_loc2_.listCode == 2)
         {
            updateUnreadForumsCount(_loc2_.unreadForumsCount);
         }
         if(var_2839 != _loc2_.listCode)
         {
            return;
         }
         var_1663 = _loc2_;
         if(!var_1534)
         {
            var_1534 = new com.sulake.habbo.friendbar.groupforums.GroupForumView(this);
         }
         var_1534.openForumsList(var_1663);
      }
      
      private function initForum(param1:int) : void
      {
         markForumAsRead();
         var_2839 = -1;
         var_2364 = param1;
         var_1762 = 0;
         _communicationManager.connection.send(new class_941(param1));
      }
      
      private function onForumData(param1:class_472) : void
      {
         var _loc2_:class_24 = null;
         var _loc3_:String = null;
         var _loc4_:class_1642 = param1.getParser().forumData;
         if(var_2364 != _loc4_.groupId)
         {
            return;
         }
         if(!_loc4_.canRead)
         {
            if(var_1534 != null)
            {
               var_1534.dispose();
            }
            var_506 = null;
            var_2364 = 0;
            _loc2_ = new class_24();
            _loc3_ = String(localizationManager.getLocalization("groupforum.view.error.operation_read"));
            _loc2_.add("message",localizationManager.getLocalizationWithParams("groupforum.view.error." + _loc4_.readPermissionError,"","operation",_loc3_));
            notifications.showNotification("forums.error.access_denied",_loc2_);
            return;
         }
         var_506 = _loc4_;
         var_1762 = _loc4_.lastReadMessageId;
      }
      
      public function requestThreadList(param1:int, param2:int) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_152(param1,param2,20));
         }
      }
      
      private function onThreadList(param1:class_544) : void
      {
         var _loc2_:class_1348 = param1.getParser();
         if(var_506 == null || var_506.groupId != _loc2_.groupId)
         {
            return;
         }
         var_1943 = new com.sulake.habbo.friendbar.groupforums.ThreadsListData(var_506.totalThreads,_loc2_.startIndex,_loc2_.threads);
         if(!var_1534)
         {
            var_1534 = new com.sulake.habbo.friendbar.groupforums.GroupForumView(this);
         }
         var_1534.openThreadList(var_1663,var_506,var_1943);
      }
      
      public function requestThreadMessageList(param1:int, param2:int, param3:int) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_952(param1,param2,param3,20));
         }
      }
      
      private function onThreadMessageList(param1:class_275) : void
      {
         var _loc6_:class_1560 = null;
         var _loc3_:class_1417 = param1.getParser();
         if(var_506 == null || var_506.groupId != _loc3_.groupId || var_1943 == null)
         {
            return;
         }
         var_2750 = _loc3_.threadId;
         var _loc2_:class_1629 = var_1943.threadsById[var_2750];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:int = _loc3_.startIndex;
         var _loc5_:int = _loc2_.nMessages;
         var_2353 = new com.sulake.habbo.friendbar.groupforums.MessagesListData(var_2750,_loc5_,_loc4_,_loc3_.messages);
         if(!var_1534)
         {
            var_1534 = new com.sulake.habbo.friendbar.groupforums.GroupForumView(this);
         }
         var_1534.openMessagesList(var_1663,var_506,var_1943,var_2353);
         if(_loc3_.messages.length > 0)
         {
            if(_loc6_ = class_1560(_loc3_.messages[_loc3_.messages.length - 1]))
            {
               updateUnreadMessageCounts(_loc6_.messageId,_loc6_.threadId,_loc6_.messageIndex);
            }
         }
      }
      
      public function updateForumSettings(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_684(param1,param2,param3,param4,param5));
         }
      }
      
      public function postNewThread(param1:int, param2:String, param3:String) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_451(param1,0,param2,param3));
            _lastPostTime = getTimer();
         }
      }
      
      private function onPostThreadMessage(param1:class_738) : void
      {
         var _loc3_:class_1641 = null;
         var _loc2_:class_1390 = class_1390(param1.getParser());
         if(var_2649)
         {
            var_2649.dispose();
         }
         if(var_506 != null && var_506.groupId == _loc2_.groupId)
         {
            updateUnreadMessageCounts(_loc2_.thread.lastMessageId,_loc2_.thread.threadId,_loc2_.thread.nMessages - 1);
         }
         if(var_1663 != null)
         {
            _loc3_ = var_1663.getForumData(_loc2_.groupId);
            if(_loc3_ != null)
            {
               _loc3_.addNewThread(_loc2_.thread);
            }
         }
         if(var_1534 == null)
         {
            return;
         }
         if(var_506 == null || _loc2_.groupId != var_506.groupId)
         {
            return;
         }
         requestThreadList(var_506.groupId,0);
      }
      
      public function postNewMessage(param1:int, param2:int, param3:String) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_451(param1,param2,"",param3));
            _lastPostTime = getTimer();
         }
      }
      
      private function onPostMessageMessage(param1:class_928) : void
      {
         if(var_2649)
         {
            var_2649.dispose();
         }
         if(var_1534 == null)
         {
            return;
         }
         var _loc2_:class_1391 = class_1391(param1.getParser());
         if(var_506 == null || _loc2_.groupId != var_506.groupId || _loc2_.threadId != var_2750)
         {
            return;
         }
         var _loc3_:int = _loc2_.message.messageIndex - _loc2_.message.messageIndex % 20;
         requestThreadMessageList(var_506.groupId,var_2750,_loc3_);
      }
      
      public function deleteThread(param1:class_1642, param2:int) : void
      {
         var _loc3_:int = 0;
         if(_communicationManager)
         {
            if(param1.canModerate)
            {
               _loc3_ = 10;
            }
            if(param1.isStaff)
            {
               _loc3_ = 20;
            }
            _communicationManager.connection.send(new class_973(param1.groupId,param2,_loc3_));
         }
      }
      
      public function unDeleteThread(param1:class_1641, param2:int) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_973(param1.groupId,param2,1));
         }
      }
      
      public function lockThread(param1:class_1641, param2:int, param3:Boolean, param4:Boolean) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_540(param1.groupId,param2,param3,param4));
         }
      }
      
      public function stickThread(param1:class_1641, param2:int, param3:Boolean, param4:Boolean) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_540(param1.groupId,param2,param3,param4));
         }
      }
      
      public function reportThread(param1:class_1641, param2:int) : void
      {
         if(_help)
         {
            _help.reportThread(param1.groupId,param2);
         }
      }
      
      private function onUpdateThread(param1:class_291) : void
      {
         var _loc2_:class_1201 = param1.getParser();
         if(var_506 == null || var_506.groupId != _loc2_.groupId)
         {
            return;
         }
         var _loc3_:class_1629 = _loc2_.thread;
         if(var_1943 && var_1534)
         {
            if(var_1943.updateThread(_loc3_))
            {
               var_1534.updateThread(_loc3_);
               return;
            }
         }
         var_1943 = new com.sulake.habbo.friendbar.groupforums.ThreadsListData(1,0,[_loc3_]);
      }
      
      public function deleteMessage(param1:class_1642, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         if(_communicationManager)
         {
            _loc4_ = 10;
            if(param1.isStaff)
            {
               _loc4_ = 20;
            }
            _communicationManager.connection.send(new class_615(var_506.groupId,param2,param3,_loc4_));
         }
      }
      
      public function unDeleteMessage(param1:class_1641, param2:int, param3:int) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_615(param1.groupId,param2,param3,1));
         }
      }
      
      public function reportMessage(param1:class_1641, param2:int, param3:int) : void
      {
         if(_help)
         {
            _help.reportMessage(param1.groupId,param2,param3);
         }
      }
      
      private function onUpdateMessage(param1:class_324) : void
      {
         var _loc5_:int = 0;
         var _loc6_:class_1560 = null;
         var _loc3_:class_1523 = param1.getParser();
         if(var_506 == null || var_506.groupId != _loc3_.groupId || var_2750 != _loc3_.threadId)
         {
            return;
         }
         var _loc2_:class_1560 = _loc3_.message;
         var _loc4_:Array = var_2353["messages"];
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            if((_loc6_ = _loc4_[_loc5_]).messageId == _loc2_.messageId)
            {
               _loc4_[_loc5_] = _loc2_;
               if(var_1534)
               {
                  var_1534.updateMessage(_loc2_);
               }
               return;
            }
            _loc5_++;
         }
      }
      
      public function goToMessageIndex(param1:int, param2:int, param3:int) : void
      {
         var_3190 = param2;
         var _loc4_:int = Math.floor(param3 / 20);
         var_3218 = param3 % 20;
         requestThreadMessageList(param1,param2,_loc4_ * 20);
      }
      
      public function getUserInfo(param1:int) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(new class_313(param1));
         }
      }
      
      public function closeMainView() : void
      {
         markForumAsRead();
         var_1534 = null;
         var_506 = null;
         var_2839 = -1;
         var_2364 = -1;
      }
      
      public function markForumAsRead(param1:Boolean = false) : void
      {
         var _loc2_:class_582 = null;
         if(_communicationManager && var_506)
         {
            if(param1 || var_1762 > var_506.lastReadMessageId)
            {
               _loc2_ = new class_582();
               if(param1)
               {
                  _loc2_.add(var_506.groupId,Math.max(var_506.totalMessages,var_1762),var_1762 == 0);
               }
               else
               {
                  _loc2_.add(var_506.groupId,var_1762,false);
               }
               _communicationManager.connection.send(_loc2_);
            }
         }
         var_1762 = 0;
         _lastReadMessageIndexByThread = new Dictionary();
      }
      
      public function markForumsAsRead() : void
      {
         var _loc1_:class_582 = null;
         if(_communicationManager && var_1663)
         {
            _loc1_ = new class_582();
            for each(var _loc2_ in var_1663.forums)
            {
               if(_loc2_.unreadMessages > 0)
               {
                  _loc1_.add(_loc2_.groupId,_loc2_.totalMessages,true);
               }
            }
            if(_loc1_.size > 0)
            {
               _communicationManager.connection.send(_loc1_);
               updateUnreadForumsCount(0);
            }
         }
      }
      
      public function getThreadLastReadMessageIndex(param1:int) : int
      {
         var _loc3_:class_1629 = null;
         var _loc2_:* = _lastReadMessageIndexByThread[param1];
         if(_loc2_ != null)
         {
            return int(_loc2_);
         }
         if(var_1943)
         {
            _loc3_ = var_1943.threadsById[param1];
            if(_loc3_)
            {
               return _loc3_.nMessages - _loc3_.nUnreadMessages - 1;
            }
         }
         return -1;
      }
      
      public function updateUnreadMessageCounts(param1:int, param2:int, param3:int) : void
      {
         if(param1 > var_1762)
         {
            var_1762 = param1;
            if(var_1663)
            {
               var_1663.updateUnreadMessages(var_506,param1);
               if(false)
               {
                  updateUnreadForumsCount(var_1663.unreadForumsCount);
               }
            }
         }
         _lastReadMessageIndexByThread[param2] = param3;
      }
      
      public function getGoToMessageIndex() : int
      {
         return var_3218;
      }
      
      public function getGoToThreadId() : int
      {
         return var_3190;
      }
      
      public function resetGoTo() : void
      {
         var_3190 = -1;
         var_3218 = -1;
      }
      
      public function updateUnreadForumsCount(param1:int) : void
      {
         if(var_758 == param1)
         {
            return;
         }
         if(param1 > var_758)
         {
            if(_soundManager != null)
            {
            }
         }
         var_758 = param1;
         events.dispatchEvent(new UnseenForumsCountUpdatedEvent("UNSEEN_FORUMS_COUNT",param1));
         if(var_1534 != null)
         {
            var_1534.updateUnreadForumsCount(param1);
         }
      }
      
      private function onUnreadForumsCountUpdateTimerEvent(param1:TimerEvent) : void
      {
         if(var_1534 != null)
         {
            _communicationManager.connection.send(new class_514(2,0,20));
         }
         else
         {
            _communicationManager.connection.send(new class_168());
         }
      }
      
      private function onUnreadForumsCountMessage(param1:class_592) : void
      {
         updateUnreadForumsCount(param1.getParser().unreadForumsCount);
      }
   }
}
