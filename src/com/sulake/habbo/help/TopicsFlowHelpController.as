package com.sulake.habbo.help
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextLinkWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.help.cfh.registry.chat.ChatRegistryItem;
   import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageRegistryItem;
   import com.sulake.habbo.help.cfh.registry.user.UserRegistryItem;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.IModalDialog;
   import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
   import com.sulake.habbo.window.widgets.class_3308;
   import package_36.class_1634;
   import package_36.class_1671;
   import package_69.class_292;
   import package_69.class_350;
   import package_69.class_360;
   import package_69.class_378;
   import package_69.class_454;
   import package_69.class_622;
   
   public class TopicsFlowHelpController implements class_13
   {
      
      private static const START_CONTAINER:String = "start_container";
      
      private static const HELP_CONTAINER:String = "help_container";
      
      private static const USERS_CONTAINER:String = "users_container";
      
      private static const USER_CONTAINER:String = "user";
      
      private static const REASON_CONTAINER:String = "reason_container";
      
      private static const TOPIC_CONTAINER:String = "topic_container";
      
      private static const MESSAGE_CONTAINER:String = "message_container";
      
      private static const CHAT_CONTAINER:String = "chat_container";
      
      private static const BACK_BUTTON:String = "back_button";
      
      private static const SUMMARY_CONTAINER:String = "summary_container";
      
      private static const CONTINUE_BUTTON:String = "continue_button";
      
      private static const REQUIRES_CONTINUE_BUTTON:Array = ["users_container","message_container","chat_container"];
      
      private static const REQUIRES_USER_DATA:Array = ["reason_container","message_container","chat_container","summary_container"];
      
      private static const FIELD_MAX_CHARS:int = 253;
      
      private static const TOPIC_NAME_BULLYING:String = "bullying";
      
      private static const TOPIC_NAME_BAD_USER_NAME:String = "habbo_name";
       
      
      private var _habboHelp:com.sulake.habbo.help.HabboHelp;
      
      private var _disposed:Boolean = false;
      
      private var var_1921:IModalDialog;
      
      private var var_1430:class_3151;
      
      private var _containers:Vector.<String>;
      
      private var var_2282:IItemListWindow;
      
      private var var_1709:IItemListWindow;
      
      private var var_2289:IItemListWindow;
      
      private var var_4192:class_3151;
      
      private var var_3309:class_3151;
      
      private var var_3632:class_3151;
      
      private var var_1950:String = "start_container";
      
      private var var_1827:class_1671;
      
      private var var_357:String;
      
      private var _reportedUserName:String;
      
      private var var_1954:int = -1;
      
      private var var_3887:Boolean = false;
      
      public function TopicsFlowHelpController(param1:com.sulake.habbo.help.HabboHelp)
      {
         super();
         _habboHelp = param1;
         _containers = new Vector.<String>(0);
         _containers.push("start_container","help_container","users_container","user","reason_container","message_container","chat_container","back_button","summary_container");
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         closeWindow();
         _habboHelp = null;
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function openReportingUserName() : void
      {
         var_3887 = true;
         showReportingDialog(-1,false);
         var_1827 = getTopic("habbo_name");
         var_1430.findChildByName("message_phase_title").caption = _habboHelp.localization.getLocalization("generic.reason") + " " + _habboHelp.localization.getLocalization("help.cfh.topic.undefined");
         showContainer("message_container");
      }
      
      public function openReportingChatLineSelection() : void
      {
         showReportingDialog(-1,true);
         if(!userChatLinesAvailable())
         {
            return;
         }
         showContainer("chat_container");
         populateChatMessage();
      }
      
      public function openReportingContentReasonCategory(param1:int) : Boolean
      {
         showReportingDialog(param1,false);
         var _loc2_:Boolean = showReasons(param1);
         if(!_loc2_)
         {
            closeWindow();
         }
         return _loc2_;
      }
      
      public function openReportingIMSelection() : void
      {
         showReportingDialog(3,false);
         showContainer("chat_container");
         populateInstantMessages();
         if(false)
         {
            _habboHelp.windowManager.alertWithModal("${generic.alert.title}","${help.cfh.error.no_user_data}",0,null);
            closeWindow();
         }
      }
      
      private function showReportingDialog(param1:int, param2:Boolean) : void
      {
         var_1954 = param1;
         if(var_1921 == null)
         {
            openWindow();
         }
         var_1430.findChildByName("change_user").visible = param2;
      }
      
      private function openWindow() : void
      {
         if(var_1921 == null && !disposed)
         {
            var_1921 = _habboHelp.getModalXmlWindow("topics_flow_help");
            var_1921.rootWindow.procedure = windowEventProcedure;
            var_1430 = var_1921.rootWindow as class_3151;
            var_2282 = var_1430.findChildByName("user_list") as IItemListWindow;
            var_1709 = var_1430.findChildByName("reason_list") as IItemListWindow;
            var_2289 = var_1430.findChildByName("chat_list") as IItemListWindow;
            var_4192 = var_2282.getListItemAt(0) as class_3151;
            var_3309 = var_1709.getListItemAt(0) as class_3151;
            var_3632 = var_2289.getListItemAt(0) as class_3151;
            var_2282.removeListItems();
            var_1709.removeListItems();
            var_2289.removeListItems();
            IIlluminaInputWidget(class_3217(var_1430.findChildByName("help_message")).widget).maxChars = 253;
            deselectChatEntries();
         }
      }
      
      public function closeWindow() : void
      {
         if(var_1921 != null)
         {
            var_1921.dispose();
            var_1921 = null;
         }
         var_1950 = "start_container";
      }
      
      public function toggleWindow() : void
      {
         if(var_1921 == null)
         {
            var_1954 = -1;
            openWindow();
            showContainer("start_container");
         }
         else
         {
            closeWindow();
         }
      }
      
      private function showContainer(param1:String) : void
      {
         for each(var _loc2_ in _containers)
         {
            var_1430.findChildByName(_loc2_).visible = false;
         }
         var_1430.findChildByName("continue_button").visible = REQUIRES_CONTINUE_BUTTON.indexOf(param1) > -1;
         var_1430.findChildByName("user").visible = REQUIRES_USER_DATA.indexOf(param1) > -1;
         var_1950 = param1;
         updateBackButtonVisibility();
         var_1430.findChildByName(param1).visible = true;
         if(REQUIRES_USER_DATA.indexOf(param1) > -1)
         {
            updateUserData();
         }
      }
      
      private function updateBackButtonVisibility() : void
      {
         var _loc1_:* = true;
         if(var_1950 == "start_container")
         {
            _loc1_ = false;
         }
         else if(var_1954 == 3)
         {
            _loc1_ = var_1950 != "chat_container";
         }
         else if(var_1954 > -1)
         {
            _loc1_ = var_1950 != "reason_container";
         }
         else if(var_3887)
         {
            _loc1_ = var_1950 != "message_container";
         }
         var_1430.findChildByName("back_button").visible = _loc1_;
      }
      
      private function verifyUserSelected() : Boolean
      {
         if(false)
         {
            _habboHelp.windowManager.alertWithModal("${generic.alert.title}","${guide.bully.request.usermissing}",0,null);
            return false;
         }
         return true;
      }
      
      private function verifyMessage() : Boolean
      {
         var_357 = IIlluminaInputWidget(class_3217(var_1430.findChildByName("help_message")).widget).message;
         if(var_357 == null || var_357 == "")
         {
            _habboHelp.windowManager.alertWithModal("${generic.alert.title}","${help.cfh.error.nomsg}",0,null);
            return false;
         }
         if(var_357.length < _habboHelp.getInteger("help.cfh.length.minimum",15))
         {
            _habboHelp.windowManager.alertWithModal("${generic.alert.title}","${help.cfh.error.msgtooshort}",0,null);
            return false;
         }
         return true;
      }
      
      private function verifySelectedChatLines() : Boolean
      {
         var _loc1_:Array = _habboHelp.callForHelpManager.chatReportController.collectSelectedEntries(var_1954,_habboHelp.reportedUserId);
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _habboHelp.windowManager.alertWithModal("${generic.alert.title}","${help.cfh.error.chatmissing}",0,null);
            return false;
         }
         return true;
      }
      
      private function windowEventProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || param1.type != "WME_CLICK")
         {
            return;
         }
         loop0:
         switch(param2.name)
         {
            case "header_button_close":
               closeWindow();
               break;
            case "back_button":
               switch(var_1950)
               {
                  case "reason_container":
                     showContainer("chat_container");
                     break loop0;
                  case "topic_container":
                  case "message_container":
                     break;
                  case "chat_container":
                     if(populateUsers())
                     {
                        showContainer("users_container");
                        break loop0;
                     }
                     showContainer("start_container");
                     break loop0;
                  case "summary_container":
                     showContainer("message_container");
                     break loop0;
                  default:
                     showContainer("start_container");
               }
               showContainer("reason_container");
               populateReasons();
               break;
            case "continue_button":
               switch(var_1950)
               {
                  case "users_container":
                     if(verifyUserSelected())
                     {
                        showContainer("chat_container");
                        populateChatMessage();
                        break loop0;
                     }
                     break loop0;
                  case "message_container":
                     if(verifyMessage())
                     {
                        showContainer("summary_container");
                        break loop0;
                     }
                     break loop0;
                  case "chat_container":
                     if(verifySelectedChatLines())
                     {
                        showContainer("reason_container");
                        populateReasons();
                        break loop0;
                     }
                     break loop0;
                  default:
                     showContainer("start_container");
               }
               break;
            case "button_habbo_help":
               showContainer("help_container");
               break;
            case "button_user_report":
            case "change_user":
               if(populateUsers())
               {
                  showContainer("users_container");
                  break;
               }
               _habboHelp.windowManager.alertWithModal("${generic.alert.title}","${help.cfh.error.nochathistory}",0,null);
               break;
            case "button_account":
               HabboWebTools.openWebPage(_habboHelp.getProperty("zendesk.url"),"habboMain");
               _habboHelp.trackGoogle("helpWindow","click_selfHelp");
               closeWindow();
               break;
            case "tour_button":
               _habboHelp.guideHelpManager.createHelpRequest(_habboHelp.newIdentity ? 0 : 2);
               _habboHelp.trackGoogle("helpWindow","click_userTour");
               closeWindow();
               break;
            case "bully_button":
               closeWindow();
               _habboHelp.toggleNewHelpWindow();
               _habboHelp.trackGoogle("helpWindow","click_reportBully");
               break;
            case "instructions_button":
               _habboHelp.guideHelpManager.createHelpRequest(1);
               _habboHelp.trackGoogle("helpWindow","click_instructions");
               closeWindow();
               break;
            case "safetybooklet_link":
               _habboHelp.showSafetyBooklet();
               _habboHelp.trackGoogle("helpWindow","click_showSafetyBooklet");
               closeWindow();
               break;
            case "habboway_link":
               if(_habboHelp.getBoolean("habboway.enabled"))
               {
                  _habboHelp.showHabboWay();
               }
               else
               {
                  HabboWebTools.openWebPage(_habboHelp.getProperty("habboway.url"),"habboMain");
               }
               _habboHelp.trackGoogle("helpWindow","click_habboWay");
               closeWindow();
               break;
            case "faq_link":
               _habboHelp.openCfhFaq();
               break;
            case "sanction_info_link":
               _habboHelp.requestSanctionInfo(false);
               closeWindow();
               break;
            case "submit_button":
               if(var_1827)
               {
                  submitCallForHelp(true);
                  closeWindow();
                  break;
               }
               _habboHelp.windowManager.alertWithModal("${generic.alert.title}","${help.cfh.error.notopic}",0,null);
               break;
         }
      }
      
      public function submitCallForHelp(param1:Boolean) : void
      {
         if(!var_357 || !var_1827 || !_habboHelp)
         {
            return;
         }
         _habboHelp.ignoreAndUnfriendReportedUser();
         switch(var_1954 - 3)
         {
            case 0:
               _habboHelp.sendMessage(new class_622(var_357,var_1827.id,_habboHelp.reportedUserId,_habboHelp.callForHelpManager.chatReportController.collectSelectedEntries(3,_habboHelp.reportedUserId)));
               break;
            case 1:
               _habboHelp.sendMessage(new class_350(var_357,var_1827.id,-1,_habboHelp.reportedRoomId,[]));
               break;
            case 4:
               _habboHelp.sendMessage(new class_360(_habboHelp.callForHelpManager.reportedGroupId,_habboHelp.callForHelpManager.reportedThreadId,var_1827.id,var_357));
               break;
            case 5:
               _habboHelp.sendMessage(new class_378(_habboHelp.callForHelpManager.reportedGroupId,_habboHelp.callForHelpManager.reportedThreadId,_habboHelp.callForHelpManager.reportedMessageId,var_1827.id,var_357));
               break;
            case 6:
               _habboHelp.sendMessage(new class_454(_habboHelp.reportedExtraDataId,_habboHelp.reportedRoomId,_habboHelp.reportedUserId,var_1827.id,_habboHelp.reportedRoomObjectId));
               break;
            default:
               if(param1 && false && _habboHelp.getBoolean("guides.enabled") && false)
               {
                  _habboHelp.sendMessage(new class_292(_habboHelp.reportedUserId,_habboHelp.reportedRoomId));
                  break;
               }
               _habboHelp.sendMessage(new class_350(var_357,var_1827.id,_habboHelp.reportedUserId,_habboHelp.reportedRoomId,_habboHelp.callForHelpManager.chatReportController.collectSelectedEntries(1,-1)));
               break;
         }
      }
      
      private function populateUsers() : Boolean
      {
         var _loc5_:* = undefined;
         var _loc1_:class_3151 = null;
         var _loc2_:* = false;
         var_2282.removeListItems();
         var _loc3_:int = 0;
         var _loc6_:Boolean = false;
         for each(var _loc4_ in _habboHelp.userRegistry.getRegistry())
         {
            if((_loc5_ = _habboHelp.chatRegistry.getItemsByUser(_loc4_.userId)).length != 0)
            {
               _loc1_ = var_4192.clone() as class_3151;
               _loc2_ = _loc4_.userId == _habboHelp.reportedUserId;
               _loc1_.name = _loc4_.userId.toString();
               _loc1_.findChildByName("user_bg").blend = _loc2_ ? 1 : 0;
               _loc1_.procedure = onUserSelectEvent;
               _loc1_.findChildByName("user_name").caption = _loc4_.userName;
               _loc1_.findChildByName("room_name").id = _loc4_.roomId;
               if(_loc2_)
               {
                  _habboHelp.reportedRoomId = _loc4_.roomId;
               }
               _loc1_.findChildByName("room_name").caption = _loc4_.roomName != "" ? _habboHelp.localization.getLocalizationWithParams("help.emergency.main.step.two.room.name","","room_name",_loc4_.roomName) : "";
               class_3308(class_3217(_loc1_.findChildByName("user_avatar")).widget).figure = _loc4_.figure;
               var_2282.addListItemAt(_loc1_,_loc3_);
               if(_loc2_)
               {
                  _loc3_ = 1;
                  _loc6_ = true;
               }
            }
         }
         if(!_loc6_)
         {
            _habboHelp.reportedUserId = -1;
            _habboHelp.reportedRoomId = -1;
         }
         return false;
      }
      
      private function refreshUserList() : void
      {
         var _loc2_:int = 0;
         var _loc1_:class_3151 = null;
         _loc2_ = 0;
         while(_loc2_ < var_2282.numListItems)
         {
            _loc1_ = class_3151(var_2282.getListItemAt(_loc2_));
            _loc1_.findChildByName("user_bg").blend = int(_loc1_.name) == _habboHelp.reportedUserId ? 1 : 0;
            _loc2_++;
         }
      }
      
      private function onUserSelectEvent(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            selectUserToReport(param2 as class_3151);
         }
      }
      
      private function selectUserToReport(param1:class_3151) : void
      {
         var _loc2_:int = int(param1.name);
         _habboHelp.reportedUserId = _loc2_;
         _habboHelp.reportedRoomId = param1.findChildByName("room_name").id;
         refreshUserList();
      }
      
      private function populateRoomReportButton() : void
      {
         var_1709.destroyListItems();
         var _loc3_:int = 0;
         var_1709.height = 0;
         var_1709.height = _loc3_;
         var _loc4_:class_3151 = var_3309.clone() as class_3151;
         _habboHelp.localization.registerParameter("help.cfh.topic.34","name",_reportedUserName);
         var _loc1_:ITextWindow = _loc4_.findChildByName("name") as ITextWindow;
         _loc1_.caption = "${help.cfh.topic.34}";
         if(_loc1_.height < _loc1_.textHeight)
         {
            _loc1_.height = _loc1_.textHeight + 5;
         }
         if(_loc4_.height < _loc1_.height + _loc1_.y * 2 + 5)
         {
            _loc4_.height = _loc1_.height + _loc1_.y * 2 + 5;
         }
         _loc4_.name = "inappropiate_room_group_event";
         _loc4_.addEventListener("WME_CLICK",onReportTopic);
         var_1709.addListItem(_loc4_);
      }
      
      private function populateReasons() : void
      {
         var _loc1_:class_3151 = null;
         var_1709.destroyListItems();
         for each(var _loc2_ in _habboHelp.callForHelpCategories)
         {
            _loc1_ = var_3309.clone() as class_3151;
            _loc1_.findChildByName("name").caption = "${help.cfh.reason." + _loc2_.name + "}";
            _loc1_.name = _loc2_.name;
            _loc1_.addEventListener("WME_CLICK",populateTopicsEvent);
            var_1709.addListItem(_loc1_);
         }
      }
      
      private function populateTopicsEvent(param1:class_3134) : void
      {
         var _loc2_:class_3127 = param1.target;
         populateTopics(_loc2_.name);
      }
      
      private function populateTopics(param1:String) : Boolean
      {
         var _loc5_:* = undefined;
         var _loc3_:int = 0;
         var _loc4_:class_3151 = null;
         var _loc2_:ITextWindow = null;
         for each(var _loc7_ in _habboHelp.callForHelpCategories)
         {
            if(_loc7_.name == param1)
            {
               _loc5_ = _loc7_.topics;
               break;
            }
         }
         if(_loc5_ && _loc5_.length > 0)
         {
            var_1709.destroyListItems();
            _loc3_ = 0;
            var_1709.height = 0;
            var_1709.height = _loc3_;
            for each(var _loc6_ in _loc5_)
            {
               _loc4_ = var_3309.clone() as class_3151;
               _habboHelp.localization.registerParameter("help.cfh.topic." + _loc6_.id,"name",_reportedUserName);
               _loc2_ = _loc4_.findChildByName("name") as ITextWindow;
               _loc2_.caption = "${help.cfh.topic." + _loc6_.id + "}";
               if(_loc2_.height < _loc2_.textHeight)
               {
                  _loc2_.height = _loc2_.textHeight + 5;
               }
               if(_loc4_.height < _loc2_.height + _loc2_.y * 2 + 5)
               {
                  _loc4_.height = _loc2_.height + _loc2_.y * 2 + 5;
               }
               _loc4_.name = _loc6_.name;
               _loc4_.addEventListener("WME_CLICK",onReportTopic);
               var_1709.addListItem(_loc4_);
            }
            var_1950 = "topic_container";
            updateBackButtonVisibility();
            return true;
         }
         return false;
      }
      
      private function populateChatMessage() : void
      {
         var _loc1_:class_3151 = null;
         var _loc2_:ITextLinkWindow = null;
         var _loc3_:class_3176 = null;
         var_2289.removeListItems();
         _habboHelp.chatRegistry.holdPurges = true;
         var _loc4_:Vector.<ChatRegistryItem> = _habboHelp.reportedUserId > 0 ? _habboHelp.chatRegistry.getItemsByUser(_habboHelp.reportedUserId) : _habboHelp.chatRegistry.getItems();
         class_14.log("Found chat items: " + _loc4_.length + " from user:" + _habboHelp.reportedUserId);
         for each(var _loc5_ in _loc4_)
         {
            if(_loc5_.userId != _habboHelp.ownUserId)
            {
               _loc1_ = var_3632.clone() as class_3151;
               _loc2_ = _loc1_.findChildByName("chat_text") as ITextLinkWindow;
               _loc2_.caption = _loc5_.text;
               if(_loc2_.height < _loc2_.textHeight)
               {
                  _loc2_.height = _loc2_.textHeight + 5;
               }
               if(_loc1_.height < _loc2_.height + _loc2_.y * 2)
               {
                  _loc1_.height = _loc2_.height + _loc2_.y * 2;
               }
               _loc1_.id = _loc5_.index;
               _loc1_.procedure = onChatEntryEvent;
               _loc3_ = _loc1_.findChildByName("chat_check") as class_3176;
               _loc3_.isSelected = _loc5_.selected;
               var_2289.addListItem(_loc1_);
            }
         }
      }
      
      private function deselectChatEntries() : void
      {
         for each(var _loc2_ in _habboHelp.instantMessageRegistry.getItems())
         {
            for each(var _loc3_ in _loc2_)
            {
               _loc3_.selected = false;
            }
         }
         for each(var _loc1_ in _habboHelp.chatRegistry.getItems())
         {
            _loc1_.selected = false;
         }
      }
      
      private function onChatEntryEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         var _loc4_:class_3176 = null;
         var _loc5_:ChatRegistryItem = null;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = param2.id;
            if(param2 is ITextLinkWindow)
            {
               _loc3_ = param2.parent.id;
               _loc4_ = (param2.parent as class_3151).findChildByName("chat_check") as class_3176;
            }
            if(param2 is class_3176)
            {
               _loc3_ = param2.parent.id;
               _loc4_ = param2 as class_3176;
            }
            if(!(_loc5_ = _habboHelp.chatRegistry.getItem(_loc3_)))
            {
               return;
            }
            if(!_loc5_.selected && _loc5_.roomId != _habboHelp.reportedRoomId)
            {
               _habboHelp.reportedRoomId = _loc5_.roomId;
            }
            _loc5_.selected = !_loc5_.selected;
            _loc4_.isSelected = _loc5_.selected;
         }
      }
      
      private function populateInstantMessages() : void
      {
         var _loc1_:class_3151 = null;
         var _loc2_:class_3176 = null;
         var_2289.removeListItems();
         _habboHelp.instantMessageRegistry.holdPurges = true;
         var _loc3_:Vector.<InstantMessageRegistryItem> = _habboHelp.instantMessageRegistry.getItemsByUser(_habboHelp.reportedUserId);
         for each(var _loc4_ in _loc3_)
         {
            _loc1_ = var_3632.clone() as class_3151;
            _loc1_.findChildByName("chat_text").caption = _loc4_.text;
            _loc1_.id = _loc4_.index;
            _loc1_.procedure = onInstantMessageEntryEvent;
            _loc2_ = _loc1_.findChildByName("chat_check") as class_3176;
            _loc2_.isSelected = _loc4_.selected;
            var_2289.addListItem(_loc1_);
         }
      }
      
      private function onInstantMessageEntryEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         var _loc4_:class_3176 = null;
         var _loc5_:InstantMessageRegistryItem = null;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = param2.id;
            if(param2 is ITextLinkWindow)
            {
               _loc3_ = param2.parent.id;
               _loc4_ = (param2.parent as class_3151).findChildByName("chat_check") as class_3176;
            }
            else if(param2 is class_3176)
            {
               _loc3_ = param2.parent.id;
               _loc4_ = param2 as class_3176;
            }
            if(_loc5_ = _habboHelp.instantMessageRegistry.getItem(_habboHelp.reportedUserId,_loc3_))
            {
               _loc5_.selected = !_loc5_.selected;
               _loc4_.isSelected = _loc5_.selected;
            }
         }
      }
      
      private function onReportTopic(param1:class_3134 = null) : void
      {
         if(var_1921 == null)
         {
            openWindow();
         }
         var_1827 = getTopic(param1.target.name);
         showContainer("message_container");
      }
      
      private function isNotNeededToSelectUser() : Boolean
      {
         return var_1954 == 4 || var_1954 == 7 || var_1954 == 8;
      }
      
      private function showReasons(param1:int) : Boolean
      {
         if(isNotNeededToSelectUser() || verifyUserSelected())
         {
            showContainer("reason_container");
            if(param1 == 4)
            {
               populateRoomReportButton();
            }
            else
            {
               populateReasons();
            }
            return true;
         }
         return false;
      }
      
      private function userChatLinesAvailable() : Boolean
      {
         populateUsers();
         if(true)
         {
            _habboHelp.windowManager.alertWithModal("${generic.alert.title}","${help.cfh.error.no_user_data}",0,null);
            closeWindow();
            return false;
         }
         return true;
      }
      
      private function getTopic(param1:String) : class_1671
      {
         for each(var _loc3_ in _habboHelp.callForHelpCategories)
         {
            for each(var _loc2_ in _loc3_.topics)
            {
               if(_loc2_.name == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      private function updateUserData() : void
      {
         var _loc1_:UserRegistryItem = null;
         switch(var_1954 - 4)
         {
            case 0:
               var_1430.findChildByName("reported_user_avatar").visible = false;
               var_1430.findChildByName("user_info_title").visible = false;
               var_1430.findChildByName("reported_user_name").caption = _habboHelp.callForHelpManager.reportedRoomName;
               break;
            case 3:
            case 4:
               var_1430.findChildByName("reported_user_avatar").visible = false;
               var_1430.findChildByName("user_info_title").visible = false;
               var_1430.findChildByName("reported_user_name").visible = false;
               break;
            default:
               if(false)
               {
                  _loc1_ = _habboHelp.userRegistry.getEntry(_habboHelp.reportedUserId);
                  if(_loc1_)
                  {
                     _reportedUserName = _loc1_.userName;
                     class_3308(class_3217(var_1430.findChildByName("reported_user_avatar")).widget).figure = _loc1_.figure;
                  }
                  else
                  {
                     var_1430.findChildByName("reported_user_avatar").visible = false;
                     _reportedUserName = _habboHelp.reportedUserName;
                  }
                  var_1430.findChildByName("reported_user_name").caption = _reportedUserName;
                  break;
               }
         }
      }
   }
}
