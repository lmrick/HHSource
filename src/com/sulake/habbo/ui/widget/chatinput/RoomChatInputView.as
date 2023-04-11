package com.sulake.habbo.ui.widget.chatinput
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3309;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.freeflowchat.style.class_3383;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleSelector;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatTypingMessage;
   import com.sulake.room.utils.RoomEnterEffect;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class RoomChatInputView
   {
      
      private static const MARGIN_H:int = 12;
      
      private static const CHAT_HELP_INTERNAL_CLIENT_LINK:String = "habbopages/chat/commands";
       
      
      private var var_1429:com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;
      
      private var _window:class_3151;
      
      private var var_1437:ITextFieldWindow;
      
      private var var_3730:class_3127;
      
      private var var_2746:class_3127;
      
      private var _helpButton:class_3309;
      
      private var _helpButtonShowRegion:IRegionWindow;
      
      private var _mouseOverHelpButton:Boolean = false;
      
      private var var_1491:class_3151;
      
      private var var_3944:class_3151;
      
      private var _chatModeIdShout:String;
      
      private var var_3005:String;
      
      private var var_3963:String;
      
      private var var_3131:Boolean = false;
      
      private var var_4062:TextFormat;
      
      private var var_418:Boolean = false;
      
      private var var_2748:Boolean = false;
      
      private var var_1883:Timer;
      
      private var var_1917:Timer;
      
      private var var_1636:Timer;
      
      private var var_1750:String = "";
      
      private var var_1876:Timer;
      
      private var var_3615:Boolean = false;
      
      private var var_1770:Timer;
      
      private var var_3317:int = 0;
      
      private var var_2122:Timer;
      
      private var var_2247:ChatStyleSelector;
      
      public function RoomChatInputView(param1:com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget)
      {
         var _loc3_:class_19 = null;
         var _loc2_:int = 0;
         super();
         var_1429 = param1;
         var_3005 = param1.localizations.getLocalization("widgets.chatinput.mode.whisper",":tell");
         _chatModeIdShout = param1.localizations.getLocalization("widgets.chatinput.mode.shout",":shout");
         var_3963 = param1.localizations.getLocalization("widgets.chatinput.mode.speak",":speak");
         var_1883 = new Timer(1000,1);
         var_1883.addEventListener("timerComplete",onTypingTimerComplete);
         var_1917 = new Timer(10000,1);
         var_1917.addEventListener("timerComplete",onIdleTimerComplete);
         var_3615 = false || false;
         if(var_3615)
         {
            _loc3_ = param1.handler.container.config;
            if(_loc3_.getProperty("nux.chat.reminder.shown") != "1")
            {
               _loc2_ = int(_loc3_.getInteger("nux.noob.chat.reminder.delay",240));
               var_1636 = new Timer(_loc2_ * 1000,1);
               var_1636.addEventListener("timerComplete",onNuxIdleTimerComplete);
               var_1636.start();
            }
         }
         var_4062 = new TextFormat(null,null,10066329,null,true,false);
         createWindow();
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      public function dispose() : void
      {
         if(var_3615)
         {
            widget.windowManager.hideHint();
            widget.windowManager.unregisterHintWindow("nux_chat_reminder");
         }
         var_1429 = null;
         if(var_1437)
         {
            var_1437.removeEventListener("WME_DOWN",windowMouseEventProcessor);
            var_1437.removeEventListener("WKE_KEY_DOWN",windowKeyEventProcessor);
            var_1437.removeEventListener("WKE_KEY_UP",keyUpHandler);
            var_1437.removeEventListener("WE_CHANGE",onInputChanged);
            var_1437.removeEventListener("WME_OVER",onInputHoverRegionMouseEvent);
            var_1437.removeEventListener("WME_OUT",onInputHoverRegionMouseEvent);
            var_1437 = null;
         }
         var_3730 = null;
         var_2746 = null;
         if(_helpButton)
         {
            _helpButton.removeEventListener("WME_CLICK",onHelpButtonMouseEvent);
            _helpButton.removeEventListener("WME_OVER",onHelpButtonMouseEvent);
            _helpButton.removeEventListener("WME_OUT",onHelpButtonMouseEvent);
            _helpButton = null;
         }
         if(_helpButtonShowRegion)
         {
            _helpButtonShowRegion.removeEventListener("WME_OVER",onInputHoverRegionMouseEvent);
            _helpButtonShowRegion.removeEventListener("WME_OUT",onInputHoverRegionMouseEvent);
            _helpButtonShowRegion = null;
         }
         if(var_1491 != null)
         {
            var_1491.dispose();
            var_1491 = null;
         }
         if(var_1883 != null)
         {
            var_1883.reset();
            var_1883.removeEventListener("timerComplete",onTypingTimerComplete);
            var_1883 = null;
         }
         if(var_1917 != null)
         {
            var_1917.reset();
            var_1917.removeEventListener("timerComplete",onIdleTimerComplete);
            var_1917 = null;
         }
         if(var_1636 != null)
         {
            var_1636.reset();
            var_1636.removeEventListener("timerComplete",onNuxIdleTimerComplete);
            var_1636 = null;
         }
         if(var_1770 != null)
         {
            var_1770.reset();
            var_1770.removeEventListener("timerComplete",onChatReminderTimer);
            var_1770 = null;
         }
         if(var_1876)
         {
            var_1876.reset();
            var_1876.removeEventListener("timerComplete",onRemoveDimmer);
            var_1876 = null;
         }
         if(_window && false)
         {
            _window.desktop.removeChild(_window);
         }
      }
      
      private function createWindow() : void
      {
         var _loc1_:* = null;
         var _loc2_:Array = null;
         var _loc3_:Boolean = false;
         var _loc7_:class_3383 = null;
         if(var_1491 != null)
         {
            return;
         }
         var _loc5_:XmlAsset;
         if((_loc5_ = var_1429.assets.getAssetByName("chatinput_window_new") as XmlAsset) == null || _loc5_.content == null)
         {
            return;
         }
         _window = var_1429.windowManager.buildFromXML(_loc5_.content as XML) as class_3151;
         _window.width = _window.desktop.width;
         _window.height = _window.desktop.height;
         _window.invalidate();
         var_3944 = class_3151(_window.findChildByName("chatstyles_menu"));
         var_1491 = _window.findChildByName("bubblecont") as class_3151;
         var_1491.tags.push("room_widget_chatinput");
         var_1437 = var_1491.findChildByName("chat_input") as ITextFieldWindow;
         var_3730 = var_1491.findChildByName("input_border");
         var_2746 = var_1491.findChildByName("block_text");
         _helpButtonShowRegion = IRegionWindow(var_1491.findChildByName("helpbutton_show_hover_region"));
         _helpButtonShowRegion.addEventListener("WME_OVER",onInputHoverRegionMouseEvent);
         _helpButtonShowRegion.addEventListener("WME_OUT",onInputHoverRegionMouseEvent);
         updatePosition();
         var_1437.setParamFlag(1,true);
         var_1437.addEventListener("WME_DOWN",windowMouseEventProcessor);
         var_1437.addEventListener("WKE_KEY_DOWN",windowKeyEventProcessor);
         var_1437.addEventListener("WKE_KEY_UP",keyUpHandler);
         var_1437.addEventListener("WE_CHANGE",onInputChanged);
         var_1437.addEventListener("WME_OVER",onInputHoverRegionMouseEvent);
         var_1437.addEventListener("WME_OUT",onInputHoverRegionMouseEvent);
         var_1437.toolTipDelay = 0;
         var_1437.toolTipIsDynamic = true;
         var_3131 = true;
         var_1437.setTextFormat(var_4062);
         var_1750 = "";
         _window.addEventListener("WE_PARENT_RESIZED",updatePosition);
         _window.addEventListener("WE_PARENT_ADDED",updatePosition);
         if(customChatStylesEnabled() && !var_1429.handler.container.roomSession.isGameSession && var_1429.handler.container.freeFlowChat != null && var_1429.handler.container.freeFlowChat.chatStyleLibrary != null)
         {
            _loc1_ = [];
            _loc2_ = var_1429.roomUi.getProperty("disabled.custom.chat.styles").split(",");
            _loc3_ = var_1429.handler.container.sessionDataManager.hasSecurity(4);
            for each(var _loc4_ in var_1429.handler.container.freeFlowChat.chatStyleLibrary.getStyleIds())
            {
               _loc7_ = var_1429.handler.container.freeFlowChat.chatStyleLibrary.getStyle(_loc4_);
               if(!(!_loc3_ && isNftChatStyle(_loc4_)))
               {
                  if(!_loc7_.isSystemStyle && _loc2_.indexOf(_loc4_.toString()) == -1)
                  {
                     if(_loc7_.isHcOnly && var_1429.handler.container.sessionDataManager.hasClub)
                     {
                        _loc1_.push(_loc4_);
                     }
                     else if(!_loc7_.isHcOnly && !_loc7_.isAmbassadorOnly)
                     {
                        _loc1_.push(_loc4_);
                     }
                  }
                  if(_loc7_.isStaffOverrideable && _loc3_)
                  {
                     _loc1_.push(_loc4_);
                  }
                  if(_loc7_.isAmbassadorOnly && (_loc3_ || var_1429.handler.container.sessionDataManager.isAmbassador))
                  {
                     _loc1_.push(_loc4_);
                  }
               }
            }
            removeDuplicateStyles(_loc1_);
            createChatStyleSelectorMenuItems(_loc1_);
         }
         else if(var_1491.findChildByName("chat_input_container") is IItemListWindow)
         {
            IItemListWindow(var_1491.findChildByName("chat_input_container")).removeListItemAt(0);
         }
         createAndAttachDimmerWindow();
         _helpButton = class_3309(_window.findChildByName("helpbutton"));
         _helpButton.addEventListener("WME_CLICK",onHelpButtonMouseEvent);
         _helpButton.addEventListener("WME_OVER",onHelpButtonMouseEvent);
         _helpButton.addEventListener("WME_OUT",onHelpButtonMouseEvent);
         _helpButton.visible = false;
      }
      
      private function removeDuplicateStyles(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length - 1)
         {
            _loc3_ = _loc2_ + 1;
            while(_loc3_ < param1.length)
            {
               if(param1[_loc2_] === param1[_loc3_])
               {
                  param1.splice(_loc3_--,1);
               }
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      private function isNftChatStyle(param1:int) : Boolean
      {
         return param1 >= 1000;
      }
      
      private function customChatStylesEnabled() : Boolean
      {
         return var_1429.roomUi.getBoolean("custom.chat.styles.enabled");
      }
      
      private function createAndAttachDimmerWindow() : void
      {
         var _loc1_:class_3127 = null;
         if(RoomEnterEffect.isRunning())
         {
            _loc1_ = var_1429.windowManager.createWindow("chat_dimmer","",30,1,2177,new Rectangle(0,0,var_1491.width,var_1491.height),null,0);
            _loc1_.color = 0;
            _loc1_.blend = 0.3;
            var_1491.addChild(_loc1_);
            var_1491.invalidate();
            if(var_1876 == null)
            {
               var_1876 = new Timer(RoomEnterEffect.totalRunningTime,1);
               var_1876.addEventListener("timerComplete",onRemoveDimmer);
               var_1876.start();
            }
         }
      }
      
      private function onRemoveDimmer(param1:TimerEvent) : void
      {
         var_1876.removeEventListener("timerComplete",onRemoveDimmer);
         var_1876 = null;
         var _loc2_:class_3127 = var_1491.findChildByName("chat_dimmer");
         if(_loc2_ != null)
         {
            var_1491.removeChild(_loc2_);
            var_1429.windowManager.destroy(_loc2_);
         }
      }
      
      public function updatePosition(param1:class_3134 = null, param2:int = 10000, param3:int = 10000) : void
      {
         _window.width = _window.desktop.width;
         _window.height = _window.desktop.height;
         var _loc9_:Point = new Point();
         if(!var_1491)
         {
            return;
         }
         var _loc4_:int = widget.getToolBarWidth();
         var _loc6_:int = widget.getFriendBarWidth();
         var _loc5_:int = _window.desktop.width / 2 - 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(_window.desktop.width - _loc4_ - _loc6_ > _loc8_)
         {
            _loc7_ = _loc4_ + 12;
            var_1491.y = _window.desktop.height - 104;
            if(_loc5_ + var_1491.width > _window.desktop.width - _loc6_)
            {
               _loc5_ = 0;
            }
         }
         else
         {
            _loc7_ = widget.getRoomToolsWidth() + 12;
            var_1491.y = _window.desktop.height - 160;
         }
         var_1491.x = Math.max(_loc5_,_loc7_);
         if(var_2247)
         {
            var_2247.alignMenuToSelector();
         }
      }
      
      private function onSend(param1:WindowMouseEvent) : void
      {
         if(!var_3131)
         {
            sendChatFromInputField();
         }
      }
      
      public function hideFloodBlocking() : void
      {
         var_1437.visible = true;
         var_2746.visible = false;
      }
      
      public function showFloodBlocking() : void
      {
         var_1437.visible = false;
         var_2746.visible = true;
      }
      
      public function updateBlockText(param1:int) : void
      {
         var_2746.caption = var_1429.localizations.registerParameter("chat.input.alert.flood","time",param1.toString());
      }
      
      public function displaySpecialChatMessage(param1:String, param2:String = "") : void
      {
         if(var_1491 == null || var_1437 == null)
         {
            return;
         }
         var_1437.enable();
         var_1437.selectable = true;
         var_1437.text = "";
         setInputFieldFocus();
         var_1437.text += param1 + " ";
         if(param2.length > 0)
         {
            var_1437.text += param2 + " ";
         }
         var_1437.setSelection(var_1437.text.length,var_1437.text.length);
         var_1750 = var_1437.text;
      }
      
      private function windowMouseEventProcessor(param1:class_3134 = null, param2:class_3127 = null) : void
      {
         setInputFieldFocus();
      }
      
      private function windowKeyEventProcessor(param1:class_3134 = null, param2:class_3127 = null) : void
      {
         var _loc7_:* = 0;
         var _loc3_:Boolean = false;
         var _loc6_:WindowKeyboardEvent = null;
         var _loc4_:KeyboardEvent = null;
         var _loc8_:String = null;
         var _loc5_:Array = null;
         if(var_1491 == null || var_1429 == null || false)
         {
            return;
         }
         if(anotherFieldHasFocus())
         {
            return;
         }
         setInputFieldFocus();
         if(param1 is WindowKeyboardEvent)
         {
            _loc7_ = (_loc6_ = param1 as WindowKeyboardEvent).charCode;
            _loc3_ = _loc6_.shiftKey;
         }
         if(param1 is KeyboardEvent)
         {
            _loc7_ = (_loc4_ = param1 as KeyboardEvent).charCode;
            _loc3_ = _loc4_.shiftKey;
         }
         if(_loc4_ == null && _loc6_ == null)
         {
            return;
         }
         if(_loc7_ == 32)
         {
            checkSpecialKeywordForInput();
         }
         if(_loc7_ == 13)
         {
            sendChatFromInputField(_loc3_);
            setButtonPressedState(true);
         }
         if(_loc7_ == 8)
         {
            if(var_1437 != null)
            {
               if((_loc5_ = (_loc8_ = "null").split(" "))[0] == var_3005 && _loc5_.length == 3 && _loc5_[2] == "")
               {
                  var_1437.text = "";
                  var_1750 = "";
               }
            }
         }
      }
      
      private function keyUpHandler(param1:WindowKeyboardEvent) : void
      {
         if(param1.keyCode == 13)
         {
            setButtonPressedState(false);
         }
      }
      
      private function setButtonPressedState(param1:Boolean) : void
      {
      }
      
      private function onInputChanged(param1:class_3134) : void
      {
         var _loc2_:ITextFieldWindow = param1.window as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var_1917.reset();
         var _loc3_:* = _loc2_.text.length == 0;
         if(_loc3_)
         {
            var_418 = false;
            var_1883.start();
         }
         else
         {
            if(_loc2_.text.length > NaN)
            {
               if(false)
               {
                  var_1429.setLastPasteTime();
               }
               else
               {
                  _loc2_.text = "";
               }
            }
            var_1750 = _loc2_.text;
            if(!var_418)
            {
               var_418 = true;
               var_1883.reset();
               var_1883.start();
            }
            var_1917.start();
            if(var_1636 != null)
            {
               var_1636.reset();
               var_1636 = null;
            }
         }
      }
      
      private function checkSpecialKeywordForInput() : void
      {
         if(var_1437 == null || false)
         {
            return;
         }
         var _loc2_:String = "null";
         var _loc1_:String = "null";
         if(_loc2_ == var_3005)
         {
            if(_loc1_.length > 0)
            {
               var_1437.text = "undefined undefined";
               var_1437.setSelection(var_1437.text.length,var_1437.text.length);
               var_1750 = var_1437.text;
            }
         }
      }
      
      private function onIdleTimerComplete(param1:TimerEvent) : void
      {
         if(var_418)
         {
            var_2748 = false;
         }
         var_418 = false;
         sendTypingMessage();
      }
      
      private function onNuxIdleTimerComplete(param1:TimerEvent) : void
      {
         if(var_1636 != null)
         {
            var_1636.reset();
            var_1636.removeEventListener("timerComplete",onNuxIdleTimerComplete);
            var_1636 = null;
         }
         highlightChatInput();
      }
      
      private function onTypingTimerComplete(param1:TimerEvent) : void
      {
         if(var_418)
         {
            var_2748 = true;
         }
         sendTypingMessage();
      }
      
      private function sendTypingMessage() : void
      {
         if(var_1429 == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc1_:RoomWidgetChatTypingMessage = new RoomWidgetChatTypingMessage(var_418);
         var_1429.messageListener.processWidgetMessage(_loc1_);
      }
      
      private function highlightChatInput() : void
      {
         var_1437.text = widget.localizations.getLocalization("widgets.chatinput.mode.remind.noobie");
         var_1770 = new Timer(500);
         var_1770.addEventListener("timer",onChatReminderTimer);
         var_1770.start();
         widget.windowManager.registerHintWindow("nux_chat_reminder",var_1437);
         widget.windowManager.showHint("nux_chat_reminder");
      }
      
      private function onChatReminderTimer(param1:TimerEvent) : void
      {
         var_3317++;
         if(var_3317 % 2 != 0)
         {
            var_1429.mainWindow.y -= 1;
         }
         else
         {
            var_1429.mainWindow.y += 1;
         }
         if(var_3317 >= 10)
         {
            var_1770.reset();
            var_1770 = null;
            var_1429.mainWindow.y = 0;
            chatBarReminderShown();
         }
      }
      
      private function chatBarReminderShown() : void
      {
         widget.handler.container.config.setProperty("nux.chat.reminder.shown","1");
         if(var_1770 != null)
         {
            var_1770.reset();
         }
         widget.windowManager.hideHint();
         widget.windowManager.unregisterHintWindow("nux_chat_reminder");
      }
      
      private function setInputFieldFocus() : void
      {
         if(var_1437 == null)
         {
            return;
         }
         if(var_1770 != null)
         {
            chatBarReminderShown();
         }
         if(var_3131)
         {
            var_1437.text = "";
            var_1437.textColor = 0;
            var_1437.italic = false;
            var_3131 = false;
            var_1750 = "";
         }
         var_1437.focus();
      }
      
      public function setInputFieldColor(param1:uint) : void
      {
         if(var_1437 == null)
         {
            return;
         }
         var_1437.textColor = param1;
         var_1437.defaultTextFormat.color = param1;
      }
      
      private function sendChatFromInputField(param1:Boolean = false) : void
      {
         if(var_1437 == null || false)
         {
            return;
         }
         var _loc7_:int = param1 ? 2 : 0;
         var _loc6_:String;
         var _loc4_:Array = (_loc6_ = "null").split(" ");
         var _loc2_:String = "";
         var _loc5_:String = "";
         switch(_loc4_[0])
         {
            case var_3005:
               _loc7_ = 1;
               _loc2_ = String(_loc4_[1]);
               _loc5_ = var_3005 + " " + _loc2_ + " ";
               _loc4_.shift();
               _loc4_.shift();
               break;
            case _chatModeIdShout:
               _loc7_ = 2;
               _loc4_.shift();
               break;
            case var_3963:
               _loc7_ = 0;
               _loc4_.shift();
         }
         _loc6_ = _loc4_.join(" ");
         var _loc3_:int = 0;
         if(customChatStylesEnabled() && var_2247 != null)
         {
            _loc3_ = 0;
         }
         if(var_1429 != null)
         {
            if(false)
            {
               var_1883.reset();
            }
            if(false)
            {
               var_1917.reset();
            }
            var_1429.sendChat(_loc6_,_loc7_,_loc2_,_loc3_);
            var_418 = false;
            if(var_2748)
            {
               sendTypingMessage();
            }
            var_2748 = false;
         }
         if(var_1437 != null)
         {
            var_1437.text = _loc5_;
         }
         var_1750 = _loc5_;
      }
      
      private function anotherFieldHasFocus() : Boolean
      {
         var _loc3_:Stage = null;
         var _loc2_:InteractiveObject = null;
         if(var_1437 != null)
         {
            if(false)
            {
               return false;
            }
         }
         var _loc1_:DisplayObject = var_1491.context.getDesktopWindow().getDisplayObject();
         if(_loc1_ != null)
         {
            _loc3_ = _loc1_.stage;
            if(_loc3_ != null)
            {
               _loc2_ = _loc3_.focus;
               if(_loc2_ == null)
               {
                  return false;
               }
               if(_loc2_ is TextField)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return var_1429.handler.container.sessionDataManager;
      }
      
      private function createChatStyleSelectorMenuItems(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(!var_2247)
         {
            var_2247 = new ChatStyleSelector(this,class_3151(var_1491.findChildByName("styles")),sessionDataManager);
            var_2247.gridColumns = param1.length / 6 + 1;
         }
         _loc3_ = param1.length - 1;
         while(_loc3_ >= 0)
         {
            _loc2_ = int(param1[_loc3_]);
            var_2247.addItem(_loc2_,var_1429.handler.container.freeFlowChat.chatStyleLibrary.getStyle(_loc2_).selectorPreview);
            _loc3_--;
         }
         var_2247.initSelection();
      }
      
      public function get widget() : com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget
      {
         return var_1429;
      }
      
      public function get chatStyleMenuContainer() : class_3151
      {
         return var_3944;
      }
      
      public function getChatInputY() : int
      {
         if(!_window || !_window.findChildByName("chat_input_container"))
         {
            return 0;
         }
         var _loc1_:Point = new Point();
         _window.findChildByName("chat_input_container").getGlobalPosition(_loc1_);
         return _loc1_.y;
      }
      
      public function getChatWindowElements() : Array
      {
         return [var_1491,var_1437];
      }
      
      private function onHelpButtonMouseEvent(param1:WindowMouseEvent) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_1429.roomUi.context.createLinkEvent("habbopages/chat/commands");
         }
         if(param1.type == "WME_OVER")
         {
            _helpButton.visible = true;
            _mouseOverHelpButton = true;
            stopHelpButtonHideTimer();
         }
         else if(param1.type == "WME_OUT")
         {
            _mouseOverHelpButton = false;
            startHelpButtonHideTimer();
         }
      }
      
      private function onInputHoverRegionMouseEvent(param1:WindowMouseEvent) : void
      {
         if(param1.type == "WME_OVER")
         {
            _helpButton.visible = true;
            stopHelpButtonHideTimer();
         }
         else if(param1.type == "WME_OUT" && !_mouseOverHelpButton)
         {
            startHelpButtonHideTimer();
         }
      }
      
      private function startHelpButtonHideTimer() : void
      {
         if(var_2122 != null)
         {
            stopHelpButtonHideTimer();
         }
         var_2122 = new Timer(400);
         var_2122.addEventListener("timer",onHelpButtonHideTimer);
         var_2122.start();
      }
      
      private function onHelpButtonHideTimer(param1:TimerEvent) : void
      {
         if(!_mouseOverHelpButton && _helpButton)
         {
            _helpButton.visible = false;
         }
         stopHelpButtonHideTimer();
      }
      
      private function stopHelpButtonHideTimer() : void
      {
         if(!var_2122)
         {
            return;
         }
         var_2122.stop();
         var_2122.removeEventListener("timer",onHelpButtonHideTimer);
         var_2122 = null;
      }
   }
}
