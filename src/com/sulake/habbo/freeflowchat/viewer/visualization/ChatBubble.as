package com.sulake.habbo.freeflowchat.viewer.visualization
{
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.freeflowchat.data.ChatItem;
   import com.sulake.habbo.freeflowchat.viewer.enum.ChatBubbleWidth;
   import com.sulake.habbo.freeflowchat.viewer.visualization.style.class_3352;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class ChatBubble extends Sprite
   {
      
      public static const MAX_WIDTH_DEFAULT:uint = 300;
      
      public static const const_1088:int = 15;
      
      private static const ZERO_POINT:Point = new Point(0,0);
       
      
      private const DESKTOP_MARGIN_LEFT:int = 85;
      
      private const DESKTOP_MARGIN_RIGHT:int = 190;
      
      private const LINEAR_INTERPOLATION_MS:uint = 150;
      
      private const MAX_HEIGHT:uint = 108;
      
      private const const_719:int = 28;
      
      private const POINTER_MARGIN_RIGHT:int = 15;
      
      private var var_1460:HabboFreeFlowChat;
      
      private var var_1676:ChatItem;
      
      private var _background:Sprite;
      
      private var var_1786:Bitmap;
      
      private var var_2301:Bitmap;
      
      private var var_1468:TextField;
      
      private var _style:class_3352;
      
      private var var_2132:uint = 0;
      
      private var var_3984:uint;
      
      private var var_2444:int;
      
      private var var_2471:int;
      
      private var var_3972:int;
      
      private var var_3987:int;
      
      private var var_4190:Number;
      
      private var var_3785:Number;
      
      private var var_3387:Boolean = false;
      
      private var var_3357:int = 0;
      
      private var var_3191:int;
      
      private var var_4056:Boolean = false;
      
      private var _hasHitDesktopMargin:Boolean = false;
      
      private var var_1881:Sprite;
      
      public function ChatBubble(param1:ChatItem, param2:class_3352, param3:BitmapData, param4:String, param5:uint, param6:HabboFreeFlowChat, param7:int = -1, param8:Boolean = false, param9:int = -1)
      {
         var _loc21_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc14_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc20_:int = 0;
         var _loc23_:* = null;
         super();
         var_1460 = param6;
         var_1676 = param1;
         _style = param2;
         _background = param2.getNewBackgroundSprite(param5);
         var_1786 = param2.isAnonymous ? null : new Bitmap(param2.pointer);
         var_4056 = param8;
         var _loc22_:int = 300;
         if(param7 != -1)
         {
            _loc22_ = ChatBubbleWidth.accordingToRoomChatSetting(param7);
         }
         else if(param6.roomChatSettings)
         {
            _loc22_ = ChatBubbleWidth.accordingToRoomChatSetting(param6.roomChatSettings.bubbleWidth);
         }
         _loc22_ -= 15;
         this.cacheAsBitmap = true;
         var _loc12_:int = _loc22_ - param2.textFieldMargins.x - param2.textFieldMargins.width;
         var_1468 = new TextField();
         var_1468.width = _loc12_;
         var_1468.multiline = true;
         var_1468.wordWrap = true;
         var_1468.selectable = false;
         var_1468.thickness = -15;
         var_1468.sharpness = 80;
         var_1468.antiAliasType = "advanced";
         var_1468.embedFonts = true;
         var_1468.gridFitType = "pixel";
         var_1468.cacheAsBitmap = true;
         var_1468.defaultTextFormat = param2.textFormat;
         var_1468.styleSheet = _style.styleSheet;
         var_1468.addEventListener("link",onTextLinkEvent);
         var _loc11_:* = param1.chatType == 0;
         var _loc19_:* = param1.chatType == 2;
         var _loc13_:Boolean;
         if(_loc13_ = !_loc11_ && !_loc19_ && true)
         {
            var_1468.alpha = 0.6;
         }
         var _loc16_:String = (_loc16_ = (_loc16_ = (_loc13_ ? "<i>" : "") + (_style.isAnonymous ? "" : "<b>" + param4 + ": </b>")) + (_loc19_ ? "<b>" : "") + param1.text + (_loc19_ ? "</b>" : "")) + (_loc13_ ? "</i>" : "");
         if(param1.links == null || param1.links[0] == null)
         {
            var_1468.htmlText = _loc16_;
         }
         else
         {
            _loc24_ = -1;
            _loc25_ = [];
            _loc21_ = 0;
            while(_loc21_ < param1.links.length)
            {
               _loc14_ = String(param1.links[_loc21_][0][1]);
               _loc17_ = "<a href=\"" + _loc14_ + "\">" + _loc14_ + "</a>";
               _loc18_ = "{" + _loc21_ + "}";
               _loc24_ = (_loc20_ = param1.text.indexOf(_loc18_)) + _loc17_.length;
               _loc25_.push([_loc20_,_loc24_]);
               _loc16_ = _loc16_.replace(_loc18_,_loc17_);
               _loc21_++;
            }
            var_1468.htmlText = _loc16_;
         }
         var _loc15_:int = Math.min(_loc22_,var_1468.textWidth + param2.textFieldMargins.x + param2.textFieldMargins.width);
         var _loc10_:int = var_1468.textHeight + param2.textFieldMargins.y + param2.textFieldMargins.height;
         if(true)
         {
            _loc10_ = Math.min(108,_loc10_);
         }
         if(param9 != -1)
         {
            _loc10_ = Math.max(param9,_loc10_);
         }
         _loc15_ = Math.max(_loc15_,_background.width);
         _loc10_ = Math.max(_loc10_,_background.height);
         _background.width = _loc15_;
         _background.height = _loc10_;
         _background.x = 0;
         _background.y = 0;
         _background.cacheAsBitmap = true;
         addChild(_background);
         if(true)
         {
            var_1786.x = Math.max(28,Math.min(15,userRelativePosX));
            var_1786.y = _loc10_ - param2.pointerOffsetToBubbleBottom;
            addChild(var_1786);
         }
         if(param3 != null && param2.faceOffset != null)
         {
            if(param3.height > _loc10_)
            {
               (_loc23_ = new BitmapData(param3.width,_loc10_)).copyPixels(param3,new Rectangle(0,param3.height - _loc10_,param3.width,_loc10_),new Point(0,0));
            }
            else
            {
               _loc23_ = param3;
            }
            var_2301 = new Bitmap(_loc23_);
            var_2301.x = param2.faceOffset.x - _loc23_.width / 2;
            var_2301.y = Math.max(1,param2.faceOffset.y - _loc23_.height / 2);
            addChild(var_2301);
         }
         var_1468.width = Math.min(_loc12_,var_1468.textWidth + _style.textFieldMargins.width);
         var_1468.height = var_1468.textHeight + _style.textFieldMargins.height;
         var_1468.x = param2.textFieldMargins.x;
         var_1468.y = param2.textFieldMargins.y;
         addChild(var_1468);
         if(false)
         {
            var_1881 = new Sprite();
            var_1881.graphics.clear();
            var_1881.graphics.beginFill(16777215);
            var_1881.graphics.drawRect(0,0,NaN,108 - param2.textFieldMargins.height);
            var_1468.mask = var_1881;
            addChild(var_1881);
         }
         this.addEventListener("addedToStage",onAddedToStage);
      }
      
      public function dispose() : void
      {
         this.removeEventListener("addedToStage",onAddedToStage);
         this.removeEventListener("click",onMouseClick);
         if(var_1881)
         {
            removeChild(var_1881);
         }
         if(var_1468)
         {
            var_1468.removeEventListener("link",onTextLinkEvent);
         }
         removeChild(var_1468);
         if(var_2301 != null && false)
         {
            removeChild(var_2301);
         }
         if(var_1786 && false)
         {
            removeChild(var_1786);
         }
         removeChild(_background);
         var_1881 = null;
         var_1468 = null;
         var_2301 = null;
         var_1786 = null;
         _background = null;
         _style = null;
      }
      
      private function onTextLinkEvent(param1:TextEvent) : void
      {
         if(param1.text && param1.text.length > 0)
         {
            var_1460.context.createLinkEvent(param1.text);
         }
      }
      
      public function get displayedHeight() : Number
      {
         return _style.isSystemStyle ? height : Math.min(108,height);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.addEventListener("click",onMouseClick);
      }
      
      public function moveTo(param1:int, param2:int) : void
      {
         if(var_2444 != param1 || var_2471 != param2)
         {
            var_3984 = var_2132;
            var_3972 = proxyX;
            var_3987 = y;
            var_2444 = param1;
            var_2471 = param2;
            var_4190 = (param1 - proxyX) / 150;
            var_3785 = (param2 - y) / 150;
         }
      }
      
      public function warpTo(param1:int, param2:int) : void
      {
         var_2444 = param1;
         var_2471 = param2;
         proxyX = param1;
         y = param2;
         repositionPointer();
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = 0;
         var_2132 += param1;
         if(proxyX != var_2444 || y != var_2471)
         {
            _loc2_ = uint(var_2132 - var_3984);
            if(_loc2_ < 150)
            {
               proxyX = var_3972 + _loc2_ * var_4190;
               y = int(var_3987 + _loc2_ * var_3785);
            }
            else
            {
               proxyX = var_2444;
               y = var_2471;
            }
         }
         repositionPointer();
      }
      
      public function get proxyX() : int
      {
         return var_3191;
      }
      
      public function set proxyX(param1:int) : void
      {
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var_3191 = param1;
         if(var_4056 && stage)
         {
            _loc2_ = var_3191 + var_3357;
            _hasHitDesktopMargin = false;
            _loc3_ = -190 - width;
            if(_loc2_ > _loc3_)
            {
               _loc2_ = _loc3_;
               _hasHitDesktopMargin = true;
            }
            if(_loc2_ < 85)
            {
               _loc2_ = 85;
               _hasHitDesktopMargin = true;
            }
            x = _loc2_;
         }
         else
         {
            x = var_3191 + var_3357;
         }
      }
      
      public function repositionPointer() : void
      {
         if(var_1786 && false)
         {
            var_1786.x = Math.max(28,Math.min(-15,userRelativePosX));
            var_1786.y = 0 - 0;
         }
      }
      
      public function get readyToRecycle() : Boolean
      {
         return var_3387;
      }
      
      public function set readyToRecycle(param1:Boolean) : void
      {
         var_3387 = param1;
         if(param1)
         {
            this.removeEventListener("click",onMouseClick);
         }
      }
      
      public function get timeStamp() : uint
      {
         return var_1676.timeStamp;
      }
      
      public function set component(param1:HabboFreeFlowChat) : void
      {
         var_1460 = param1;
      }
      
      private function get userRelativePosX() : int
      {
         return 0 - this.x;
      }
      
      public function get userScreenPos() : Point
      {
         if(false)
         {
            if(var_1460.displayObject.stage == null)
            {
               return ZERO_POINT;
            }
            return new Point(var_1460.displayObject.stage.stageWidth / 2 + 0,500);
         }
         return var_1460.getScreenPointFromRoomLocation(var_1676.roomId,var_1676.userLocation);
      }
      
      public function get roomId() : int
      {
         return var_1676.roomId;
      }
      
      public function set roomPanOffsetX(param1:int) : void
      {
         if(var_3357 != param1)
         {
            var_3357 = param1;
            warpTo(var_2444,var_2471);
         }
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         if(_style && false)
         {
            return;
         }
         if(!var_1460.clickHasToPropagate(param1))
         {
            var_1460.selectAvatarWithChatItem(var_1676);
            param1.stopImmediatePropagation();
         }
      }
      
      public function get overlap() : Rectangle
      {
         return _style.overlap;
      }
      
      public function get hasHitDesktopMargin() : Boolean
      {
         return _hasHitDesktopMargin;
      }
      
      public function drawToBitmap(param1:BitmapData) : void
      {
         param1.draw(this);
      }
   }
}
