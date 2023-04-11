package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import package_137.class_1612;
   import package_50.class_1564;
   import package_59.class_349;
   import package_59.class_736;
   
   public class UserInfoCtrl implements class_13, class_3372
   {
      
      private static const secsInMinute:int = 60;
      
      private static const secsInHour:int = 3600;
      
      private static const secsInDay:int = 86400;
      
      private static const secsInYear:int = 31536000;
       
      
      private var _callerFrame:class_3281;
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var var_339:int;
      
      private var var_3425:class_1612;
      
      private var var_45:class_1564;
      
      private var var_2771:class_3151;
      
      private var _openToolsBelow:Boolean;
      
      private var _disposed:Boolean;
      
      private var var_2385:com.sulake.habbo.moderation.IssueHandler;
      
      public function UserInfoCtrl(param1:class_3281, param2:com.sulake.habbo.moderation.ModerationManager, param3:class_1612, param4:com.sulake.habbo.moderation.IssueHandler = null, param5:Boolean = false)
      {
         super();
         _callerFrame = param1;
         _main = param2;
         var_3425 = param3;
         _openToolsBelow = param5;
         var_2385 = param4;
      }
      
      public static function formatTime(param1:int) : String
      {
         if(param1 < 120)
         {
            return param1 + " secs ago";
         }
         if(param1 < 7200)
         {
            return Math.round(param1 / 60) + " mins ago";
         }
         if(param1 < 172800)
         {
            return Math.round(param1 / 3600) + " hours ago";
         }
         if(param1 < 63072000)
         {
            return Math.round(param1 / 86400) + " days ago";
         }
         return Math.round(param1 / 31536000) + " years ago";
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function load(param1:class_3151, param2:int) : void
      {
         var_2771 = param1;
         var_339 = param2;
         var_45 = null;
         refresh();
         _main.messageHandler.addUserInfoListener(this);
         _main.connection.send(new class_349(param2));
      }
      
      public function onUserInfo(param1:class_1564) : void
      {
         if(param1.userId != var_339)
         {
            return;
         }
         var_45 = param1;
         refresh();
      }
      
      public function refresh() : void
      {
         if(false)
         {
            return;
         }
         var _loc1_:class_3151 = prepare();
         if(var_45 == null)
         {
            _loc1_.findChildByName("fields").visible = false;
            _loc1_.findChildByName("loading_txt").visible = true;
            return;
         }
         _loc1_.findChildByName("fields").visible = true;
         _loc1_.findChildByName("loading_txt").visible = false;
         setTxt(_loc1_,"name_txt",var_45.userName);
         setTxt(_loc1_,"registered_txt",formatTime(0));
         setTxt(_loc1_,"cfh_count_txt","undefined");
         setAlertTxt(_loc1_,"abusive_cfh_count_txt",var_45.abusiveCfhCount);
         setAlertTxt(_loc1_,"caution_count_txt",var_45.cautionCount);
         setAlertTxt(_loc1_,"ban_count_txt",var_45.banCount);
         setAlertTxt(_loc1_,"trading_lock_count_txt",var_45.tradingLockCount);
         setTxt(_loc1_,"trading_lock_expiry_txt",var_45.tradingExpiryDate,"No active lock");
         setTxt(_loc1_,"last_login_txt",formatTime(0));
         setTxt(_loc1_,"online_txt",var_45.online ? "Yes" : "No");
         setTxt(_loc1_,"last_purchase_txt",var_45.lastPurchaseDate,"No purchases");
         setTxt(_loc1_,"email_address_txt",var_45.primaryEmailAddress,"No email found");
         setTxt(_loc1_,"id_bans_txt","undefined");
         setTxt(_loc1_,"user_class_txt",var_45.userClassification,"-");
         setTxt(_loc1_,"last_sanction_time_txt",var_45.lastSanctionTime);
         if(true)
         {
            (_loc1_.findChildByName("last_sanction_time_txt") as ITextWindow).textColor = 16711680;
         }
         if(false)
         {
            _loc1_.findChildByName("modaction_but").disable();
         }
         class_14.log("USER: undefined, undefined, undefined");
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         _main.messageHandler.removeUserInfoListener(this);
         _callerFrame = null;
         _main = null;
         var_45 = null;
         var_2771 = null;
      }
      
      private function prepare() : class_3151
      {
         var _loc1_:class_3151 = class_3151(var_2771.findChildByName("user_info"));
         if(_loc1_ == null)
         {
            _loc1_ = class_3151(_main.getXmlWindow("user_info"));
            var_2771.addChild(_loc1_);
         }
         _loc1_.findChildByName("chatlog_but").procedure = onChatlogButton;
         _loc1_.findChildByName("roomvisits_but").procedure = onRoomVisitsButton;
         _loc1_.findChildByName("habboinfotool_but").procedure = onHabboInfoToolButton;
         _loc1_.findChildByName("message_but").procedure = onMessageButton;
         _loc1_.findChildByName("modaction_but").procedure = onModActionButton;
         _loc1_.findChildByName("view_caution_count_txt").procedure = onViewCautions;
         _loc1_.findChildByName("view_ban_count_txt").procedure = onViewBans;
         _loc1_.findChildByName("view_trading_lock_count_txt").procedure = onViewTradingLocks;
         _loc1_.findChildByName("view_id_bans_txt").procedure = onViewIDBans;
         return _loc1_;
      }
      
      private function setAlertTxt(param1:class_3151, param2:String, param3:int) : void
      {
         var _loc5_:class_3127 = param1.findChildByName(param2);
         var _loc4_:class_3127;
         if((_loc4_ = param1.findChildByName("view_" + param2)) != null)
         {
            _loc4_.visible = param3 > 0;
         }
         _loc5_.caption = "" + param3;
      }
      
      private function setTxt(param1:class_3151, param2:String, param3:String, param4:String = "") : void
      {
         var _loc5_:class_3127 = ITextWindow(param1.findChildByName(param2));
         if(!param3 || param3.length == 0)
         {
            _loc5_.caption = param4;
         }
         else
         {
            _loc5_.caption = param3;
         }
      }
      
      private function onChatlogButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         trackAction("chatLog");
         _main.windowTracker.show(new ChatlogCtrl(new class_736(var_45.userId),_main,5,var_45.userId),_callerFrame,_openToolsBelow,false,true);
      }
      
      private function onRoomVisitsButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _main.windowTracker.show(new RoomVisitsCtrl(_main,var_45.userId),_callerFrame,_openToolsBelow,false,true);
      }
      
      private function onHabboInfoToolButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         trackAction("openInfoTool");
         _main.openHkPage("habboinfotool.url",var_45.userName);
      }
      
      private function onMessageButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         trackAction("openSendMessage");
         _main.windowTracker.show(new SendMsgsCtrl(_main,var_45.userId,var_45.userName,var_3425),_callerFrame,_openToolsBelow,false,true);
      }
      
      private function onModActionButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         trackAction("openModAction");
         _main.windowTracker.show(new ModActionCtrl(_main,var_45.userId,var_45.userName,var_3425,this),_callerFrame,_openToolsBelow,false,true);
      }
      
      private function onViewCautions(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         trackAction("viewCautions");
         showModeratorLog();
      }
      
      private function onViewBans(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         trackAction("viewBans");
         showModeratorLog();
      }
      
      private function onViewTradingLocks(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         trackAction("viewTradingLocks");
         showModeratorLog();
      }
      
      private function onViewIDBans(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         trackAction("viewIdentityInfo");
         showIdentityInformation();
      }
      
      private function showModeratorLog() : void
      {
         _main.openHkPage("moderatoractionlog.url",var_45.userName);
      }
      
      private function showIdentityInformation() : void
      {
         _main.openHkPage("identityinformationtool.url","undefined");
      }
      
      internal function logEvent(param1:String, param2:String) : void
      {
         if(_main != null)
         {
            _main.logEvent(param1,param2);
         }
      }
      
      internal function trackAction(param1:String) : void
      {
         if(var_2385 == null || false)
         {
            _main.trackGoogle("userInfo_" + param1);
         }
         else if(false)
         {
            var_2385.trackAction("callerUserInfo_" + param1);
         }
         else if(false)
         {
            var_2385.trackAction("reportedUserInfo_" + param1);
         }
         else
         {
            var_2385.trackAction("userInfo_" + param1);
         }
      }
   }
}
