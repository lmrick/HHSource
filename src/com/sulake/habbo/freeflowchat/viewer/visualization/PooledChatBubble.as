package com.sulake.habbo.freeflowchat.viewer.visualization
{
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.freeflowchat.data.ChatItem;
   import com.sulake.habbo.freeflowchat.viewer.enum.ChatBubbleWidth;
   import com.sulake.habbo.freeflowchat.viewer.visualization.style.class_3352;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class PooledChatBubble extends Sprite
   {
      
      public static const MAX_WIDTH_DEFAULT:uint = 300;
      
      private static const ZERO_POINT:Point = new Point(0,0);
       
      
      private const DESKTOP_MARGIN_LEFT:int = 85;
      
      private const DESKTOP_MARGIN_RIGHT:int = 190;
      
      private const LINEAR_INTERPOLATION_MS:uint = 150;
      
      private const MAX_HEIGHT:uint = 108;
      
      private const const_719:int = 28;
      
      private const POINTER_MARGIN_RIGHT:int = 15;
      
      private const POINTER_REPOSITION_INTERVAL_MS:int = 2000;
      
      private var var_1460:HabboFreeFlowChat;
      
      private var var_1676:ChatItem;
      
      private var _background:Sprite;
      
      private var var_1786:Bitmap;
      
      private var var_2301:Bitmap;
      
      private var var_2286:BitmapData;
      
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
      
      private var var_3242:uint = 0;
      
      private var var_1753:int = -1;
      
      public function PooledChatBubble(param1:HabboFreeFlowChat)
      {
         super();
         var_1460 = param1;
         var_1786 = new Bitmap();
         var_2301 = new Bitmap();
         var_1468 = new TextField();
         var_1881 = new Sprite();
         this.addEventListener("addedToStage",onAddedToStage);
         this.addEventListener("removedFromStage",onRemovedFromStage);
      }
      
      public function set chatItem(param1:ChatItem) : void
      {
         var_1676 = param1;
      }
      
      public function set face(param1:BitmapData) : void
      {
         var_2286 = param1;
      }
      
      public function set style(param1:class_3352) : void
      {
         _style = param1;
      }
      
      public function recreate(param1:String, param2:uint, param3:Boolean = false, param4:int = -1) : void
      {
         var _loc10_:int = 0;
         var _loc14_:int = 0;
         var _loc16_:* = null;
         var _loc15_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc8_:int = 0;
         var _loc12_:BitmapData = null;
         _background = _style.getNewBackgroundSprite(param2);
         var_1786.bitmapData = _style.pointer;
         var_4056 = param3;
         var _loc9_:int = (int(!!var_1460.roomChatSettings ? ChatBubbleWidth.accordingToRoomChatSetting(var_1460.roomChatSettings.bubbleWidth) : 300)) - _style.textFieldMargins.x - _style.textFieldMargins.width;
         var_1468.width = _loc9_;
         var_1468.multiline = true;
         var_1468.wordWrap = true;
         var_1468.selectable = false;
         var_1468.thickness = -15;
         var_1468.sharpness = 80;
         var_1468.antiAliasType = "advanced";
         var_1468.embedFonts = true;
         var_1468.gridFitType = "pixel";
         var_1468.cacheAsBitmap = true;
         var_1468.styleSheet = null;
         var_1468.defaultTextFormat = _style.textFormat;
         var_1468.styleSheet = _style.styleSheet;
         var_1468.addEventListener("link",onTextLinkEvent);
         var _loc7_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc13_:Boolean;
         if(_loc13_ = !_loc7_ && !_loc6_ && true)
         {
            var_1468.alpha = 0.6;
         }
         else
         {
            var_1468.alpha = 1;
         }
         var _loc18_:String = (_loc18_ = (_loc18_ = (_loc13_ ? "<i>" : "") + (_style.isAnonymous ? "" : "<b>" + param1 + ": </b>")) + (_loc6_ ? "<b>" : "") + var_1676.text + (_loc6_ ? "</b>" : "")) + (_loc13_ ? "</i>" : "");
         if(true || var_1676.links[0] == null)
         {
            var_1468.htmlText = _loc18_;
         }
         else
         {
            _loc14_ = -1;
            _loc16_ = [];
            _loc10_ = 0;
            while(_loc10_ < var_1676.links.length)
            {
               _loc15_ = String(var_1676.links[_loc10_][0][1]);
               _loc19_ = "<a href=\"" + _loc15_ + "\">" + _loc15_ + "</a>";
               _loc20_ = "{" + _loc10_ + "}";
               _loc14_ = (_loc8_ = var_1676.text.indexOf(_loc20_)) + _loc19_.length;
               _loc16_.push([_loc8_,_loc14_]);
               _loc18_ = _loc18_.replace(_loc20_,_loc19_);
               _loc10_++;
            }
            var_1468.htmlText = _loc18_;
         }
         var_1753 = param4;
         var _loc17_:int = Math.min(300,var_1468.textWidth + _style.textFieldMargins.x + _style.textFieldMargins.width);
         var _loc5_:int = var_1468.textHeight + _style.textFieldMargins.y + _style.textFieldMargins.height;
         if(true)
         {
            _loc5_ = Math.min(108,_loc5_);
         }
         if(param4 != -1)
         {
            _loc5_ = Math.max(param4,_loc5_);
         }
         _loc17_ = Math.max(_loc17_,_background.width);
         _loc5_ = Math.max(_loc5_,_background.height);
         _background.width = _loc17_;
         _background.height = _loc5_;
         _background.x = 0;
         _background.y = 0;
         _background.cacheAsBitmap = true;
         addChild(_background);
         if(true)
         {
            var_1786.x = Math.max(28,Math.min(15,userRelativePosX));
            var_1786.y = _loc5_ - 0;
            addChild(var_1786);
         }
         if(var_2286 != null && false)
         {
            if(var_2286.height > _loc5_)
            {
               (_loc12_ = new BitmapData(var_2286.width,_loc5_)).copyPixels(var_2286,new Rectangle(0,0 - _loc5_,var_2286.width,_loc5_),new Point(0,0));
            }
            else
            {
               _loc12_ = var_2286;
            }
            var_2301.bitmapData = _loc12_;
            var_2301.x = _style.faceOffset.x - _loc12_.width / 2;
            var_2301.y = Math.max(1,_style.faceOffset.y - _loc12_.height / 2);
            addChild(var_2301);
         }
         var_1468.width = Math.min(_loc9_,var_1468.textWidth + _style.textFieldMargins.width);
         var_1468.height = var_1468.textHeight + _style.textFieldMargins.height;
         var_1468.x = _style.textFieldMargins.x;
         var_1468.y = _style.textFieldMargins.y;
         addChild(var_1468);
         if(false)
         {
            var_1881.graphics.clear();
            var_1881.graphics.beginFill(16777215);
            var_1881.graphics.drawRect(0,0,NaN,108 - _style.textFieldMargins.height);
            var_1881.graphics.endFill();
            var_1468.mask = var_1881;
            addChild(var_1881);
            var_1881.x = var_1468.x;
            var_1881.y = var_1468.y;
         }
         else
         {
            var_1881.graphics.clear();
            var_1468.mask = null;
         }
         this.cacheAsBitmap = true;
         var_3387 = false;
         var_2132 = 0;
         var_3242 = 0;
         visible = false;
      }
      
      public function unregister() : void
      {
         this.cacheAsBitmap = false;
         this.removeEventListener("click",onMouseClick);
         if(false)
         {
            safelyRemoveChild(var_1881);
         }
         safelyRemoveChild(var_1468);
         if(false && false)
         {
            safelyRemoveChild(var_2301);
            var_2301.bitmapData = null;
         }
         if(var_1786 && false)
         {
            safelyRemoveChild(var_1786);
         }
         safelyRemoveChild(_background);
         if(var_1468)
         {
            var_1468.removeEventListener("link",onTextLinkEvent);
         }
      }
      
      private function onTextLinkEvent(param1:TextEvent) : void
      {
         var _loc7_:String = null;
         var _loc4_:String = null;
         var _loc3_:TextField = null;
         var _loc2_:Point = null;
         var _loc5_:Rectangle = null;
         var _loc6_:String = null;
         if(param1.text && param1.text.length > 0)
         {
            _loc7_ = param1.text;
            _loc4_ = "highlight/";
            if(_loc7_.indexOf(_loc4_) > -1)
            {
               _loc3_ = param1.target as TextField;
               _loc2_ = new Point(_loc3_.mouseX,_loc3_.mouseY);
               _loc2_ = _loc3_.localToGlobal(_loc2_);
               _loc5_ = new Rectangle(_loc2_.x,_loc2_.y);
               _loc6_ = _loc7_.substr(_loc7_.indexOf(_loc4_) + _loc4_.length,_loc7_.length);
               var_1460.windowManager.hideHint();
               var_1460.windowManager.showHint(_loc6_.toLocaleUpperCase(),_loc5_);
            }
            else
            {
               var_1460.context.createLinkEvent(param1.text);
            }
         }
      }
      
      private function safelyRemoveChild(param1:DisplayObject) : void
      {
         try
         {
            removeChild(param1);
         }
         catch(error:ArgumentError)
         {
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
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this.removeEventListener("click",onMouseClick);
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
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = 0;
         var_2132 += param1;
         if(proxyX != var_2444 || y != var_2471)
         {
            _loc2_ = uint(var_2132 - var_3984);
            if(_loc2_ < 150 && _loc2_ > 0)
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
         if(var_2132 > var_3242 + 2000)
         {
            repositionPointer();
            var_3242 = var_2132;
         }
         if(var_2132 > 150 && !visible)
         {
            visible = true;
         }
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
      
      public function get minHeight() : int
      {
         return var_1753;
      }
   }
}
