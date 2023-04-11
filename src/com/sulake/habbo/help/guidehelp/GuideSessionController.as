package com.sulake.habbo.help.guidehelp
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.messages.parser.help.class_1117;
   import com.sulake.habbo.communication.messages.parser.help.class_1180;
   import com.sulake.habbo.communication.messages.parser.help.class_1182;
   import com.sulake.habbo.communication.messages.parser.help.class_1207;
   import com.sulake.habbo.communication.messages.parser.help.class_1224;
   import com.sulake.habbo.communication.messages.parser.help.class_1265;
   import com.sulake.habbo.communication.messages.parser.help.class_1363;
   import com.sulake.habbo.communication.messages.parser.help.class_1374;
   import com.sulake.habbo.communication.messages.parser.help.class_1394;
   import com.sulake.habbo.communication.messages.parser.help.class_1484;
   import com.sulake.habbo.communication.messages.parser.help.class_1503;
   import com.sulake.habbo.help.GuideHelpManager;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.utils.FriendlyTime;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.habbo.window.widgets.IIlluminaChatBubbleWidget;
   import com.sulake.habbo.window.widgets.IIlluminaInputHandler;
   import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
   import com.sulake.habbo.window.widgets.class_3308;
   import com.sulake.habbo.window.widgets.class_3332;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import mx.utils.StringUtil;
   import package_178.class_1358;
   import package_4.class_144;
   import package_4.class_171;
   import package_4.class_294;
   import package_4.class_298;
   import package_4.class_395;
   import package_4.class_422;
   import package_4.class_444;
   import package_4.class_543;
   import package_4.class_571;
   import package_4.class_604;
   import package_4.class_609;
   import package_4.class_660;
   import package_4.class_819;
   import package_4.class_830;
   import package_4.class_908;
   import package_68.class_782;
   import package_69.class_1025;
   import package_69.class_283;
   import package_69.class_286;
   import package_69.class_310;
   import package_69.class_318;
   import package_69.class_343;
   import package_69.class_382;
   import package_69.class_408;
   import package_69.class_587;
   import package_69.class_642;
   import package_69.class_730;
   import package_69.class_769;
   import package_69.class_825;
   import package_69.class_954;
   import package_7.class_197;
   import package_7.class_313;
   import package_80.class_956;
   
   public class GuideSessionController implements class_13, IIlluminaInputHandler
   {
      
      private static const SYSTEM_MSG_CHAT:int = 0;
      
      private static const SYSTEM_MSG_NOTIFICATION:int = 1;
      
      private static const SYSTEM_MSG_REMINDER:int = 2;
      
      private static const CHAT_MSG_DEFAULT:int = 0;
      
      private static const CHAT_MSG_INVITE:int = 1;
      
      private static const CHAT_MSG_SYSTEM:int = 2;
      
      private static const CHAT_REVIEW_VOTE_NONE:int = -1;
      
      private static const CHAT_REVIEW_VOTE_OK:int = 0;
      
      private static const CHAT_REVIEW_VOTE_BAD:int = 1;
      
      private static const CHAT_REVIEW_VOTE_VERY_BAD:int = 2;
      
      private static const const_1062:int = 3000;
      
      private static const const_806:int = 500;
      
      private static const STATUS_KEYS:Array = ["waiting","ok","bad","very_bad","refused","searching"];
      
      private static const RESULT_KEYS:Array = ["waiting","ok","bad","very_bad","inconclusive","searching"];
      
      private static const STATUS_KEY_PREFIX:String = "${guide.bully.request.guide.results.outcome.";
      
      private static const STATUS_ICON_PREFIX:String = "help_chat_review_decision_";
       
      
      private var _habboHelp:HabboHelp;
      
      private var _guideHelp:GuideHelpManager;
      
      private var _window:class_3151;
      
      private var var_1648:class_3151;
      
      private var _sessionData:com.sulake.habbo.help.guidehelp.GuideSessionData;
      
      private var _windowPosition:Point;
      
      private var _onDuty:Boolean = false;
      
      private var var_2363:Boolean;
      
      private var var_2311:Boolean;
      
      private var var_2347:Boolean;
      
      private var _resubmitDescription:Boolean = false;
      
      private var _chatMsg:class_3217;
      
      private var _chatMsgNotification:class_3151;
      
      private var var_4052:class_3151;
      
      private var _disposed:Boolean = false;
      
      private var var_1883:Timer;
      
      private var _lastMessageTypedLength:int;
      
      private var _lastTypingInfo:Boolean;
      
      private var var_2202:Timer;
      
      private var var_1961:Vector.<com.sulake.habbo.help.guidehelp.AnimationData>;
      
      private var var_2305:Timer;
      
      private var var_3255:int;
      
      public function GuideSessionController(param1:GuideHelpManager)
      {
         _windowPosition = new Point(120,80);
         super();
         _habboHelp = param1.habboHelp;
         _guideHelp = param1;
         _sessionData = new com.sulake.habbo.help.guidehelp.GuideSessionData();
         _chatMsg = class_3217(_habboHelp.getXmlWindow("chat_msg"));
         _chatMsgNotification = class_3151(_habboHelp.getXmlWindow("chat_msg_notification"));
         var_4052 = class_3151(_habboHelp.getXmlWindow("chat_msg_reminder"));
         var_2363 = _habboHelp.getBoolean("guidetool.handle.help_requests");
         var_2311 = _habboHelp.getBoolean("guidetool.handle.chat_reviews");
         var_2347 = _habboHelp.getBoolean("guidetool.handle.tour_requests");
         _habboHelp.context.displayObjectContainer.stage.addEventListener("mouseMove",onStageMouseMove);
         var_1961 = new Vector.<com.sulake.habbo.help.guidehelp.AnimationData>();
         var_2202 = new Timer(500);
         var_2202.addEventListener("timer",onWaitingAnimationTimer);
         var_2202.start();
         var_3255 = getTimer();
         var_2305 = new Timer(5000);
         var_2305.addEventListener("timer",onIdleCheckTimer);
         var_2305.start();
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_171(onGuideSessionStarted));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_422(onChatReviewSessionOfferedToGuide));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_543(onGuideSessionPartnerIsTyping));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_571(onGuideSessionInvitedToGuideRoom));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_908(onChatReviewSessionDetached));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_819(onGuideSessionDetached));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_660(onGuideSessionEnded));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_609(onChatReviewSessionResults));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_444(onGuideSessionRequesterRoom));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_395(onChatReviewSessionStarted));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_830(onGuideSessionAttached));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_782(onPerkAllowances));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_294(onGuideSessionMessage));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_144(onGuideSessionError));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_604(onChatReviewSessionVotingStatus));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_298(onGuideOnDutyStatus));
      }
      
      private static function statusFromVote(param1:int) : int
      {
         var _loc2_:int = 0;
         switch(param1 - -1)
         {
            case 0:
               _loc2_ = 4;
               break;
            case 1:
               _loc2_ = 1;
               break;
            case 2:
               _loc2_ = 2;
               break;
            case 3:
               _loc2_ = 3;
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(var_2305 != null)
         {
            var_2305.stop();
            var_2305.removeEventListener("timer",onIdleCheckTimer);
            var_2305 = null;
         }
         if(var_2202 != null)
         {
            var_2202.stop();
            var_2202.removeEventListener("timer",onWaitingAnimationTimer);
            var_2202 = null;
         }
         var_1961 = null;
         if(_chatMsg)
         {
            _chatMsg.dispose();
            _chatMsg = null;
         }
         if(_chatMsgNotification)
         {
            _chatMsgNotification.dispose();
            _chatMsgNotification = null;
         }
         closeWindow();
         _sessionData = null;
         _windowPosition = null;
         _guideHelp = null;
         if(_habboHelp && false && _habboHelp.context.displayObjectContainer)
         {
            _habboHelp.context.displayObjectContainer.stage.removeEventListener("mouseMove",onStageMouseMove);
         }
         _habboHelp = null;
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function createHelpRequest(param1:uint) : void
      {
         if(_sessionData.isActiveSession())
         {
            class_14.log("Can\'t create a new help request while another help request is ongoing");
            return;
         }
         if(param1 == 0 || param1 == 2)
         {
            _sessionData.role = 2;
            _sessionData.activeWindow = "user_create";
            _sessionData.requestType = param1;
            _habboHelp.sendMessage(new class_587(param1,_habboHelp.localization.getLocalization("guide.help.request.tour.description")));
         }
         else
         {
            setStateUserCreateRequest(param1);
         }
      }
      
      public function showGuideTool() : void
      {
         _habboHelp.sendMessage(new class_318(_onDuty,var_2347,var_2363,var_2311));
      }
      
      private function onGuideOnDutyStatus(param1:class_298) : void
      {
         var _loc2_:class_1180 = param1.getParser();
         _onDuty = _loc2_.onDuty;
         _habboHelp.localization.registerParameter("guide.help.guide.tool.guidesonduty","amount",_loc2_.guidesOnDuty.toString());
         _habboHelp.localization.registerParameter("guide.help.guide.tool.helpersonduty","amount",_loc2_.helpersOnDuty.toString());
         _habboHelp.localization.registerParameter("guide.help.guide.tool.guardiansonduty","amount",_loc2_.guardiansOnDuty.toString());
         setStateGuideTool();
      }
      
      private function onGuideSessionAttached(param1:IMessageEvent) : void
      {
         class_14.log("onGuideSessionAttached");
         if(_disposed || !_sessionData)
         {
            class_14.log("_diposed or no _sessionData");
            return;
         }
         var _loc2_:class_1182 = param1.parser as class_1182;
         if(_loc2_.asGuide)
         {
            if(_sessionData.isActiveGuideSession())
            {
               setStateError();
               return;
            }
            setStateGuideAccept(_loc2_.helpRequestType,_loc2_.helpRequestDescription,_loc2_.roleSpecificWaitTime);
         }
         else
         {
            if(!_sessionData.isActiveUserSession())
            {
               setStateError();
               return;
            }
            setStateUserPendingRequest(_loc2_.helpRequestType,_loc2_.helpRequestDescription,_loc2_.roleSpecificWaitTime);
         }
      }
      
      private function onGuideSessionDetached(param1:IMessageEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         class_14.log("onGuideSessionDetached");
         if(_disposed)
         {
            return;
         }
         if(_resubmitDescription)
         {
            _loc2_ = 0;
            _loc3_ = "null";
            resetSessionData();
            setStateUserCreateRequest(_loc2_,_loc3_);
         }
         else if(_sessionData.isActiveUserSession() && false)
         {
            setStateUserThanks();
         }
         else
         {
            setStateClosed(true);
         }
      }
      
      private function onGuideSessionStarted(param1:IMessageEvent) : void
      {
         class_14.log("onGuideSessionStarted");
         if(_disposed)
         {
            return;
         }
         var _loc2_:class_1374 = param1.parser as class_1374;
         _sessionData.userId = _loc2_.requesterUserId;
         _sessionData.userName = _loc2_.requesterName;
         _sessionData.userFigure = _loc2_.requesterFigure;
         _sessionData.guideId = _loc2_.guideUserId;
         _sessionData.guideName = _loc2_.guideName;
         _sessionData.guideFigure = _loc2_.guideFigure;
         _lastTypingInfo = false;
         if(_sessionData.isActiveGuideSession())
         {
            setStateGuideOngoing();
         }
         else
         {
            setStateUserOngoingRequest();
         }
      }
      
      private function onGuideSessionEnded(param1:IMessageEvent) : void
      {
         class_14.log("onGuideSessionEnded");
         if(_disposed)
         {
            return;
         }
         var _loc2_:class_1224 = param1.parser as class_1224;
         if(_sessionData.isActiveGuideSession())
         {
            setStateGuideClosed(_loc2_.endReason);
         }
         else if(_loc2_.endReason == 0)
         {
            setStateUserGuideDisconnected();
         }
         else
         {
            setStateUserFeedback();
         }
      }
      
      private function onGuideSessionError(param1:class_144) : void
      {
         class_14.log("onGuideSessionError");
         if(_disposed)
         {
            return;
         }
         var _loc2_:class_1207 = param1.getParser();
         switch(_loc2_.errorCode - 1)
         {
            case 0:
               setStateRejected();
               break;
            case 1:
            case 2:
               setStateClosedWithNotification("guide.bully.request.error.not_enough_guardians");
               break;
            default:
               setStateError();
         }
      }
      
      private function onGuideSessionMessage(param1:IMessageEvent) : void
      {
         var _loc4_:String = null;
         var _loc6_:String = null;
         class_14.log("onGuideSessionMessage");
         if(_disposed || !_sessionData.isOnGoingSession() || _window == null)
         {
            return;
         }
         var _loc5_:class_1265;
         var _loc3_:int = (_loc5_ = param1.parser as class_1265).senderId;
         if(_loc3_ == _sessionData.guideId)
         {
            _loc4_ = "null";
            _loc6_ = "null";
         }
         else
         {
            _loc4_ = "null";
            _loc6_ = "null";
         }
         var _loc2_:Boolean = true;
         if(_sessionData.isActiveGuideSession() && _sessionData.guideId == _loc3_)
         {
            _loc2_ = false;
         }
         else if(!_sessionData.isActiveGuideSession() && _sessionData.userId == _loc3_)
         {
            _loc2_ = false;
         }
         addChatMessage(_loc3_,_loc4_,_loc6_,_loc5_.chatMessage,_loc2_);
      }
      
      private function onGuideSessionRequesterRoom(param1:IMessageEvent) : void
      {
         class_14.log("onGuideSessionRequesterRoom");
         if(_disposed || !_sessionData.isOnGoingSession())
         {
            return;
         }
         var _loc2_:class_1503 = param1.parser as class_1503;
         if(_loc2_.getRequesterRoomId() > 0)
         {
            _habboHelp.roomSessionManager.gotoRoom(_loc2_.getRequesterRoomId());
         }
         else
         {
            addChatMessage(_sessionData.guideId,_sessionData.guideName,_sessionData.guideFigure,_habboHelp.localization.getLocalization("guide.help.request.guide.ongoing.user.not.in.room.error",""),false,2);
         }
      }
      
      private function onGuideSessionInvitedToGuideRoom(param1:IMessageEvent) : void
      {
         class_14.log("onGuideSessionInvitedToGuideRoom");
         if(_disposed || _window == null || !_sessionData.isOnGoingSession())
         {
            return;
         }
         var _loc2_:class_1394 = param1.parser as class_1394;
         if(_sessionData.isActiveGuideSession())
         {
            if(_loc2_.getRoomId() > 0)
            {
               addSystemMessage(0,_habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.ongoing.error.invite.success","","name",_sessionData.userName));
            }
            else
            {
               addSystemMessage(0,_habboHelp.localization.getLocalization("guide.help.request.guide.ongoing.error.invite.failed",""));
            }
         }
         else if(_loc2_.getRoomId() > 0)
         {
            addChatMessage(_sessionData.guideId,_sessionData.guideName,_sessionData.guideFigure,_habboHelp.localization.getLocalizationWithParams("guide.help.request.user.ongoing.visit.guide.request.message","","name",_sessionData.guideName,"roomname",_loc2_.getRoomName()),true,1,_loc2_.getRoomId());
         }
      }
      
      private function onGuideSessionPartnerIsTyping(param1:IMessageEvent) : void
      {
         class_14.log("onGuideSessionPartnerIsTyping");
         var _loc2_:class_1117 = class_543(param1).getParser();
         displayPartnerIsTypingMessage(_loc2_.isTyping);
      }
      
      private function onPerkAllowances(param1:class_782) : void
      {
         var _loc2_:class_1358 = null;
         if(false)
         {
            _loc2_ = param1.getParser();
            if(!_loc2_.isPerkAllowed("USE_GUIDE_TOOL"))
            {
               if(_onDuty)
               {
                  setOnDuty(false);
                  _habboHelp.sendMessage(new class_318(false,false,false,false));
               }
               setStateClosed(false);
            }
         }
      }
      
      private function onChatReviewSessionOfferedToGuide(param1:class_422) : void
      {
         setStateGuardianChatReviewAccept(param1.getParser().acceptanceTimeout);
      }
      
      private function onChatReviewSessionStarted(param1:class_395) : void
      {
         var _loc2_:class_1363 = param1.getParser();
         setStateGuardianChatReviewVote(_loc2_.votingTimeout,_loc2_.chatRecord);
      }
      
      private function onChatReviewSessionVotingStatus(param1:class_604) : void
      {
         if(true)
         {
            return;
         }
         showStatus(_window.findChildByName("results") as IItemListWindow,param1.getParser().status);
      }
      
      private function onChatReviewSessionResults(param1:class_609) : void
      {
         var _loc2_:class_1484 = param1.getParser();
         setStateGuardianChatReviewResults(_loc2_.winningVoteCode,_loc2_.ownVoteCode,_loc2_.finalStatus);
      }
      
      private function onChatReviewSessionDetached(param1:IMessageEvent) : void
      {
         setStateClosed(true);
      }
      
      private function setStateGuideTool() : void
      {
         var _loc2_:IItemListWindow = null;
         var _loc1_:class_3151 = null;
         if(_sessionData.isActiveSession())
         {
            class_14.log("Trying to set state to guide tool, but an active session exists");
            return;
         }
         _sessionData.activeWindow = "guide_tool";
         openWindow(onGuideToolEvent,true);
         setOnDutyStatus(_onDuty);
         _window.procedure = onGuideToolEvent;
         setCheckBoxValue("handle_guardian_tickets",var_2311);
         setCheckBoxValue("handle_helper_tickets",var_2363);
         setCheckBoxValue("handle_guide_tickets",var_2347);
         if(!_habboHelp.sessionDataManager.isPerkAllowed("JUDGE_CHAT_REVIEWS"))
         {
            _loc2_ = IItemListWindow(_window.findChildByName("list"));
            _loc1_ = _loc2_.getListItemByName("handle_selection_container") as class_3151;
            _loc1_.findChildByName("handle_guardian_tickets").dispose();
            _loc1_.findChildByName("selection_separator").y = _loc1_.findChildByName("selection_separator").y - 17;
            _loc1_.height -= 17;
         }
      }
      
      private function onGuideToolEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:String = null;
         if(disposed || _window == null || true)
         {
            return;
         }
         var _loc3_:int = 0;
         loop0:
         switch(param2.name)
         {
            case "header_button_close":
               if(param1.type == "WME_CLICK")
               {
                  setStateClosed(false);
                  break;
               }
               break;
            case "helper_group_link":
               if(param1.type == "WME_CLICK")
               {
                  _loc3_ = _habboHelp.getInteger("guide.help.alpha.groupid",0);
                  if(_loc3_ > 0)
                  {
                     _habboHelp.sendMessage(new class_197(_loc3_,true));
                     _habboHelp.trackGoogle("guideHelp","undefined_groupProfile");
                     break;
                  }
                  break;
               }
               break;
            case "guide_forum_link":
               if(param1.type == "WME_CLICK")
               {
                  _loc3_ = _habboHelp.getInteger("guide.help.alpha.groupid",0);
                  if(_loc3_ > 0)
                  {
                     _loc4_ = (_loc4_ = _habboHelp.getProperty("group.homepage.url")).replace("%groupid%",_loc3_);
                     HabboWebTools.openWebPage(_loc4_,"habboMain");
                     _habboHelp.trackGoogle("guideHelp","undefined_groupForum");
                     break;
                  }
                  break;
               }
               break;
            case "guide_tool_duty":
               switch(param1.type)
               {
                  case "WE_SELECTED":
                     setOnDutyStatus(true);
                     var_2363 = (_window.findChildByName("handle_helper_tickets") as class_3176).isSelected;
                     var_2311 = _window.findChildByName("handle_guardian_tickets") != null && Boolean((_window.findChildByName("handle_guardian_tickets") as class_3176).isSelected);
                     var_2347 = (_window.findChildByName("handle_guide_tickets") as class_3176).isSelected;
                     if(!var_2363 && !var_2311 && !var_2347)
                     {
                        _habboHelp.windowManager.simpleAlert("${guide.help.guide.tool.noqueueselected.caption}","${guide.help.guide.tool.noqueueselected.subtitle}","${guide.help.guide.tool.noqueueselected.message}");
                        setOnDutyStatus(false);
                        return;
                     }
                     _habboHelp.sendMessage(new class_318(true,var_2347,var_2363,var_2311));
                     _habboHelp.trackGoogle("guideHelp","undefined_onDuty");
                     break loop0;
                  case "WE_UNSELECTED":
                     setOnDutyStatus(false);
                     _habboHelp.sendMessage(new class_318(false,false,false,false));
                     _habboHelp.trackGoogle("guideHelp","undefined_offDuty");
               }
               break;
            case "guide_tool_talent":
               if(param1.type == "WME_CLICK")
               {
                  if(_habboHelp.getBoolean("talent.track.enabled"))
                  {
                     _habboHelp.tracking.trackTalentTrackOpen("helper","guidetool");
                     _habboHelp.sendMessage(new class_956("helper"));
                     _habboHelp.trackGoogle("guideHelp","undefined_talent");
                     break;
                  }
                  break;
               }
         }
      }
      
      private function setStateGuideAccept(param1:int, param2:String, param3:int) : void
      {
         var _loc9_:class_3127 = null;
         var _loc5_:ITextWindow = null;
         var _loc7_:IItemListWindow = null;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         if(!_onDuty || _sessionData.isActiveSession())
         {
            class_14.log("Trying to set state to guide accept, but not on duty or active session exists");
            return;
         }
         _sessionData.activeWindow = "guide_accept";
         _sessionData.role = 1;
         _sessionData.requestDescription = param2;
         _sessionData.requestType = param1;
         openWindow(onGuideAcceptEvent,false);
         _habboHelp.soundManager.playSound("HBST_guide_request");
         if(param1 == 2 || param1 == 0)
         {
            _window.findChildByName("frank_greeting").visible = true;
            _window.findChildByName("request_title").caption = "${guide.help.request.guide.accept.tour_request.title}";
            _window.findChildByName("request_type").dispose();
            _loc9_ = _window.findChildByName("request_description_wrapper");
            _loc5_ = _window.findChildByName("request_description") as ITextWindow;
            (_loc7_ = _window.findChildByName("itemlist") as IItemListWindow).addListItemAt(_loc5_,_loc7_.getListItemIndex(_loc9_));
            _loc7_.removeListItem(_loc9_);
            _loc5_.x = _window.findChildByName("request_title").x;
            _loc5_.margins.top = 10;
            _loc5_.caption = param2;
            _loc6_ = int(_loc7_.height);
            _loc4_ = _window.findChildByName("skip_link").bottom;
            _loc7_.height = _loc4_;
            _window.findChildByName("border").height = _window.findChildByName("border").height + (_loc4_ - _loc6_);
            _window.height += _loc4_ - _loc6_ + 40;
         }
         else
         {
            _window.findChildByName("request_type").caption = getRequestTypeCaption(param1);
            _window.findChildByName("request_description").caption = param2;
         }
         var _loc8_:class_3332;
         (_loc8_ = class_3332(class_3217(_window.findChildByName("countdown")).widget)).seconds = param3;
         _loc8_.running = true;
      }
      
      private function onGuideAcceptEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "accept_button":
               _habboHelp.sendMessage(new class_382(true));
               _habboHelp.trackGoogle("guideHelp","undefined_clickAccept");
               closeWindow();
               break;
            case "skip_link":
               _habboHelp.sendMessage(new class_382(false));
               _habboHelp.trackGoogle("guideHelp","undefined_clickSkip");
               closeWindow();
         }
      }
      
      private function setStateGuideOngoing() : void
      {
         var inputWidget:IIlluminaInputWidget;
         var title:String;
         var summary:String;
         if(!_onDuty || !_sessionData.isActiveGuideSession())
         {
            class_14.log("Trying to set state to guide ongoing, but not on duty or no active guide session");
            return;
         }
         _sessionData.activeWindow = "guide_ongoing";
         openWindow(onGuideOngoingEvent,false);
         addChatMessage(_sessionData.userId,_sessionData.userName,_sessionData.userFigure,_sessionData.requestDescription,true,2);
         _window.caption = _habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.ongoing.title","","name",_sessionData.userName);
         inputWidget = IIlluminaInputWidget(class_3217(_window.findChildByName("input_widget")).widget);
         inputWidget.submitHandler = this;
         inputWidget.emptyMessage = _habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.ongoing.input.empty","","name",_sessionData.userName);
         inputWidget.maxChars = _habboHelp.getInteger("guide.help.request.max.chat.message.length",150);
         if(false)
         {
            title = "${guide.help.request.join.room.title}";
            summary = String(_habboHelp.localization.getLocalizationWithParams("guide.help.request.join.room.summary","","name",_sessionData.userName));
            _habboHelp.windowManager.confirm(title,summary,0,function(param1:class_3216, param2:class_3134):void
            {
               param1.dispose();
               if(param2.type == "WE_OK")
               {
                  _habboHelp.sendMessage(new class_642());
               }
            });
         }
      }
      
      private function onGuideOngoingEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "visit_button":
               _habboHelp.sendMessage(new class_642());
               _habboHelp.trackGoogle("guideHelp","undefined_clickVisit");
               break;
            case "invite_button":
               _habboHelp.sendMessage(new class_286());
               _habboHelp.trackGoogle("guideHelp","undefined_clickInvite");
               break;
            case "report_link":
               tryOpeningReportWindow();
               _habboHelp.trackGoogle("guideHelp","undefined_clickReport");
               break;
            case "close_link":
               _habboHelp.sendMessage(new class_283());
               _habboHelp.trackGoogle("guideHelp","undefined_clickClose");
               closeWindow();
         }
      }
      
      private function setStateGuideClosed(param1:int) : void
      {
         if(!_onDuty || !_sessionData.isActiveGuideSession())
         {
            class_14.log("Trying to set state to guide ongoing, but not on duty or no active guide session");
            return;
         }
         _sessionData.activeWindow = "guide_closed";
         openWindow(onGuideClosedEvent,true);
         if(param1 == 0 || param1 == 1)
         {
            _window.findChildByName("close_reason").caption = _habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.closed.reason.other","","name",_sessionData.userName);
         }
         else
         {
            _window.findChildByName("close_reason").caption = _habboHelp.localization.getLocalization("guide.help.request.guide.closed.reason.you","");
         }
         _window.findChildByName("report_link").caption = _habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.closed.report.link","","name",_sessionData.userName);
         class_3308(class_3217(_window.findChildByName("requester_avatar")).widget).figure = _sessionData.userFigure;
      }
      
      private function onGuideClosedEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "close_button":
            case "header_button_close":
               _habboHelp.sendMessage(new class_730(true));
               closeWindow();
               break;
            case "report_link":
               tryOpeningReportWindow();
               _habboHelp.trackGoogle("guideHelp","undefined_clickReport");
         }
      }
      
      private function setStateUserCreateRequest(param1:uint, param2:String = null) : void
      {
         if(_sessionData.isActiveSession())
         {
            class_14.log("Trying to set state to user create, but active session exists");
            return;
         }
         _sessionData.role = 2;
         _sessionData.activeWindow = "user_create";
         _sessionData.requestType = param1;
         openWindow(onUserCreateEvent,true);
         var _loc3_:IIlluminaInputWidget = IIlluminaInputWidget(class_3217(_window.findChildByName("input_widget")).widget);
         _loc3_.maxChars = _habboHelp.getInteger("guide.help.request.max.description.length",255);
         if(param2)
         {
            _loc3_.message = param2;
         }
      }
      
      private function onUserCreateEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:String = null;
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "create_button":
               _loc3_ = String(StringUtil.trim(IIlluminaInputWidget(class_3217(_window.findChildByName("input_widget")).widget).message));
               if(_loc3_.length < _habboHelp.getInteger("guide.help.request.min.description.length",15))
               {
                  _window.findChildByName("create_error").visible = true;
                  IItemListWindow(_window.findChildByName("list")).arrangeListItems();
                  break;
               }
               _habboHelp.sendMessage(new class_587(_sessionData.requestType,_loc3_));
               _habboHelp.trackGoogle("guideHelp","undefined_clickCreate");
               closeWindow();
               break;
            case "header_button_close":
            case "cancel_link":
               _habboHelp.trackGoogle("guideHelp","undefined_clickCancel");
               setStateClosed(true);
         }
      }
      
      private function setStateUserPendingRequest(param1:int, param2:String, param3:int) : void
      {
         if(!_sessionData.isActiveUserSession())
         {
            class_14.log("Trying to set state to user pending request, but no active user session");
            return;
         }
         _sessionData.activeWindow = "user_pending";
         _sessionData.requestType = param1;
         _sessionData.requestDescription = param2;
         openWindow(onUserPendingEvent,false);
         _window.findChildByName("request_type").caption = getRequestTypeCaption(param1);
         _window.findChildByName("request_description").caption = param2;
         _window.findChildByName("waiting_time").caption = _habboHelp.localization.getLocalizationWithParams("guide.help.request.user.pending.info.waiting","","waitingtime",FriendlyTime.getFriendlyTime(_habboHelp.localization,param3));
      }
      
      private function onUserPendingEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         var _loc3_:* = param2.name;
         if("cancel_button" === _loc3_)
         {
            _habboHelp.sendMessage(new class_1025());
            _habboHelp.trackGoogle("guideHelp","undefined_clickCancel");
            closeWindow();
         }
      }
      
      private function setStateUserOngoingRequest() : void
      {
         if(!_sessionData.isActiveUserSession())
         {
            class_14.log("Trying to set state to user ongoing request, but no active user session");
            return;
         }
         _sessionData.activeWindow = "user_ongoing";
         openWindow(onUserOngoingEvent,false);
         addSystemMessage(1,_habboHelp.localization.getLocalization("guide.help.requester.disclaimer"));
         if(false)
         {
            addSystemMessage(2,_habboHelp.localization.getLocalization("guide.help.request.tour.reminder"));
         }
         else
         {
            addChatMessage(_sessionData.userId,_sessionData.userName,_sessionData.userFigure,_sessionData.requestDescription,false,2);
         }
         _window.caption = _habboHelp.localization.getLocalizationWithParams("guide.help.request.user.ongoing.title","","name",_sessionData.guideName);
         _window.findChildByName("guide_name_link").caption = _sessionData.guideName;
         var _loc1_:IIlluminaInputWidget = IIlluminaInputWidget(class_3217(_window.findChildByName("input_widget")).widget);
         _loc1_.submitHandler = this;
         _loc1_.emptyMessage = _habboHelp.localization.getLocalizationWithParams("guide.help.request.user.ongoing.input.help","","name",_sessionData.guideName);
         _loc1_.maxChars = _habboHelp.getInteger("guide.help.request.max.chat.message.length",150);
      }
      
      private function onUserOngoingEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "guide_name_link":
               _habboHelp.sendMessage(new class_313(_sessionData.guideId));
               _habboHelp.trackGoogle("guideHelp","undefined_clickProfile");
               break;
            case "report_guide_link":
               tryOpeningReportWindow();
               _habboHelp.trackGoogle("guideHelp","undefined_clickReport");
               break;
            case "close_link":
               _habboHelp.sendMessage(new class_283());
               _habboHelp.trackGoogle("guideHelp","undefined_clickClose");
               closeWindow();
         }
      }
      
      private function setStateUserGuideDisconnected() : void
      {
         if(!_sessionData.isActiveUserSession())
         {
            class_14.log("Trying to set state to user guide disconnected, but no active user session");
            return;
         }
         _sessionData.activeWindow = "user_guide_disconnected";
         openWindow(onUserGuideDisconnected,true);
         _window.findChildByName("guide_name_link").caption = _sessionData.guideName;
      }
      
      private function onUserGuideDisconnected(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
               _habboHelp.sendMessage(new class_730(false));
               closeWindow();
               break;
            case "guide_name_link":
               _habboHelp.sendMessage(new class_313(_sessionData.guideId));
               _habboHelp.trackGoogle("guideHelp","undefined_clickProfile");
               break;
            case "report_guide_link":
               tryOpeningReportWindow();
               _habboHelp.trackGoogle("guideHelp","undefined_clickReport");
               break;
            case "resubmit_button":
               _resubmitDescription = true;
               _habboHelp.sendMessage(new class_730(false));
               _habboHelp.trackGoogle("guideHelp","undefined_clickResubmit");
               closeWindow();
         }
      }
      
      private function setStateUserFeedback() : void
      {
         if(!_sessionData.isActiveUserSession())
         {
            class_14.log("Trying to set state to user feedback, but no active user session");
            return;
         }
         _sessionData.activeWindow = "user_feedback";
         openWindow(onUserFeedbackEvent,false);
         _window.findChildByName("guide_name_link").caption = _sessionData.guideName;
      }
      
      private function onUserFeedbackEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "guide_name_link":
               _habboHelp.sendMessage(new class_313(_sessionData.guideId));
               _habboHelp.trackGoogle("guideHelp","undefined_clickProfile");
               break;
            case "report_guide_link":
               tryOpeningReportWindow();
               _habboHelp.trackGoogle("guideHelp","undefined_clickReport");
               break;
            case "positive_button":
               _habboHelp.sendMessage(new class_730(true));
               _habboHelp.trackGoogle("guideHelp","undefined_clickPositiveFeedback");
               closeWindow();
               break;
            case "negative_button":
               _habboHelp.sendMessage(new class_730(false));
               _habboHelp.trackGoogle("guideHelp","undefined_clickNegativeFeedback");
               closeWindow();
         }
      }
      
      private function setStateUserThanks() : void
      {
         if(!_sessionData.isActiveUserSession())
         {
            class_14.log("Trying to set state to user thanks, but no active user session");
            return;
         }
         _sessionData.activeWindow = "user_thanks";
         openWindow(onUserThanksEvent,true);
      }
      
      private function onUserThanksEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
            case "close_button":
               setStateClosed(false);
         }
      }
      
      private function setStateGuardianChatReviewAccept(param1:int) : void
      {
         _sessionData.activeWindow = "guardian_chat_review_accept";
         openWindow(onGuardianChatReviewAcceptEvent,false);
         _habboHelp.soundManager.playSound("HBST_guide_request");
         var _loc2_:class_3332 = class_3217(_window.findChildByName("countdown")).widget as class_3332;
         _loc2_.seconds = param1;
         _loc2_.running = true;
      }
      
      private function onGuardianChatReviewAcceptEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "skip_link":
               _habboHelp.sendMessage(new class_343(false));
               setStateClosed(true);
               break;
            case "accept_button":
               _habboHelp.sendMessage(new class_343(true));
               setStateGuardianChatReviewWaitForOtherVoters();
         }
      }
      
      private function setStateGuardianChatReviewWaitForOtherVoters() : void
      {
         _sessionData.activeWindow = "guardian_chat_review_wait_for_voters";
         openWindow(onGuardianChatReviewWaitForOtherVotersEvent,false);
         startWaitingAnimation(_window.findChildByName("waiting_animation") as IStaticBitmapWrapperWindow,"help_chat_review_progress_big",4);
      }
      
      private function onGuardianChatReviewWaitForOtherVotersEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || param1.type != "WME_CLICK")
         {
            return;
         }
         var _loc3_:* = param2.name;
         if("close_link" === _loc3_)
         {
            _habboHelp.sendMessage(new class_954());
            setStateClosed(true);
         }
      }
      
      private function setStateGuardianChatReviewVote(param1:int, param2:String) : void
      {
         var _loc18_:Date = null;
         var _loc15_:Array = null;
         var _loc12_:int = 0;
         var _loc10_:String = null;
         var _loc5_:* = false;
         var _loc11_:String = null;
         _sessionData.activeWindow = "guardian_chat_review_vote";
         openWindow(onGuardianChatReviewVoteEvent,false);
         var _loc7_:class_3332;
         (_loc7_ = class_3217(_window.findChildByName("countdown")).widget as class_3332).seconds = param1;
         _loc7_.running = true;
         var _loc3_:Array = param2.substr(0,param2.indexOf(";")).match(/\d+/g);
         if(_loc3_.length > 5)
         {
            _loc18_ = new Date(_loc3_[0],int(_loc3_[1]) - 1,_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5]);
         }
         else
         {
            _loc18_ = new Date();
         }
         var _loc16_:Number = (new Date().getTime() - _loc18_.getTime()) / 1000;
         _window.findChildByName("incident_time").caption = "(" + FriendlyTime.getFriendlyTime(_habboHelp.localization,_loc16_,".ago") + ")";
         var _loc4_:IItemListWindow = _window.findChildByName("chatlog") as IItemListWindow;
         var _loc8_:class_3127 = _window.findChildByName("reported_user_template");
         var _loc6_:class_3127 = _window.findChildByName("other_user_template");
         var _loc9_:class_3127 = _window.findChildByName("separator_template");
         _loc4_.removeListItems();
         var _loc14_:* = -1;
         var _loc13_:class_3151 = null;
         for each(var _loc17_ in param2.split("\r"))
         {
            if(_loc17_ != "")
            {
               _loc15_ = _loc17_.split(";",3);
               _loc12_ = 1;
               if(_loc15_.length >= 3)
               {
                  _loc12_ = int(_loc15_[1]);
                  _loc10_ = String(_loc15_[2]).replace("<","&lt;").replace(">","&gt;");
                  if(_loc12_ == _loc14_ && _loc13_ != null)
                  {
                     _loc13_.findChildByName("message").caption = _loc13_.findChildByName("message").caption + ("\n" + _loc10_);
                  }
                  else
                  {
                     _loc5_ = _loc12_ == 0;
                     _loc13_ = (_loc12_ == 0 ? _loc8_.clone() : _loc6_.clone()) as class_3151;
                     _loc11_ = String(_loc5_ ? _habboHelp.localization.getLocalization("guide.bully.request.guide.vote.perpetrator","") : String(_habboHelp.localization.getLocalizationWithParams("guide.bully.request.guide.vote.anonymous","%ID%","id",_loc12_.toString())));
                     _loc13_.findChildByName("message").caption = "<b>" + _loc11_ + ":</b> " + _loc10_;
                     _loc4_.addListItem(_loc13_);
                     _loc14_ = _loc12_;
                  }
               }
            }
         }
      }
      
      private function onGuardianChatReviewVoteEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc5_:String = null;
         var _loc6_:IRegionWindow = null;
         var _loc3_:String = null;
         var _loc4_:IStaticBitmapWrapperWindow = null;
         if(disposed || _window == null)
         {
            return;
         }
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "close_link":
                  _habboHelp.sendMessage(new class_954());
                  setStateClosed(true);
                  break;
               case "vote_ok":
                  _habboHelp.sendMessage(new class_408(0));
                  setStateGuardianChatReviewWaitForResults(0);
                  break;
               case "vote_bad":
                  _habboHelp.sendMessage(new class_408(1));
                  setStateGuardianChatReviewWaitForResults(1);
                  break;
               case "vote_very_bad":
                  _habboHelp.sendMessage(new class_408(2));
                  setStateGuardianChatReviewWaitForResults(2);
            }
         }
         else if(param2.type == 5 && param2.name.substr(0,5) == "vote_")
         {
            _loc5_ = param2.name.substr(5);
            _loc6_ = param2 as IRegionWindow;
            _loc3_ = "help_chat_review_vote_" + _loc5_;
            _loc4_ = _loc6_.getChildAt(0) as IStaticBitmapWrapperWindow;
            switch(param1.type)
            {
               case "WME_OVER":
                  _loc4_.id |= 1;
                  break;
               case "WME_OUT":
                  _loc4_.id &= -2;
                  break;
               case "WME_DOWN":
                  _loc4_.id |= 2;
                  break;
               case "WME_UP":
               case "WME_UP_OUTSIDE":
                  _loc4_.id &= -3;
            }
            switch(int(_loc4_.id) - 1)
            {
               case 0:
                  _loc4_.assetUri = _loc3_ + "_over";
                  break;
               case 2:
                  _loc4_.assetUri = _loc3_ + "_down";
                  break;
               default:
                  _loc4_.assetUri = _loc3_;
            }
         }
      }
      
      private function setStateGuardianChatReviewWaitForResults(param1:int) : void
      {
         _sessionData.activeWindow = "guardian_chat_review_wait_for_results";
         openWindow(onGuardianChatReviewWaitForResultsEvent,true);
         showOwnVote(param1);
      }
      
      private function onGuardianChatReviewWaitForResultsEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
            case "close_button":
               _habboHelp.sendMessage(new class_954());
               setStateClosed(true);
         }
      }
      
      private function setStateGuardianChatReviewResults(param1:int, param2:int, param3:Array) : void
      {
         _sessionData.activeWindow = "guardian_chat_review_results";
         openWindow(onGuardianChatReviewResultsEvent,true);
         var _loc4_:int = statusFromVote(param1);
         _window.findChildByName("result_text").caption = "${guide.bully.request.guide.results.outcome.undefined}";
         IStaticBitmapWrapperWindow(_window.findChildByName("result_image")).assetUri = "help_chat_review_decision_undefined";
         showOwnVote(param2);
         showStatus(_window.findChildByName("results") as IItemListWindow,param3);
      }
      
      private function onGuardianChatReviewResultsEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
            case "close_button":
               _habboHelp.sendMessage(new class_954());
               setStateClosed(true);
         }
      }
      
      private function showOwnVote(param1:int) : void
      {
         var _loc2_:int = statusFromVote(param1);
         _window.findChildByName("vote_text").caption = "${guide.bully.request.guide.results.outcome.undefined}";
         IStaticBitmapWrapperWindow(_window.findChildByName("vote_image")).assetUri = "help_chat_review_decision_undefined";
      }
      
      private function showStatus(param1:IItemListWindow, param2:Array) : void
      {
         var _loc3_:class_3151 = null;
         var _loc6_:int = 0;
         var _loc4_:class_3151 = null;
         var _loc7_:int = 0;
         var _loc5_:IStaticBitmapWrapperWindow = null;
         if(param1.numListItems < param2.length + 1)
         {
            _loc4_ = param1.getListItemAt(0) as class_3151;
            _loc6_ = 0;
            while(_loc6_ < param2.length)
            {
               _loc3_ = _loc4_.clone() as class_3151;
               param1.addListItem(_loc3_);
               _loc6_++;
            }
            _loc3_.findChildByName("vote_separator").dispose();
         }
         _loc6_ = 0;
         while(_loc6_ < param2.length)
         {
            _loc3_ = param1.getListItemAt(_loc6_ + 1) as class_3151;
            _loc7_ = int(param2[_loc6_]);
            _loc5_ = _loc3_.findChildByName("vote_image") as IStaticBitmapWrapperWindow;
            _loc3_.findChildByName("vote_text").caption = "${guide.bully.request.guide.results.outcome.undefined}";
            stopWaitingAnimation(_loc5_);
            switch(_loc7_)
            {
               case 0:
               case 5:
                  startWaitingAnimation(_loc5_,"help_chat_review_decision_undefined",2);
                  break;
               default:
                  _loc5_.assetUri = "help_chat_review_decision_undefined";
                  break;
            }
            _loc6_++;
         }
      }
      
      private function setStateClosedWithNotification(param1:String) : void
      {
         _habboHelp.windowManager.simpleAlert("${" + param1 + ".title}","${" + param1 + ".heading}","${" + param1 + ".message}");
         setStateClosed(true);
      }
      
      private function setStateError() : void
      {
         setOnDuty(false);
         _sessionData.activeWindow = "error_window";
         openWindow(onErrorWindowEvent,true);
      }
      
      private function onErrorWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
            case "close_button":
               setStateClosed(true);
         }
      }
      
      private function setStateRejected() : void
      {
         setOnDuty(false);
         _sessionData.activeWindow = "rejected_window";
         openWindow(onRejectedWindowEvent,true);
         if(false)
         {
            _window.caption = "${guide.help.request.no_tour_guides.title}";
            _window.findChildByName("heading").caption = "${guide.help.request.no_tour_guides.heading}";
            _window.findChildByName("message").caption = "${guide.help.request.no_tour_guides.message}";
         }
      }
      
      private function onRejectedWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || true || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
            case "close_button":
               setStateClosed(true);
         }
      }
      
      private function setStateClosed(param1:Boolean) : void
      {
         resetSessionData();
         closeWindow();
         if(_onDuty && !_habboHelp.sessionDataManager.isPerkAllowed("USE_GUIDE_TOOL"))
         {
            setOnDuty(false);
         }
         if(param1 && _onDuty)
         {
            setStateGuideTool();
         }
      }
      
      private function openWindow(param1:Function, param2:Boolean) : void
      {
         if(_disposed)
         {
            return;
         }
         if(_window != null)
         {
            closeWindow();
         }
         class_14.log("Opening window undefined");
         _window = _guideHelp.habboHelp.getXmlWindow(_sessionData.activeWindow) as class_3151;
         _window.position = _windowPosition;
         _window.procedure = param1;
         _window.findChildByName("header_button_close").visible = param2;
      }
      
      private function closeWindow() : void
      {
         if(_window != null)
         {
            class_14.log("Closing window: undefined");
            _windowPosition.x = Math.max(0,_window.position.x);
            _windowPosition.y = Math.max(0,_window.position.y);
            _window.dispose();
            _window = null;
         }
      }
      
      private function tryOpeningReportWindow() : void
      {
         _habboHelp.queryForPendingCallsForHelp(2);
      }
      
      public function openReportWindow() : void
      {
         if(var_1648 || _window == null)
         {
            return;
         }
         var _loc1_:class_3234 = _habboHelp.windowManager.getDesktop(0);
         var_1648 = class_3151(_habboHelp.getXmlWindow("report_window"));
         var_1648.procedure = onReportWindowEvent;
         var_1648.x = Math.max(0,Math.min(_loc1_.width - 0,NaN));
         var_1648.y = Math.max(0,_window.y);
      }
      
      private function closeReportWindow() : void
      {
         if(var_1648)
         {
            var_1648.dispose();
            var_1648 = null;
         }
      }
      
      private function onReportWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:String = null;
         if(disposed || !var_1648 || false || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
            case "cancel_link":
               _habboHelp.trackGoogle("guideHelp","undefined_clickClose");
               closeReportWindow();
               break;
            case "urgent_help_link":
               break;
            case "submit_button":
               _loc3_ = String(IIlluminaInputWidget(class_3217(var_1648.findChildByName("input_widget")).widget).message);
               if(_loc3_.length == 0)
               {
                  var_1648.findChildByName("report_error").visible = true;
                  IItemListWindow(var_1648.findChildByName("list")).arrangeListItems();
                  break;
               }
               _habboHelp.sendMessage(new class_310(_loc3_));
               _habboHelp.trackGoogle("guideHelp","undefined_clickReport");
               closeReportWindow();
               closeWindow();
               break;
         }
      }
      
      private function resetSessionData() : void
      {
         _sessionData = new com.sulake.habbo.help.guidehelp.GuideSessionData();
      }
      
      private function setOnDutyStatus(param1:Boolean) : void
      {
         var _loc2_:class_3176 = class_3176(_window.findChildByName("guide_tool_duty"));
         setOnDuty(param1);
         _loc2_.isSelected = param1;
         if(param1)
         {
            _loc2_.caption = _habboHelp.localization.getLocalization("guide.help.guide.tool.duty.on","");
         }
         else
         {
            _loc2_.caption = _habboHelp.localization.getLocalization("guide.help.guide.tool.duty.off","");
         }
         var _loc3_:class_3127 = _window.findChildByName("disabled_screen");
         if(_loc3_)
         {
            _loc3_.visible = param1;
         }
      }
      
      private function setCheckBoxValue(param1:String, param2:Boolean) : void
      {
         var _loc3_:class_3176 = _window.findChildByName(param1) as class_3176;
         if(_loc3_ != null)
         {
            _loc3_.isSelected = param2;
         }
      }
      
      private function getRequestTypeCaption(param1:int) : String
      {
         if(param1 == 2)
         {
            param1 = 0;
         }
         return _habboHelp.localization.getLocalization("guide.help.request.type." + param1,"");
      }
      
      private function addChatMessage(param1:int, param2:String, param3:String, param4:String, param5:Boolean, param6:int = 0, param7:* = null) : void
      {
         var _loc8_:IIlluminaChatBubbleWidget = null;
         var _loc9_:class_3151 = null;
         var _loc10_:class_3217;
         if((_loc10_ = getLastChatListItem()) != null && null != _loc10_.widget as IIlluminaChatBubbleWidget && _loc10_.name == "chat_msg_0")
         {
            _loc8_ = IIlluminaChatBubbleWidget(_loc10_.widget);
         }
         if(_loc8_ && _loc8_.userId == param1 && param6 == 0)
         {
            _loc8_.message = _loc8_.message + "\n" + param4;
            addItemAndUpdateChatList(null);
         }
         else
         {
            (_loc10_ = class_3217(_chatMsg.clone())).name = "chat_msg_" + param6;
            (_loc8_ = IIlluminaChatBubbleWidget(_loc10_.widget)).figure = param3;
            _loc8_.flipped = param5;
            _loc8_.message = param4;
            _loc8_.userName = param2;
            _loc8_.userId = param1;
            switch(param6 - 1)
            {
               case 0:
                  (_loc9_ = class_3151(class_3151(_loc10_.rootWindow).findChildByName("message_region"))).procedure = onChatMessageEvent;
                  _loc9_.setParamFlag(1,true);
                  _loc9_.id = param7;
                  ITextWindow(_loc9_.findChildByName("message")).underline = true;
            }
            addItemAndUpdateChatList(_loc10_);
         }
      }
      
      private function onChatMessageEvent(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || _window == null || param1.type != "WME_CLICK")
         {
            return;
         }
         _habboHelp.navigator.goToPrivateRoom(param2.id);
      }
      
      private function addItemAndUpdateChatList(param1:class_3127) : void
      {
         var _loc2_:IItemListWindow = IItemListWindow(_window.findChildByName("chat_list"));
         if(param1)
         {
            _loc2_.addListItemAt(param1,_loc2_.numListItems - 1);
         }
         _loc2_.scrollV = 1;
         _loc2_.arrangeListItems();
         resetTypingTimer();
      }
      
      private function addSystemMessage(param1:int, param2:String) : void
      {
         var _loc3_:class_3151 = null;
         if(!_sessionData.isOnGoingSession() || param2 == "")
         {
            return;
         }
         switch(param1 - 1)
         {
            case 0:
               _loc3_ = _chatMsgNotification.clone() as class_3151;
               _loc3_.findChildByName("content").caption = param2;
               addItemAndUpdateChatList(_loc3_);
               break;
            case 1:
               _loc3_ = var_4052.clone() as class_3151;
               _loc3_.findChildByName("content").caption = param2;
               addItemAndUpdateChatList(_loc3_);
               break;
            default:
               if(_sessionData.isActiveUserSession())
               {
                  addChatMessage(_sessionData.userId,_sessionData.userName,_sessionData.userFigure,param2,true,2);
                  break;
               }
               addChatMessage(_sessionData.guideId,_sessionData.guideName,_sessionData.guideFigure,param2,true,2);
               break;
         }
      }
      
      private function getLastChatListItem() : class_3217
      {
         if(_window == null || false)
         {
            return null;
         }
         var _loc1_:IItemListWindow = IItemListWindow(_window.findChildByName("chat_list"));
         if(_loc1_.numListItems > 1)
         {
            return _loc1_.getListItemAt(_loc1_.numListItems - 2) as class_3217;
         }
         return null;
      }
      
      public function onInput(param1:class_3217, param2:String) : void
      {
         if(param2.length > 0)
         {
            _habboHelp.sendMessage(new class_769(param2));
            IIlluminaInputWidget(param1.widget).message = "";
            resetTypingTimer();
         }
      }
      
      private function setOnDuty(param1:Boolean) : void
      {
         _onDuty = param1;
         _habboHelp.toolbar.onDuty = param1;
      }
      
      private function resetTypingTimer() : void
      {
         if(var_1883 != null)
         {
            var_1883.stop();
            var_1883 = null;
         }
         if(_window == null || false || true)
         {
            return;
         }
         var_1883 = new Timer(3000);
         var_1883.addEventListener("timer",onTypingTimer);
         var_1883.start();
         _lastMessageTypedLength = messageLength;
         displayPartnerIsTypingMessage(false);
      }
      
      private function get messageLength() : int
      {
         if(_window == null || false || true)
         {
            return 0;
         }
         var _loc1_:class_3217 = _window.findChildByName("input_widget") as class_3217;
         return _loc1_ != null ? IIlluminaInputWidget(_loc1_.widget).message.length : 0;
      }
      
      private function onTypingTimer(param1:TimerEvent) : void
      {
         if(_window == null || false || true)
         {
            return;
         }
         var _loc2_:* = _lastMessageTypedLength != 0;
         if(_lastTypingInfo != _loc2_)
         {
            _habboHelp.sendMessage(new class_825(_loc2_));
            _lastTypingInfo = _loc2_;
         }
         _lastMessageTypedLength = 0;
      }
      
      private function displayPartnerIsTypingMessage(param1:Boolean) : void
      {
         if(_window == null || false || true)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(_window.findChildByName("chat_list"));
         _loc2_.getListItemAt(_loc2_.numListItems - 1).blend = param1 ? 1 : 0;
      }
      
      private function onWaitingAnimationTimer(param1:TimerEvent) : void
      {
         var data:com.sulake.habbo.help.guidehelp.AnimationData;
         var event:TimerEvent = param1;
         var_1961 = var_1961.filter(function(param1:com.sulake.habbo.help.guidehelp.AnimationData, param2:int, param3:Vector.<com.sulake.habbo.help.guidehelp.AnimationData>):Boolean
         {
            return param1.window != null && !param1.window.disposed;
         });
         for each(data in var_1961)
         {
            setAnimationFrame(data);
         }
      }
      
      private function startWaitingAnimation(param1:IStaticBitmapWrapperWindow, param2:String, param3:int) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc4_:com.sulake.habbo.help.guidehelp.AnimationData = new com.sulake.habbo.help.guidehelp.AnimationData(param1,param2,param3);
         setAnimationFrame(_loc4_);
         var_1961.push(_loc4_);
      }
      
      private function setAnimationFrame(param1:com.sulake.habbo.help.guidehelp.AnimationData) : void
      {
         var _loc2_:int = 0 % param1.frameCount;
         param1.window.assetUri = param1.asset + "_" + (String(_loc2_ + 1));
      }
      
      private function stopWaitingAnimation(param1:IStaticBitmapWrapperWindow) : void
      {
         var window:IStaticBitmapWrapperWindow = param1;
         var_1961 = var_1961.filter(function(param1:com.sulake.habbo.help.guidehelp.AnimationData, param2:int, param3:Vector.<com.sulake.habbo.help.guidehelp.AnimationData>):Boolean
         {
            return param1.window != window;
         });
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var_3255 = getTimer();
      }
      
      private function onIdleCheckTimer(param1:TimerEvent) : void
      {
         if(_onDuty && getTimer() - var_3255 > _habboHelp.getInteger("guidetool.idle.timeout",300) * 1000)
         {
            _habboHelp.sendMessage(new class_318(false,var_2347,var_2363,var_2311));
         }
      }
   }
}
