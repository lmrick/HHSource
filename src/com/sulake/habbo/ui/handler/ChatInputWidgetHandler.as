package com.sulake.habbo.ui.handler
{
   import com.sulake.core.localization.class_17;
   import com.sulake.core.runtime.class_20;
   import com.sulake.habbo.friendbar.events.FriendBarResizeEvent;
   import com.sulake.habbo.room.events.RoomEngineZoomEvent;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;
   import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;
   import com.sulake.habbo.ui.widget.events.HideRoomWidgetEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFloodControlEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatTypingMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.room.utils.RoomShakingEffect;
   import flash.events.Event;
   import flash.ui.Mouse;
   import package_11.class_1569;
   
   public class ChatInputWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_311:Boolean = false;
      
      private var var_3295:Boolean = true;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_1429:RoomChatInputWidget;
      
      public function ChatInputWidgetHandler()
      {
         super();
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function set widget(param1:RoomChatInputWidget) : void
      {
         var_1429 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get type() : String
      {
         return "RWE_CHAT_INPUT_WIDGET";
      }
      
      public function dispose() : void
      {
         var_311 = true;
         _container = null;
         var_1429 = null;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push("RWCTM_TYPING_STATUS");
         _loc1_.push("RWCM_MESSAGE_CHAT");
         _loc1_.push("RWCSAM_MESSAGE_SELECT_AVATAR");
         return _loc1_;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc17_:RoomWidgetChatTypingMessage = null;
         var _loc12_:RoomWidgetChatMessage = null;
         var _loc7_:String = null;
         var _loc13_:RoomWidgetRequestWidgetMessage = null;
         var _loc18_:Array = null;
         var _loc21_:String = null;
         var _loc19_:String = null;
         var _loc24_:int = 0;
         var _loc5_:class_3259 = null;
         var _loc16_:class_3259 = null;
         var _loc22_:class_3259 = null;
         var _loc15_:class_3259 = null;
         var _loc20_:HabboToolbarEvent = null;
         var _loc4_:String = null;
         var _loc8_:class_1569 = null;
         var _loc2_:Date = null;
         var _loc14_:String = null;
         var _loc23_:int = 0;
         var _loc9_:RoomWidgetChatSelectAvatarMessage = null;
         var _loc10_:class_3259 = null;
         switch(param1.type)
         {
            case "RWCTM_TYPING_STATUS":
               if((_loc17_ = param1 as RoomWidgetChatTypingMessage) != null)
               {
                  _container.roomSession.sendChatTypingMessage(_loc17_.isTyping);
                  break;
               }
               break;
            case "RWCM_MESSAGE_CHAT":
               if(_container != null && false)
               {
                  if((_loc12_ = param1 as RoomWidgetChatMessage) != null)
                  {
                     if(_loc12_.text == "")
                     {
                        return null;
                     }
                     _loc7_ = _loc12_.text;
                     _loc13_ = null;
                     if((_loc18_ = _loc12_.text.split(" ")).length > 0)
                     {
                        _loc21_ = String(_loc18_[0]);
                        _loc19_ = "";
                        if(_loc18_.length > 1)
                        {
                           _loc19_ = String(_loc18_[1]);
                        }
                        if(_loc21_.charAt(0) == ":" && _loc19_ == "x")
                        {
                           if((_loc24_ = _container.roomEngine.getSelectedAvatarId()) > -1)
                           {
                              if((_loc5_ = _container.roomSession.userDataManager.getUserDataByIndex(_loc24_)) != null)
                              {
                                 _loc19_ = _loc5_.name;
                                 _loc7_ = _loc12_.text.replace(" x"," " + _loc5_.name);
                              }
                           }
                        }
                        switch(_loc21_.toLowerCase())
                        {
                           case ":shake":
                              RoomShakingEffect.init(250,5000);
                              RoomShakingEffect.turnVisualizationOn();
                              return null;
                           case ":d":
                           case ";d":
                              if(_container.sessionDataManager.hasVip)
                              {
                                 _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.LAUGH.ordinal);
                                 HabboTracking.getInstance().trackEventLog("OwnAvatarMenu","chat","laugh");
                                 break;
                              }
                              break;
                           case ":kiss":
                              if(_container.sessionDataManager.hasVip)
                              {
                                 _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.BLOW.ordinal);
                                 HabboTracking.getInstance().trackEventLog("OwnAvatarMenu","chat","blow");
                                 return null;
                              }
                              break;
                           case ":jump":
                              if(_container.sessionDataManager.hasVip)
                              {
                                 _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.JUMP.ordinal);
                                 HabboTracking.getInstance().trackEventLog("OwnAvatarMenu","chat","jump");
                                 return null;
                              }
                              break;
                           case ":news":
                              if(_container.config.getBoolean("client.news.embed.enabled"))
                              {
                                 HabboWebTools.openNews();
                                 return null;
                              }
                              break;
                           case ":mail":
                              if(_container.config.getBoolean("client.minimail.embed.enabled"))
                              {
                                 HabboWebTools.openMinimail("#mail/inbox/");
                                 return null;
                              }
                              break;
                           case ":crashme":
                           case ":ss":
                           case ":qss":
                           case ":gd":
                              break;
                           case ":csmm":
                              if(_container.sessionDataManager.hasSecurity(4))
                              {
                                 _container.gameManager.generateChecksumMismatch();
                                 return null;
                              }
                              break;
                           case ":tgl":
                           case ":li":
                              break;
                           case ":kick":
                              if(!container.sessionDataManager.hasSecurity(4))
                              {
                                 if(_container.roomSession.roomControllerLevel >= 1)
                                 {
                                    if(_loc16_ = _container.roomSession.userDataManager.getUserDataByName(_loc19_))
                                    {
                                       _container.roomSession.kickUser(_loc16_.webID);
                                    }
                                 }
                                 return null;
                              }
                              break;
                           case ":shutup":
                           case ":mute":
                              if(!_container.sessionDataManager.hasSecurity(4))
                              {
                                 if(_container.roomSession.roomControllerLevel >= 1)
                                 {
                                    if(_loc22_ = _container.roomSession.userDataManager.getUserDataByName(_loc19_))
                                    {
                                       _container.roomSession.muteUser(_loc22_.webID,2);
                                    }
                                 }
                                 return null;
                              }
                              break;
                           case ":link":
                           case ":q":
                           default:
                              break;
                           case "o/":
                           case "_o/":
                              _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.WAVE.ordinal);
                              return null;
                           case ":idle":
                              _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.const_419.ordinal);
                              HabboTracking.getInstance().trackEventLog("OwnAvatarMenu","chat","idle");
                              return null;
                           case "_b":
                              _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.RESPECT.ordinal);
                              HabboTracking.getInstance().trackEventLog("OwnAvatarMenu","chat","respect");
                              return null;
                           case ":fps":
                              (_container.roomEngine as class_20).context.displayObjectContainer.stage.frameRate = int(_loc19_);
                              return null;
                           case ":sign":
                              _container.roomSession.sendSignMessage(int(_loc19_));
                              HabboTracking.getInstance().trackEventLog("OwnAvatarMenu","chat","sign",null,int(_loc19_));
                              return null;
                           case ":drop":
                           case ":dropitem":
                              _loc13_ = new RoomWidgetRequestWidgetMessage("RWUAM_DROP_CARRY_ITEM");
                              _container.processWidgetMessage(_loc13_);
                              return null;
                           case ":chooser":
                              if(_container.sessionDataManager.hasClub || _container.sessionDataManager.hasSecurity(2) || _container.sessionDataManager.isAmbassador)
                              {
                                 _loc13_ = new RoomWidgetRequestWidgetMessage("RWRWM_USER_CHOOSER");
                                 _container.processWidgetMessage(_loc13_);
                              }
                              return null;
                           case ":furni":
                              if(_container.sessionDataManager.hasClub && _container.roomSession.roomControllerLevel >= 1 || _container.sessionDataManager.hasSecurity(2) || _container.sessionDataManager.isAmbassador)
                              {
                                 _loc13_ = new RoomWidgetRequestWidgetMessage("RWRWM_FURNI_CHOOSER");
                                 _container.processWidgetMessage(_loc13_);
                              }
                              return null;
                           case ":pickall":
                              _container.sessionDataManager.pickAllFurniture(_container.roomSession.roomId);
                              return null;
                           case ":pickallbc":
                              _container.sessionDataManager.pickAllBuilderFurniture(_container.roomSession.roomId);
                              return null;
                           case ":resetscores":
                              _container.sessionDataManager.resetScores(_container.roomSession.roomId);
                              return null;
                           case ":ejectall":
                              _container.sessionDataManager.ejectAllFurniture(_container.roomSession.roomId,_loc7_);
                              return null;
                           case ":ejectpets":
                              _container.sessionDataManager.ejectPets(_container.roomSession.roomId);
                              return null;
                           case ":moonwalk":
                              _container.sessionDataManager.sendSpecialCommandMessage(":moonwalk");
                              return null;
                           case ":habnam":
                              _container.sessionDataManager.sendSpecialCommandMessage(":habnam");
                              return null;
                           case ":yyxxabxa":
                              _container.sessionDataManager.sendSpecialCommandMessage(":yyxxabxa");
                              return null;
                           case ":mutepets":
                              _container.sessionDataManager.sendSpecialCommandMessage(":mutepets");
                              return null;
                           case ":mpgame":
                              _container.sessionDataManager.sendSpecialCommandMessage(_loc7_);
                              return null;
                           case ":ignore":
                              if(_loc19_)
                              {
                                 _container.sessionDataManager.ignoreUser(_loc19_);
                              }
                              return null;
                           case ":unignore":
                              if(_loc19_)
                              {
                                 _container.sessionDataManager.unignoreUser(_loc19_);
                              }
                              return null;
                           case ":floor":
                           case ":bcfloor":
                              if(_container.roomSession.roomControllerLevel >= 4)
                              {
                                 _container.windowManager.displayFloorPlanEditor();
                              }
                              return null;
                           case ":lang":
                              (_container.localization as class_17).activateLocalizationDefinition(_loc19_);
                              return null;
                           case ":uc":
                              if(_container.sessionDataManager.hasSecurity(4))
                              {
                                 if(_loc19_ == "hotel")
                                 {
                                    _container.roomSession.sendPeerUsersClassificationMessage(_loc18_[2]);
                                 }
                                 else
                                 {
                                    _container.roomSession.sendRoomUsersClassificationMessage(_loc19_);
                                 }
                              }
                              return null;
                           case ":anew":
                              if(_container.sessionDataManager.isAmbassador || _container.sessionDataManager.hasSecurity(4))
                              {
                                 _container.roomSession.sendRoomUsersClassificationMessage("new");
                              }
                              return null;
                           case ":avisit":
                              if(_container.sessionDataManager.isAmbassador || _container.sessionDataManager.hasSecurity(4))
                              {
                                 if("group" == _loc19_)
                                 {
                                    (_container.roomEngine as class_20).context.createLinkEvent("navigator/goto/predefined_group_lobby");
                                 }
                                 else
                                 {
                                    (_container.roomEngine as class_20).context.createLinkEvent("navigator/goto/predefined_noob_lobby");
                                 }
                              }
                              return null;
                           case ":aalert":
                              if(_container.sessionDataManager.isAmbassador || _container.sessionDataManager.hasSecurity(4))
                              {
                                 if(_loc15_ = _container.roomSession.userDataManager.getUserDataByName(_loc19_))
                                 {
                                    _container.roomSession.ambassadorAlert(_loc15_.webID);
                                 }
                              }
                              return null;
                           case ":visit":
                              _container.roomSession.sendVisitUserMessage(_loc19_);
                              return null;
                           case ":roomid":
                              _container.roomSession.sendVisitFlatMessage(parseInt(_loc19_));
                              return null;
                           case ":zoom":
                              _container.roomEngine.events.dispatchEvent(new RoomEngineZoomEvent(_container.roomEngine.activeRoomId,Number(_loc19_)));
                              return null;
                           case ":cam":
                           case ":camera":
                              if(_container.sessionDataManager.isPerkAllowed("CAMERA"))
                              {
                                 (_loc20_ = new HabboToolbarEvent("HTE_ICON_CAMERA")).iconName = "chatCameraCommand";
                                 _container.toolbar.events.dispatchEvent(_loc20_);
                              }
                              return null;
                           case ":fs":
                           case ":fullscreen":
                              _container.windowManager.toggleFullScreen();
                              return null;
                           case ":screenshot":
                              if(_loc8_ = _container.navigator.enteredGuestRoomData)
                              {
                                 _loc4_ = _loc8_.roomName;
                              }
                              if(_loc4_ == null || _loc4_.length == 0)
                              {
                                 _loc2_ = new Date();
                                 _loc14_ = [_loc2_.getFullYear(),_loc2_.getMonth(),_loc2_.getDate()].join("-") + " " + [_loc2_.getHours(),_loc2_.getMinutes(),_loc2_.getSeconds()].join(".");
                                 _loc4_ = "Habbo " + _loc14_;
                              }
                              _container.roomEngine.createScreenShot(_container.roomSession.roomId,_container.getFirstCanvasId(),_loc4_ + ".png");
                              return null;
                           case ":iddqd":
                              _container.roomEngine.events.dispatchEvent(new RoomEngineZoomEvent(_container.roomEngine.activeRoomId,-1,true));
                              return null;
                           case ":hidemouse":
                              if(var_3295)
                              {
                                 Mouse.hide();
                                 _container.roomEngine.setTileCursorState(_container.roomEngine.activeRoomId,0);
                              }
                              else
                              {
                                 Mouse.show();
                                 _container.roomEngine.setTileCursorState(_container.roomEngine.activeRoomId,1);
                              }
                              _container.roomEngine.toggleTileCursorVisibility(_container.roomEngine.activeRoomId,!var_3295);
                              var_3295 = !var_3295;
                              return null;
                        }
                     }
                     _loc23_ = _loc12_.styleId;
                     if(_container != null && false)
                     {
                        if(this._container.freeFlowChat != null)
                        {
                           if(this._container.freeFlowChat.preferedChatStyle != _loc12_.styleId && _loc12_.styleId != -1)
                           {
                              this._container.freeFlowChat.preferedChatStyle = _loc12_.styleId;
                           }
                           _loc23_ = this._container.freeFlowChat.preferedChatStyle;
                        }
                        switch(_loc12_.chatType)
                        {
                           case 0:
                              _container.roomSession.sendChatMessage(_loc7_,_loc23_);
                              break;
                           case 1:
                              _container.roomSession.sendWhisperMessage(_loc12_.recipientName,_loc7_,_loc23_);
                              break;
                           case 2:
                              _container.roomSession.sendShoutMessage(_loc7_,_loc23_);
                        }
                        HabboTracking.getInstance().trackEventLogOncePerSession("Tutorial","interaction","avatar.chat");
                        break;
                     }
                     break;
                  }
                  break;
               }
               break;
            case "RWCSAM_MESSAGE_SELECT_AVATAR":
               if((_loc9_ = param1 as RoomWidgetChatSelectAvatarMessage) != null)
               {
                  _container.roomEngine.selectAvatar(_loc9_.roomId,_loc9_.objectId);
                  if((_loc10_ = _container.roomSession.userDataManager.getUserDataByIndex(_loc9_.objectId)) != null)
                  {
                     _container.moderation.userSelected(_loc10_.webID,_loc9_.userName);
                     break;
                  }
                  break;
               }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return ["RSCE_FLOOD_EVENT","hrwe_hide_room_widget","FBE_BAR_RESIZE_EVENT"];
      }
      
      public function update() : void
      {
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:RoomSessionChatEvent = null;
         var _loc2_:int = 0;
         var _loc4_:FriendBarResizeEvent = null;
         var _loc5_:Event = null;
         if(_container == null || true)
         {
            return;
         }
         switch(param1.type)
         {
            case "RSCE_FLOOD_EVENT":
               _loc3_ = param1 as RoomSessionChatEvent;
               _loc2_ = parseInt(_loc3_.text);
               _loc5_ = new RoomWidgetFloodControlEvent(_loc2_);
               break;
            case "FBE_BAR_RESIZE_EVENT":
               _loc4_ = param1 as FriendBarResizeEvent;
               var_1429.checkChatInputPosition();
               break;
            default:
               break;
            case "hrwe_hide_room_widget":
               handleHideWidgetEvent(param1 as HideRoomWidgetEvent);
               return;
         }
         if(_container != null && false && _loc5_ != null)
         {
            _container.events.dispatchEvent(_loc5_);
         }
      }
      
      private function handleHideWidgetEvent(param1:HideRoomWidgetEvent) : void
      {
         if(param1 && param1.widgetType == this.type)
         {
            var_1429.hide();
         }
      }
   }
}
