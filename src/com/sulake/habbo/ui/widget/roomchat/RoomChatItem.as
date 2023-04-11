package com.sulake.habbo.ui.widget.roomchat
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public class RoomChatItem
   {
      
      public static const CHAT_ITEM_STACKING_HEIGHT:Number = 18;
      
      private static const MESSAGE_TEXT_MARGIN_LEFT:int = 6;
      
      private static const MESSAGE_TEXT_MARGIN_RIGHT:int = 6;
      
      private static const RESPECT_ICON_MARGIN_RIGHT:int = 35;
      
      private static const const_832:int = 26;
      
      private static const NAME:String = "name";
      
      private static const MESSAGE:String = "message";
      
      private static const POINTER:String = "pointer";
      
      private static const BACKGROUND:String = "background";
      
      private static const TOOLTIP_DRAG_FOR_HISTORY:String = "${chat.history.drag.tooltip}";
       
      
      private var var_1429:com.sulake.habbo.ui.widget.roomchat.RoomChatWidget;
      
      private var _windowManager:class_1684;
      
      private var var_44:class_18;
      
      private var _window:IRegionWindow;
      
      private var var_2029:class_21;
      
      private var var_247:String;
      
      private var var_3667:String;
      
      private var _aboveLevels:int = 0;
      
      private var var_4247:int = -1;
      
      private var var_1898:int;
      
      private var var_2598:int;
      
      private var var_1323:int;
      
      private var _senderName:String;
      
      private var var_357:String;
      
      private var var_1993:Array;
      
      private var var_2506:Array;
      
      private var var_912:int;
      
      private var var_3412:Number;
      
      private var var_1629:BitmapData;
      
      private var _senderColor:uint;
      
      private var var_354:int;
      
      private var var_876:int;
      
      private var var_3832:int;
      
      private var var_3058:int;
      
      private var _width:Number = 0;
      
      private var var_3202:Boolean = false;
      
      private var _topOffset:Number = 0;
      
      private var _originalBackgroundYOffset:Number = 0;
      
      private var var_29:Number = 0;
      
      private var var_28:Number = 0;
      
      private var var_3441:Boolean = false;
      
      public function RoomChatItem(param1:com.sulake.habbo.ui.widget.roomchat.RoomChatWidget, param2:class_1684, param3:class_21, param4:String, param5:class_18, param6:String)
      {
         _senderName = new String();
         var_357 = new String();
         super();
         var_1429 = param1;
         _windowManager = param2;
         var_2029 = param3;
         var_247 = param4;
         var_44 = param5;
         var_3667 = param6;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
            var_1429 = null;
            _windowManager = null;
            var_44 = null;
            var_1629 = null;
         }
      }
      
      public function define(param1:RoomWidgetChatUpdateEvent) : void
      {
         var_1898 = param1.chatType;
         var_2598 = param1.styleId;
         var_1323 = param1.userId;
         _senderName = param1.userName;
         var_3058 = param1.userCategory;
         var_357 = param1.text;
         var_1993 = param1.links;
         var_3412 = param1.userX;
         var_1629 = param1.userImage;
         _senderColor = param1.userColor;
         var_354 = param1.roomId;
         var_876 = param1.userType;
         var_3832 = param1.petType;
         renderView();
      }
      
      public function set message(param1:String) : void
      {
         var_357 = param1;
      }
      
      public function set senderName(param1:String) : void
      {
         _senderName = param1;
      }
      
      public function set senderImage(param1:BitmapData) : void
      {
         var_1629 = param1;
      }
      
      public function set senderColor(param1:uint) : void
      {
         _senderColor = param1;
      }
      
      public function set chatType(param1:int) : void
      {
         var_1898 = param1;
      }
      
      public function get view() : class_3151
      {
         return _window;
      }
      
      public function get screenLevel() : int
      {
         return var_4247;
      }
      
      public function get timeStamp() : int
      {
         return var_912;
      }
      
      public function get senderX() : Number
      {
         return var_3412;
      }
      
      public function set senderX(param1:Number) : void
      {
         var_3412 = param1;
      }
      
      public function get width() : Number
      {
         return _width;
      }
      
      public function get height() : Number
      {
         return 18;
      }
      
      public function get message() : String
      {
         return var_357;
      }
      
      public function get x() : Number
      {
         return var_29;
      }
      
      public function get y() : Number
      {
         return var_28;
      }
      
      public function get aboveLevels() : int
      {
         return _aboveLevels;
      }
      
      public function set aboveLevels(param1:int) : void
      {
         _aboveLevels = param1;
      }
      
      public function set screenLevel(param1:int) : void
      {
         var_4247 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_912 = param1;
      }
      
      public function set x(param1:Number) : void
      {
         var_29 = param1;
         if(_window != null)
         {
            _window.x = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         var_28 = param1;
         if(_window != null)
         {
            _window.y = param1 - _topOffset + _originalBackgroundYOffset;
         }
      }
      
      public function hidePointer() : void
      {
         var _loc1_:class_3127 = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("pointer");
            if(_loc1_)
            {
               _loc1_.visible = false;
            }
         }
      }
      
      public function setPointerOffset(param1:Number) : void
      {
         if(!_window || false)
         {
            return;
         }
         var _loc3_:class_3282 = _window.findChildByName("pointer") as class_3282;
         var _loc2_:class_3282 = _window.findChildByName("middle") as class_3282;
         if(_loc2_ == null || _loc3_ == null)
         {
            return;
         }
         _loc3_.visible = true;
         param1 += 0;
         param1 = Math.min(param1,_loc2_.rectangle.right - _loc3_.width);
         param1 = Math.max(param1,_loc2_.rectangle.left);
         _loc3_.x = param1;
      }
      
      public function checkOverlap(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Boolean
      {
         var _loc6_:Rectangle = new Rectangle(var_29,var_28,width,param1);
         var _loc7_:Rectangle = new Rectangle(param2,param3,param4,param5);
         return _loc6_.intersects(_loc7_);
      }
      
      public function hideView() : void
      {
         if(_window)
         {
            _window.dispose();
         }
         _window = null;
         var_3202 = false;
      }
      
      private function get isNotify() : Boolean
      {
         return var_2598 == 1;
      }
      
      public function renderView() : void
      {
         var _loc15_:class_3282 = null;
         var _loc14_:int = 0;
         var _loc12_:int = 0;
         var _loc16_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc2_:int = 0;
         var _loc20_:TextFormat = null;
         var _loc10_:Array = null;
         if(var_3202)
         {
            return;
         }
         var_3202 = true;
         if(_window)
         {
            return;
         }
         _window = com.sulake.habbo.ui.widget.roomchat.RoomChatWidget.chatBubbleFactory.getBubbleWindow(var_2598,var_1898);
         if(!_window)
         {
            return;
         }
         _window.toolTipIsDynamic = true;
         var _loc9_:class_3282 = _window.findChildByName("background") as class_3282;
         var _loc13_:ILabelWindow = _window.findChildByName("name") as ILabelWindow;
         var _loc5_:ITextWindow = _window.findChildByName("message") as ITextWindow;
         var _loc3_:class_3282 = _window.findChildByName("pointer") as class_3282;
         var _loc1_:Number = 0;
         var _loc19_:BitmapData = com.sulake.habbo.ui.widget.roomchat.RoomChatWidget.chatBubbleFactory.getPointerBitmapData(var_2598);
         _originalBackgroundYOffset = _loc9_.y;
         var _loc8_:int = _loc5_.x <= 26 ? 0 : _loc5_.x - 26;
         if(var_1629 != null)
         {
            _topOffset = Math.max(0,(0 - _loc9_.height) / 2);
            _loc1_ = Math.max(_loc1_,var_1629.height);
            _loc1_ = Math.max(_loc1_,_loc9_.height);
         }
         _width = 0;
         _window.x = var_29;
         _window.y = var_28;
         _window.width = 0;
         _window.height = _loc1_;
         enableDragTooltip();
         addEventListeners(_window);
         if(var_1629 && !isNotify)
         {
            if(_loc15_ = _window.findChildByName("user_image") as class_3282)
            {
               _loc15_.width = var_1629.width;
               _loc15_.height = var_1629.height;
               _loc15_.bitmap = var_1629;
               _loc15_.disposesBitmap = false;
               _loc14_ = _loc15_.x - 0;
               _loc12_ = Math.max(0,(_loc9_.height - 0) / 2);
               if(var_876 == 2)
               {
                  if(var_3832 == 15)
                  {
                     if(var_1629.height > _loc9_.height)
                     {
                        _loc12_ = (0 - _loc9_.height) / 2;
                     }
                  }
               }
               _loc15_.x = _loc14_;
               _loc15_.y += _loc12_;
               _width += _loc15_.x + var_1629.width;
            }
         }
         if(_loc13_ != null)
         {
            if(!isNotify)
            {
               _loc13_.text = _senderName + ": ";
               _loc13_.y += _topOffset;
               _loc13_.width = _loc13_.textWidth + 6;
            }
            else
            {
               _loc13_.text = "";
               _loc13_.width = 0;
            }
            _width += _loc13_.width;
         }
         if(var_1898 == 3)
         {
            _loc5_.text = var_44.registerParameter("widgets.chatbubble.respect","username",_senderName);
            _width = 35;
         }
         else if(var_1898 == 4)
         {
            _loc5_.text = var_44.registerParameter("widget.chatbubble.petrespect","petname",_senderName);
            _width = 35;
         }
         else if(var_1898 == 6)
         {
            _loc5_.text = var_44.registerParameter("widget.chatbubble.pettreat","petname",_senderName);
            _width = 35;
         }
         else if(var_1898 == 7)
         {
            _loc5_.text = message;
            _width = 35;
         }
         else if(var_1898 == 8)
         {
            _loc5_.text = message;
            _width = 35;
         }
         else if(var_1898 == 9)
         {
            _loc5_.text = message;
            _width = 35;
         }
         else if(var_1898 == 5)
         {
            _loc5_.text = message;
            _width = 35;
         }
         else if(var_1993 == null)
         {
            _loc5_.text = message;
         }
         else
         {
            var_2506 = [];
            _loc7_ = -1;
            _loc4_ = 0;
            while(_loc4_ < var_1993.length)
            {
               _loc17_ = String(var_1993[_loc4_][1]);
               _loc18_ = "{" + _loc4_ + "}";
               _loc2_ = var_357.indexOf(_loc18_);
               _loc7_ = _loc2_ + _loc17_.length;
               var_2506.push([_loc2_,_loc7_]);
               var_357 = var_357.replace(_loc18_,_loc17_);
               _loc4_++;
            }
            _loc5_.text = message;
            _loc5_.immediateClickMode = true;
            _loc5_.setParamFlag(16,false);
            _loc5_.setParamFlag(1073741824,true);
            _loc20_ = _loc5_.getTextFormat();
            switch(var_2598 - 2)
            {
               case 0:
                  _loc20_.color = 14540253;
                  break;
               default:
                  _loc20_.color = 2710438;
            }
            _loc20_.underline = true;
            _loc4_ = 0;
            while(_loc4_ < var_2506.length)
            {
               _loc10_ = var_2506[_loc4_];
               try
               {
                  _loc5_.setTextFormat(_loc20_,_loc10_[0],_loc10_[1]);
               }
               catch(e:RangeError)
               {
                  class_14.log("Chat message links were malformed. Could not set TextFormat");
               }
               _loc4_++;
            }
         }
         if(_loc5_.visible)
         {
            _loc5_.x = _width + _loc8_;
            if(_loc13_ != null)
            {
               _loc5_.x = _loc13_.x + _loc13_.width;
               if(_loc13_.width > 6)
               {
                  _loc5_.x -= 5;
               }
            }
            _loc5_.y += _topOffset;
            _loc16_ = _loc5_.textWidth;
            _loc5_.width = _loc16_ + 6;
            _width += _loc5_.width;
         }
         if(_loc3_ != null && Boolean(_loc3_.visible))
         {
            _loc3_.bitmap = _loc19_;
            _loc3_.disposesBitmap = false;
            _loc3_.x = _width / 2;
            _loc3_.y += _topOffset;
         }
         var _loc6_:int = int(_loc5_.width);
         if(_loc13_)
         {
            _loc6_ += _loc13_.width;
         }
         var _loc11_:BitmapData = com.sulake.habbo.ui.widget.roomchat.RoomChatWidget.chatBubbleFactory.buildBubbleImage(var_2598,var_1898,_loc6_,_loc9_.height,_senderColor);
         _window.width = _loc11_.width;
         _window.y = 0 - _topOffset;
         _window.y += _originalBackgroundYOffset;
         _width = _window.width;
         _loc9_.bitmap = _loc11_;
         _loc9_.y = _topOffset;
      }
      
      public function enableDragTooltip() : void
      {
         var_3441 = true;
         refreshTooltip();
      }
      
      public function disableDragTooltip() : void
      {
         var_3441 = false;
         refreshTooltip();
      }
      
      private function refreshTooltip() : void
      {
         if(_window == null)
         {
            return;
         }
         _window.toolTipCaption = "";
         if(false)
         {
            return;
         }
         if(var_3441)
         {
            _window.toolTipCaption = "${chat.history.drag.tooltip}";
         }
         _window.toolTipDelay = 500;
      }
      
      private function addEventListeners(param1:class_3151) : void
      {
         param1.setParamFlag(1,true);
         param1.addEventListener("WME_CLICK",onBubbleMouseClick);
         param1.addEventListener("WME_DOWN",onBubbleMouseDown);
         param1.addEventListener("WME_OVER",onBubbleMouseOver);
         param1.addEventListener("WME_OUT",onBubbleMouseOut);
         param1.addEventListener("WME_UP",onBubbleMouseUp);
      }
      
      private function testMessageLinkMouseClick(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc5_:int;
         var _loc4_:ITextWindow;
         if((_loc5_ = (_loc4_ = _window.getChildByName("message") as ITextWindow).getCharIndexAtPoint(param1 - _loc4_.x,param2 - _loc4_.y)) > -1)
         {
            _loc3_ = 0;
            while(_loc3_ < var_2506.length)
            {
               if(_loc5_ >= var_2506[_loc3_][0] && _loc5_ <= var_2506[_loc3_][1])
               {
                  if(var_1993[_loc3_][2] == 0)
                  {
                     HabboWebTools.openExternalLinkWarning(var_1993[_loc3_][0]);
                  }
                  else if(var_1993[_loc3_][2] == 1)
                  {
                     HabboWebTools.openWebPage(var_3667 + var_1993[_loc3_][0],"habboMain");
                  }
                  else
                  {
                     HabboWebTools.openWebPage(var_3667 + var_1993[_loc3_][0]);
                  }
                  return true;
               }
               _loc3_++;
            }
         }
         return false;
      }
      
      private function onBubbleMouseClick(param1:WindowMouseEvent) : void
      {
         if(var_1993 && false)
         {
            if(testMessageLinkMouseClick(param1.localX,param1.localY))
            {
               return;
            }
         }
         var_1429.onItemMouseClick(var_1323,_senderName,var_3058,var_354,param1);
      }
      
      private function onBubbleMouseDown(param1:WindowMouseEvent) : void
      {
         var_1429.onItemMouseDown(var_1323,var_3058,var_354,param1);
      }
      
      private function onBubbleMouseOver(param1:WindowMouseEvent) : void
      {
         var_1429.onItemMouseOver(var_1323,var_3058,var_354,param1);
      }
      
      private function onBubbleMouseOut(param1:WindowMouseEvent) : void
      {
         var_1429.onItemMouseOut(var_1323,var_3058,var_354,param1);
      }
      
      private function onBubbleMouseUp(param1:WindowMouseEvent) : void
      {
         var_1429.mouseUp();
      }
      
      public function get chatStyle() : int
      {
         return var_2598;
      }
      
      public function get originalBackgroundYOffset() : Number
      {
         return _originalBackgroundYOffset;
      }
   }
}
