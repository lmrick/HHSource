package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.room.object.IRoomObject;
   
   public class AvatarMenuView extends AvatarContextInfoButtonView
   {
      
      protected static const MODE_ACTIONS:uint = 1;
      
      protected static const MODE_MODERATE:uint = 2;
      
      protected static const MODE_BAN:uint = 4;
      
      protected static const MODE_MUTE:uint = 5;
      
      protected static const MODE_RELATIONSHIP:uint = 6;
      
      protected static const MODE_AMBASSADOR:uint = 7;
      
      protected static var lastViewMode:uint = 1;
       
      
      protected var var_45:com.sulake.habbo.ui.widget.avatarinfo.class_3380;
      
      protected var var_773:uint = 1;
      
      protected var var_1805:Boolean;
      
      public function AvatarMenuView(param1:AvatarInfoWidget)
      {
         super(param1);
         var_1566 = false;
      }
      
      public static function setup(param1:AvatarMenuView, param2:int, param3:String, param4:int, param5:int, param6:com.sulake.habbo.ui.widget.avatarinfo.class_3380) : void
      {
         param1.var_45 = param6;
         AvatarContextInfoButtonView.setup(param1,param2,param3,param4,param5,false);
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            _window.removeEventListener("WME_OVER",onMouseHoverEvent);
            _window.removeEventListener("WME_OUT",onMouseHoverEvent);
         }
         var_45 = null;
         super.dispose();
      }
      
      protected function updateButtons() : void
      {
         var _loc7_:int = 0;
         var _loc1_:AvatarInfoWidgetHandler = null;
         var _loc8_:Boolean = false;
         var _loc4_:String = null;
         var _loc2_:int = 0;
         var _loc9_:IRoomObject = null;
         var _loc5_:int = 0;
         if(!_window || !var_45)
         {
            return;
         }
         var _loc3_:IItemListWindow = _window.findChildByName("buttons") as IItemListWindow;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.procedure = buttonEventProc;
         _loc3_.autoArrangeItems = false;
         var _loc6_:int = _loc3_.numListItems;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_.getListItemAt(_loc7_).visible = false;
            _loc7_++;
         }
         if(var_773 == 1)
         {
            showButton("moderate",moderateMenuHasContent());
            showButton("friend",var_45.canBeAskedAsFriend);
            showButton("ignore",true);
            showButton("unignore",var_45.isIgnored);
            showButton("report",false && widget.configuration.getBoolean("infostand.report.show"));
            showButton("stargem",true,true,false,true);
            _loc1_ = widget.handler;
            _loc8_ = _loc1_.container.sessionDataManager.isAccountSafetyLocked();
            showButton("trade",citizenshipTalentTrackEnabled || !_loc8_ && false);
            switch(-2)
            {
               case 0:
                  _loc4_ = "${infostand.button.trade.tooltip.shutdown}";
                  break;
               case 1:
                  _loc4_ = "${infostand.button.trade.tooltip.tradingroom}";
                  break;
               default:
                  _loc4_ = "";
            }
            IInteractiveWindow(class_3151(_loc3_.getListItemByName("trade")).getChildByName("button")).toolTipCaption = _loc4_;
            showButton("whisper");
            if(widget.configuration.getBoolean("handitem.give.enabled"))
            {
               _loc2_ = _loc1_.container.roomSession.ownUserRoomId;
               if((_loc9_ = _loc1_.container.roomEngine.getRoomObject(_loc1_.roomSession.roomId,_loc2_,100)) != null)
               {
                  if((_loc5_ = int(_loc9_.getModel().getNumber("figure_carry_object"))) > 0 && _loc5_ < 999999)
                  {
                     showButton("pass_handitem");
                  }
               }
            }
            showButton("relationship",widget.configuration.getBoolean("relationship.status.enabled") && false);
            showButton("ambassador",ambassadorMenuHasContent());
         }
         if(var_773 == 2)
         {
            showButton("kick",var_45.canBeKicked);
            showButton("ban_with_duration",var_45.canBeBanned);
            showButton("mute",var_45.canBeMuted);
            showButton("give_rights",isShowGiveRights());
            showButton("remove_rights",isShowRemoveRights());
            showButton("actions");
         }
         if(var_773 == 4)
         {
            showButton("ban_hour");
            showButton("ban_day");
            showButton("perm_ban");
            showButton("actions");
         }
         if(var_773 == 5)
         {
            showButton("mute_2min");
            showButton("mute_5min");
            showButton("mute_10min");
            showButton("actions");
         }
         if(var_773 == 6)
         {
            showButtonGrid("relationship_grid");
            showButton("no_relationship");
            showButton("actions");
         }
         if(var_773 == 7)
         {
            showButton("ambassador_kick");
            showButton("ambassador_alert");
            showButton("ambassador_mute_15min");
            showButton("ambassador_mute_60min");
            showButton("ambassador_mute_18hour");
            showButton("ambassador_mute_36hour");
            showButton("ambassador_mute_72hour");
            showButton("ambassador_unmute");
            showButton("actions");
         }
         _loc3_.autoArrangeItems = true;
         _loc3_.visible = true;
         lastViewMode = var_773;
         var_1805 = false;
      }
      
      private function ambassadorMenuHasContent() : Boolean
      {
         return var_45.isAmbassador;
      }
      
      private function moderateMenuHasContent() : Boolean
      {
         return false || false || false || isShowGiveRights() || isShowRemoveRights();
      }
      
      private function isShowGiveRights() : Boolean
      {
         return false && true;
      }
      
      private function isShowRemoveRights() : Boolean
      {
         return false && false;
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:XML = null;
         var _loc4_:IItemGridWindow = null;
         var _loc3_:IIterator = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:class_3151 = null;
         var _loc2_:class_3151 = null;
         if(!var_1429 || true || true)
         {
            return;
         }
         if(var_1726)
         {
            activeView = getMinimizedView();
         }
         else
         {
            if(!_window)
            {
               _loc1_ = XmlAsset(var_1429.assets.getAssetByName("avatar_menu_widget")).content as XML;
               _window = var_1429.windowManager.buildFromXML(_loc1_,0) as class_3151;
               if(!_window)
               {
                  return;
               }
               _window.addEventListener("WME_OVER",onMouseHoverEvent);
               _window.addEventListener("WME_OUT",onMouseHoverEvent);
               _window.findChildByName("minimize").addEventListener("WME_CLICK",onMinimize);
               _window.findChildByName("minimize").addEventListener("WME_OVER",onMinimizeHover);
               _window.findChildByName("minimize").addEventListener("WME_OUT",onMinimizeHover);
            }
            _buttons = _window.findChildByName("buttons") as IItemListWindow;
            _buttons.procedure = buttonEventProc;
            _window.findChildByName("profile_link").procedure = buttonEventProc;
            _window.findChildByName("name").caption = _userName;
            _window.visible = false;
            activeView = _window;
            updateButtons();
            updateRelationshipStatus();
            _loc3_ = (_loc4_ = _window.findChildByName("relationship_grid") as IItemGridWindow).iterator;
            _loc5_ = int(_loc3_.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc2_ = (_loc7_ = _loc3_[_loc6_] as class_3151).findChildByName("button") as class_3151;
               _loc2_.procedure = buttonEventProc;
               _loc6_++;
            }
         }
      }
      
      override protected function buttonEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc5_:String = null;
         if(disposed)
         {
            return;
         }
         if(!_window || false)
         {
            return;
         }
         var _loc3_:Boolean = false;
         var _loc4_:RoomWidgetMessage = null;
         if(param1.type == "WME_CLICK")
         {
            if(param2.name == "button")
            {
               _loc3_ = true;
               switch(param2.parent.name)
               {
                  case "whisper":
                     _loc5_ = "RWUAM_WHISPER_USER";
                     break;
                  case "friend":
                     param2.disable();
                     var_45.canBeAskedAsFriend = false;
                     _loc5_ = "RWUAM_SEND_FRIEND_REQUEST";
                     break;
                  case "stargem":
                     _loc5_ = "RWUAM_GIVE_STAR_GEM_TO_USER";
                     break;
                  case "ignore":
                     param2.parent.visible = false;
                     _window.findChildByName("unignore").visible = true;
                     var_45.isIgnored = true;
                     _loc5_ = "RWUAM_IGNORE_USER";
                     break;
                  case "unignore":
                     param2.parent.visible = false;
                     _window.findChildByName("ignore").visible = true;
                     var_45.isIgnored = false;
                     _loc5_ = "RWUAM_UNIGNORE_USER";
                     break;
                  case "kick":
                     _loc5_ = "RWUAM_KICK_USER";
                     break;
                  case "ban_hour":
                     _loc5_ = "RWUAM_BAN_USER_HOUR";
                     break;
                  case "ban_day":
                     _loc5_ = "RWUAM_BAN_USER_DAY";
                     break;
                  case "perm_ban":
                     _loc5_ = "RWUAM_BAN_USER_PERM";
                     break;
                  case "mute_2min":
                     _loc5_ = "RWUAM_MUTE_USER_2MIN";
                     break;
                  case "mute_5min":
                     _loc5_ = "RWUAM_MUTE_USER_5MIN";
                     break;
                  case "mute_10min":
                     _loc5_ = "RWUAM_MUTE_USER_10MIN";
                     break;
                  case "ban_with_duration":
                     var_773 = 4;
                     var_1805 = true;
                     _loc3_ = false;
                     break;
                  case "mute":
                     var_773 = 5;
                     var_1805 = true;
                     _loc3_ = false;
                     break;
                  case "give_rights":
                     param2.parent.visible = false;
                     _window.findChildByName("remove_rights").visible = true;
                     var_45.myRoomControllerLevel = 1;
                     _loc5_ = "RWUAM_GIVE_RIGHTS";
                     break;
                  case "remove_rights":
                     param2.parent.visible = false;
                     _window.findChildByName("give_rights").visible = true;
                     var_45.myRoomControllerLevel = 0;
                     _loc5_ = "RWUAM_TAKE_RIGHTS";
                     break;
                  case "trade":
                     _loc5_ = "RWUAM_START_TRADING";
                     break;
                  case "moderate":
                     var_773 = 2;
                     var_1805 = true;
                     _loc3_ = false;
                     break;
                  case "report":
                     _loc5_ = "RWUAM_REPORT_CFH_OTHER";
                     break;
                  case "actions":
                     var_773 = 1;
                     var_1805 = true;
                     _loc3_ = false;
                     break;
                  case "relationship":
                     var_773 = 6;
                     var_1805 = true;
                     _loc3_ = false;
                     break;
                  case "pass_handitem":
                     _loc5_ = "RWUAM_PASS_CARRY_ITEM";
                     break;
                  case "relationship_heart":
                     setRelationship(1);
                     break;
                  case "relationship_smile":
                     setRelationship(2);
                     break;
                  case "relationship_bobba":
                     setRelationship(3);
                     break;
                  case "no_relationship":
                     setRelationship(0);
                     break;
                  case "ambassador":
                     var_773 = 7;
                     var_1805 = true;
                     _loc3_ = false;
                     break;
                  case "ambassador_alert":
                     _loc5_ = "RWUAM_AMBASSADOR_ALERT_USER";
                     break;
                  case "ambassador_kick":
                     _loc5_ = "RWUAM_AMBASSADOR_KICK_USER";
                     break;
                  case "ambassador_mute_2min":
                     _loc5_ = "RWUAM_AMBASSADOR_MUTE_2MIN";
                     break;
                  case "ambassador_mute_10min":
                     _loc5_ = "RWUAM_AMBASSADOR_MUTE_10MIN";
                     break;
                  case "ambassador_mute_15min":
                     _loc5_ = "RWUAM_AMBASSADOR_MUTE_15MIN";
                     break;
                  case "ambassador_mute_60min":
                     _loc5_ = "RWUAM_AMBASSADOR_MUTE_60MIN";
                     break;
                  case "ambassador_mute_18hour":
                     _loc5_ = "RWUAM_AMBASSADOR_MUTE_18HOUR";
                     break;
                  case "ambassador_mute_36hour":
                     _loc5_ = "RWUAM_AMBASSADOR_MUTE_36HOUR";
                     break;
                  case "ambassador_mute_72hour":
                     _loc5_ = "RWUAM_AMBASSADOR_MUTE_72HOUR";
                     break;
                  case "ambassador_unmute":
                     _loc5_ = "RWUAM_AMBASSADOR_UNMUTE";
               }
            }
            if(param2.name == "profile_link")
            {
               _loc3_ = true;
               _loc4_ = new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE",var_339,"avatarContextMenu");
            }
            if(_loc5_ != null)
            {
               _loc4_ = new RoomWidgetUserActionMessage(_loc5_,var_339);
               HabboTracking.getInstance().trackEventLog("InfoStand","click",_loc5_);
            }
            if(_loc4_ != null)
            {
               var_1429.messageListener.processWidgetMessage(_loc4_);
            }
            updateButtons();
         }
         else if(param1.type == "WME_OVER")
         {
            if(param2.name == "button")
            {
               switch(param2.parent.name)
               {
                  case "kick":
                     HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer","hover","avatar.kick.hover");
                     break;
                  case "perm_ban":
                  case "ban_hour":
                  case "ban_day":
                  case "ban_with_duration":
                     HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer","hover","avatar.ban.hover");
                     break;
                  case "mute":
                  case "mute_2min":
                  case "mute_5min":
                  case "mute_10min":
                     HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer","hover","avatar.mute.hover");
                     break;
                  case "unignore":
                  case "ignore":
                     HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer","hover","avatar.ignore.hover");
               }
            }
         }
         else
         {
            super.buttonEventProc(param1,param2);
         }
         if(_loc3_)
         {
            var_1429.removeView(this,false);
         }
      }
      
      private function get widget() : AvatarInfoWidget
      {
         return var_1429 as AvatarInfoWidget;
      }
      
      private function get citizenshipTalentTrackEnabled() : Boolean
      {
         return AvatarInfoWidget(var_1429).configuration.getBoolean("talent.track.citizenship.enabled");
      }
      
      private function setRelationship(param1:int) : void
      {
         var_1429.friendList.setRelationshipStatus(var_339,param1);
      }
   }
}
