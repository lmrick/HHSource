package com.sulake.habbo.ui.widget.roomchat
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.ChatWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.ui.widget.roomchat.style.ChatBubbleFactory;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.utils.RoomEnterEffect;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements class_41
   {
      
      private static var var_2076:ChatBubbleFactory = null;
      
      private static const CHAT_ITEM_LEVEL_HEIGHT:int = 19;
      
      private static const CHAT_ITEM_LEVEL_HEIGHT_SMALL:int = 10;
      
      private static const CHAT_ITEM_NONVISIBLE_MARGIN:int = 20;
      
      private static const CHAT_ITEM_REAL_HEIGHT:int = 32;
      
      private static const ANIMATION_STEP_INTERVAL_MS:int = 25;
      
      private static const ANIMATION_TIMEOUT_MS:int = 4000;
      
      private static const ANIMATION_TIMEOUT_SLOW_MS:int = 6000;
      
      private static const ANIMATION_STEP_PIXELS:int = 3;
      
      private static const MAX_BUFFER_SIZE:int = 1;
      
      private static const MAX_FAST_LEVELS_LORES:int = 8;
      
      private static const MAX_FAST_LEVELS_MIDRES:int = 10;
      
      private static const MAX_FAST_LEVELS_HIRES:int = 12;
      
      private static const MAX_SLOW_LEVELS:int = 0;
      
      private static const CHAT_AREA_HEIGHT_LORES:int = 171;
      
      private static const CHAT_AREA_HEIGHT_MIDRES:int = 209;
      
      private static const CHAT_AREA_HEIGHT_HIRES:int = 247;
      
      private static const CHAT_AREA_MARGIN_BOTTOM:int = 23;
      
      private static const FRIEND_BAR_MARGIN:int = 40;
      
      private static const DESKTOP_WINDOW_LAYER:uint = 1;
      
      private static const const_891:int = 750;
      
      private static const const_724:int = 1000;
       
      
      private var _timeoutTime:int = 0;
      
      private var var_2603:int = 0;
      
      private var var_1470:class_3151;
      
      private var var_1794:IItemListWindow;
      
      private var var_1574:class_3151;
      
      private var _itemList:Array;
      
      private var var_1523:Array;
      
      private var _movingItems:Array;
      
      private var var_3968:int;
      
      private var var_3896:int = 0;
      
      private var var_2188:Number = 1;
      
      private var var_138:String;
      
      private var var_2774:Number = 1;
      
      private var var_3528:Number = 0;
      
      private var _cameraOffset:Point;
      
      private var _historyViewer:com.sulake.habbo.ui.widget.roomchat.RoomChatHistoryViewer;
      
      private var var_2466:Boolean = false;
      
      private var var_3362:Boolean = false;
      
      private var var_1460:class_20 = null;
      
      private var _config:class_19;
      
      private var var_3788:int = 150;
      
      private var var_1641:int;
      
      private var var_2275:int = 19;
      
      private var var_4314:int = 100;
      
      private var var_4310:int = 205;
      
      private var var_2344:int;
      
      private var _maxFastLevels:int;
      
      public function RoomChatWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18, param5:class_19, param6:int, param7:class_20)
      {
         _itemList = [];
         var_1523 = [];
         _movingItems = [];
         _cameraOffset = new Point();
         super(param1,param2,param3,param4);
         (param1 as ChatWidgetHandler).widget = this;
         _config = param5;
         var_3968 = param6;
         var _loc9_:class_3234;
         if((_loc9_ = param2.getDesktop(1)).height >= 1000)
         {
            var_2344 = 247;
            _maxFastLevels = 12;
            class_14.log("Hi-res chat desktop selected");
         }
         else if(_loc9_.height >= 750)
         {
            var_2344 = 209;
            _maxFastLevels = 10;
            class_14.log("Mid-res chat desktop selected");
         }
         else
         {
            var_2344 = 171;
            _maxFastLevels = 12;
            class_14.log("Lo-res chat desktop selected");
         }
         var_1641 = var_2344 + 23;
         var_1470 = param2.createWindow("chat_container","",4,0,0,new Rectangle(0,0,200,var_1641 + 39),null,0) as class_3151;
         var_1470.background = true;
         var_1470.color = 33554431;
         var_1470.tags.push("room_widget_chat");
         var_1794 = param2.createWindow("chat_contentlist","",50,0,2192,new Rectangle(0,0,200,var_1641),null,0) as IItemListWindow;
         var_1794.disableAutodrag = true;
         var_1470.addChild(var_1794);
         var_1574 = param2.createWindow("chat_active_content","",4,0,16,new Rectangle(0,0,200,var_1641),null,0) as class_3151;
         var_1574.clipping = false;
         var_1794.addListItem(var_1574);
         _historyViewer = new com.sulake.habbo.ui.widget.roomchat.RoomChatHistoryViewer(this,param2,var_1470,param3);
         var_138 = param5.getProperty("site.url");
         var_3788 = param5.getInteger("chat.history.item.max.count",150);
         var _loc8_:Boolean = param5.getBoolean("chat.history.disabled") || isGameSession;
         if(_historyViewer != null)
         {
            _historyViewer.disabled = _loc8_;
         }
         if(param7 != null)
         {
            var_1460 = param7;
            var_1460.registerUpdateReceiver(this,1);
         }
         if(!var_2076)
         {
            var_2076 = new ChatBubbleFactory(param3,param2,XML(_assets.getAssetByName("roomchat_styles_chatstyles_xml").content));
         }
      }
      
      public static function get chatBubbleFactory() : ChatBubbleFactory
      {
         return var_2076;
      }
      
      override public function get mainWindow() : class_3127
      {
         return var_1470;
      }
      
      public function get config() : class_19
      {
         return _config;
      }
      
      public function get handler() : ChatWidgetHandler
      {
         return var_1453 as ChatWidgetHandler;
      }
      
      override public function dispose() : void
      {
         var _loc1_:RoomChatItem = null;
         if(disposed)
         {
            return;
         }
         while(false)
         {
            _loc1_ = _movingItems.shift();
         }
         _historyViewer.dispose();
         _historyViewer = null;
         while(false)
         {
            _loc1_ = _itemList.shift();
            _loc1_.dispose();
         }
         while(false)
         {
            _loc1_ = var_1523.shift();
            _loc1_.dispose();
         }
         var_1470.dispose();
         if(var_1460 != null)
         {
            var_1460.removeUpdateReceiver(this);
            var_1460 = null;
         }
         super.dispose();
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > _timeoutTime && _timeoutTime > 0)
         {
            _timeoutTime = -1;
            animationStart();
         }
         if(var_2466)
         {
            _loc2_ = param1 / 25 * 3;
            if(_loc2_ + var_2603 > var_2275)
            {
               _loc2_ = var_2275 - var_2603;
            }
            if(_loc2_ > 0)
            {
               moveItemsUp(_loc2_);
               var_2603 += _loc2_;
            }
            if(var_2603 >= var_2275)
            {
               var_2275 = 19;
               var_2603 = 0;
               animationStop();
               processBuffer();
               _timeoutTime = getTimer() + 4000;
            }
         }
         if(_historyViewer != null)
         {
            _historyViewer.update(param1);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWCUE_EVENT_CHAT",onChatMessage);
         param1.addEventListener("RWRVUE_ROOM_VIEW_SIZE_CHANGED",onRoomViewUpdate);
         param1.addEventListener("RWRVUE_ROOM_VIEW_POSITION_CHANGED",onRoomViewUpdate);
         param1.addEventListener("RWRVUE_ROOM_VIEW_SCALE_CHANGED",onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWCUE_EVENT_CHAT",onChatMessage);
         param1.removeEventListener("RWRVUE_ROOM_VIEW_SIZE_CHANGED",onRoomViewUpdate);
         param1.removeEventListener("RWRVUE_ROOM_VIEW_POSITION_CHANGED",onRoomViewUpdate);
         param1.removeEventListener("RWRVUE_ROOM_VIEW_SCALE_CHANGED",onRoomViewUpdate);
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         if(RoomEnterEffect.isRunning() && param1.chatType != 1)
         {
            return;
         }
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,getFreeItemId(),localizations,var_138);
         _loc2_.define(param1);
         addChatItem(_loc2_);
      }
      
      public function addChatMessage(param1:String, param2:String, param3:int, param4:BitmapData, param5:uint, param6:Boolean) : void
      {
         var _loc7_:RoomChatItem;
         (_loc7_ = new RoomChatItem(this,windowManager,assets,getFreeItemId(),localizations,var_138)).message = param1;
         _loc7_.senderName = param2;
         _loc7_.senderX = param3;
         _loc7_.senderImage = param4;
         _loc7_.senderColor = param5;
         if(param6)
         {
            _loc7_.chatType = 5;
         }
         _loc7_.renderView();
         addChatItem(_loc7_);
      }
      
      private function addChatItem(param1:RoomChatItem) : void
      {
         if(var_2774 != 1)
         {
            param1.senderX /= var_2774;
         }
         param1.senderX -= 0;
         setChatItemLocHorizontal(param1);
         var_1523.push(param1);
         processBuffer();
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(var_3528 == 0)
            {
               var_3528 = param1.scale;
            }
            else
            {
               var_2774 = param1.scale / var_3528;
            }
         }
         if(param1.positionDelta != null)
         {
            _cameraOffset.x += param1.positionDelta.x / var_2774;
            _cameraOffset.y += param1.positionDelta.y / var_2774;
         }
         if(param1.rect != null)
         {
            if(_historyViewer == null)
            {
               return;
            }
            var_1470.width = _loc2_.width;
            var_1470.height = var_1641 + _historyViewer.pulldownBarHeight;
            var_1794.width = 0 - 0;
            var_1794.height = var_1641;
            var_1794.x = var_1470.x;
            var_1794.y = var_1470.y;
            var_1574.width = 0 - 0;
            var_1574.height = var_1641;
            if(historyViewerActive())
            {
               reAlignItemsToHistoryContent();
            }
            _historyViewer.containerResized(var_1470.rectangle,true);
         }
         alignItems();
      }
      
      private function processBuffer() : void
      {
         if(var_2466)
         {
            return;
         }
         if(false)
         {
            return;
         }
         while(historyViewerActive() && false)
         {
            activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(false)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = checkLastItemAllowsAdding(var_1523[0]);
         }
         if(_loc1_)
         {
            activateItemFromBuffer();
            _timeoutTime = getTimer() + 4000;
         }
         else
         {
            if(false && false)
            {
               var_2275 = getItemSpacing(_itemList[-1],var_1523[0]);
            }
            else
            {
               var_2275 = 19;
            }
            animationStart();
         }
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc2_:RoomChatItem = null;
         var _loc3_:class_3151 = null;
         var _loc1_:int = 0;
         if(false)
         {
            return;
         }
         if(historyViewerMinimized())
         {
            resetArea();
            hideHistoryViewer();
         }
         if(!checkLastItemAllowsAdding(var_1523[0]))
         {
            selectItemsToMove();
            moveItemsUp(getItemSpacing(_itemList[-1],var_1523[0]));
            if(!checkLastItemAllowsAdding(var_1523[0]))
            {
               var_1574.height = NaN;
               if(_historyViewer != null)
               {
                  _historyViewer.containerResized(var_1470.rectangle);
               }
            }
         }
         _loc2_ = var_1523.shift();
         if(_loc2_ != null)
         {
            _loc2_.renderView();
            _loc3_ = _loc2_.view;
            if(_loc3_ != null)
            {
               var_1574.addChild(_loc3_);
               _loc2_.timeStamp = new Date().time;
               _itemList.push(_loc2_);
               _loc1_ = 0;
               if(false)
               {
                  _loc1_ = int(_itemList[-2].screenLevel);
                  if(historyViewerActive())
                  {
                     _loc2_.screenLevel = _loc1_ + 1;
                  }
                  else
                  {
                     _loc2_.screenLevel = _loc1_ + Math.max(var_2188,1);
                  }
               }
               else
               {
                  _loc2_.screenLevel = 100;
               }
               _loc2_.aboveLevels = var_2188;
               if(_loc2_.aboveLevels > _maxFastLevels + 0 + 2)
               {
                  _loc2_.aboveLevels = _maxFastLevels + 0 + 2;
               }
               var_2188 = 0;
               setChatItemLocHorizontal(_loc2_);
               setChatItemLocVertical(_loc2_);
               setChatItemRenderable(_loc2_);
            }
         }
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(false)
         {
            return true;
         }
         var _loc2_:RoomChatItem = _itemList[-1];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(0 - (var_1574.y + _loc2_.y + _loc2_.height) - 23 <= getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      public function alignItems() : void
      {
         var _loc3_:int = 0;
         var _loc1_:RoomChatItem = null;
         if(_historyViewer == null)
         {
            return;
         }
         _loc3_ = -1;
         while(_loc3_ >= 0)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               setChatItemLocHorizontal(_loc1_);
               setChatItemLocVertical(_loc1_);
            }
            _loc3_--;
         }
         _loc3_ = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               setChatItemRenderable(_loc1_);
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < var_1523.length)
         {
            _loc1_ = var_1523[_loc3_];
            if(_loc1_ != null)
            {
               setChatItemLocHorizontal(_loc1_);
            }
            _loc3_++;
         }
      }
      
      private function animationStart() : void
      {
         if(var_2466)
         {
            return;
         }
         selectItemsToMove();
         var_2466 = true;
      }
      
      private function animationStop() : void
      {
         var_2466 = false;
      }
      
      private function selectItemsToMove() : void
      {
         var _loc3_:int = 0;
         var _loc1_:RoomChatItem = null;
         if(var_2466)
         {
            return;
         }
         purgeItems();
         _movingItems = [];
         var _loc2_:int = new Date().time;
         var _loc4_:int = 0;
         if(false)
         {
            var_2188 = 1;
            return;
         }
         if(historyViewerActive())
         {
            return;
         }
         var_2188++;
         _loc3_ = -1;
         while(_loc3_ >= 0)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_.view != null)
            {
               if(_loc1_.screenLevel > 0 || _loc1_.screenLevel == _loc4_ - 1 || _loc2_ - _loc1_.timeStamp >= 6000)
               {
                  _loc1_.timeStamp = _loc2_;
                  _loc4_ = _loc1_.screenLevel;
                  _loc1_.screenLevel--;
                  _movingItems.push(_loc1_);
               }
            }
            _loc3_--;
         }
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc2_:Boolean = false;
         var _loc5_:int = 0;
         if(_movingItems == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc3_:RoomChatItem = null;
         var _loc4_:int = -1;
         _loc5_ = -1;
         while(_loc5_ >= 0)
         {
            _loc3_ = _movingItems[_loc5_];
            if(_loc3_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = _itemList.indexOf(_loc3_);
               }
               else
               {
                  _loc4_++;
               }
               _loc2_ = true;
               if(historyViewerActive())
               {
                  if(_loc3_.y - param1 + _loc3_.height < 0)
                  {
                     _loc2_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(_itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc3_.y - param1 - _itemList[_loc4_ - 1].y < getItemSpacing(_itemList[_loc4_ - 1],_loc3_))
                     {
                        _loc2_ = false;
                     }
                  }
               }
               if(_loc2_)
               {
                  _loc3_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc4_:* = NaN;
         var _loc5_:* = NaN;
         if(param1 == null || _historyViewer == null)
         {
            return;
         }
         var _loc2_:Number = (param1.senderX + _cameraOffset.x) * var_2774;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc8_:Number = _loc3_ + param1.width;
         var _loc7_:Number = -20 + var_4314;
         var _loc6_:Number = 20 - var_4310;
         var _loc9_:Boolean = _loc3_ >= _loc7_ && _loc3_ <= _loc6_;
         var _loc10_:Boolean = _loc8_ >= _loc7_ && _loc8_ <= _loc6_;
         if(_loc9_ && _loc10_)
         {
            _loc5_ = _loc4_ = _loc3_;
         }
         else if(_loc2_ >= 0)
         {
            _loc4_ = _loc6_ - param1.width;
         }
         else
         {
            _loc4_ = _loc7_;
         }
         param1.x = _loc4_ + 0 + var_1470.x;
         if(_loc2_ < _loc7_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc4_);
         }
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = _itemList.indexOf(param1);
            _loc4_ = historyViewerActive() ? 0 : var_2188;
            if(_loc2_ == -1)
            {
               param1.y = getAreaBottom() - (_loc4_ + 1) * 19 - 23;
            }
            else
            {
               _loc3_ = Number(_itemList[_loc2_ + 1].aboveLevels);
               if(_loc3_ < 2)
               {
                  param1.y = _itemList[_loc2_ + 1].y - getItemSpacing(param1,_itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = _itemList[_loc2_ + 1].y - _loc3_ * 19;
               }
            }
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -32)
            {
               if(param1.view != null)
               {
                  var_1574.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  var_1574.addChild(param1.view);
               }
            }
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:RoomChatItem = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += 19;
               }
               else
               {
                  _loc2_ += getItemSpacing(_itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * 19;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function getAreaBottom() : Number
      {
         if(historyViewerActive())
         {
            return var_1574.height;
         }
         return var_1641 + var_1470.y;
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         var _loc3_:int = chatBubbleFactory.getActualBubbleHeight(param1.chatStyle);
         if(param1.checkOverlap(_loc3_,param2.x,param1.y,param2.width,param2.height))
         {
            return 19;
         }
         return 10;
      }
      
      private function purgeItems() : void
      {
         var _loc1_:* = null;
         if(historyViewerActive())
         {
            return;
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_itemList.length > var_3788)
         {
            _loc1_ = _itemList.shift();
            if((_loc4_ = _movingItems.indexOf(_loc1_)) > -1)
            {
               _movingItems.splice(_loc4_,1);
            }
            if(_loc1_.view != null)
            {
               var_1574.removeChild(_loc1_.view);
               _loc1_.hideView();
            }
            _loc1_.dispose();
            _loc1_ = null;
         }
         var _loc2_:Boolean = false;
         _loc3_ = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc1_.y > -32)
               {
                  _loc2_ = true;
                  break;
               }
               _loc1_.aboveLevels = 1;
               if(_loc1_.view != null)
               {
                  if((_loc4_ = _movingItems.indexOf(_loc1_)) > -1)
                  {
                     _movingItems.splice(_loc4_,1);
                  }
                  var_1574.removeChild(_loc1_.view);
                  _loc1_.hideView();
               }
            }
            _loc3_++;
         }
         if(false)
         {
            _loc2_ = true;
         }
         if(getTotalContentHeight() > 19 && !_loc2_ && !historyViewerActive())
         {
            if(_historyViewer != null)
            {
               stretchAreaBottomTo(var_1470.y);
               alignItems();
               if(!historyViewerActive())
               {
                  _historyViewer.showHistoryViewer();
               }
               if(!historyViewerVisible())
               {
                  _historyViewer.visible = true;
               }
            }
         }
         else if(historyViewerVisible())
         {
            _historyViewer.visible = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + var_3968.toString() + "_item_" + (var_3896++).toString();
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(param5.shiftKey)
         {
            if(_historyViewer != null)
            {
               _historyViewer.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_INFO",param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc6_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage("RWCSAM_MESSAGE_SELECT_AVATAR",param1,param2,param4);
         messageListener.processWidgetMessage(_loc6_);
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:WindowMouseEvent) : void
      {
         if(historyViewerVisible())
         {
            return;
         }
         if(_historyViewer != null)
         {
            _historyViewer.beginDrag(param4.stageY,true);
         }
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:WindowMouseEvent) : void
      {
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:WindowMouseEvent) : void
      {
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(_historyViewer != null)
         {
            _historyViewer.beginDrag(param1.stageY,true);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_historyViewer != null)
         {
            _historyViewer.hideHistoryViewer();
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = var_1470.bottom + param1 - 39;
         stretchAreaBottomTo(_loc2_);
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = var_1470.context.getDesktopWindow().height - 39 - 40;
         param1 = Math.min(param1,_loc2_);
         var_1641 = param1 - 0;
         var_1470.height = var_1641 + 39;
         if(_historyViewer != null)
         {
            _historyViewer.containerResized(var_1470.rectangle);
         }
      }
      
      public function resetArea(param1:Boolean = true) : void
      {
         if(_historyViewer == null)
         {
            return;
         }
         animationStop();
         var_1641 = var_2344 + 23;
         var_1470.height = var_1641 + _historyViewer.pulldownBarHeight;
         var_1794.width = 0 - 0;
         var_1794.height = var_1641;
         var_1574.width = 0 - 0;
         if(historyViewerActive())
         {
            var_1574.height = getTotalContentHeight() + 23;
         }
         else
         {
            var_1574.height = var_1641;
         }
         var_1794.scrollV = 1;
         if(!historyViewerActive())
         {
            _historyViewer.containerResized(var_1470.rectangle);
         }
         purgeItems();
         if(historyViewerActive() || param1)
         {
            alignItems();
         }
      }
      
      private function historyViewerActive() : Boolean
      {
         return _historyViewer == null ? false : _historyViewer.active;
      }
      
      private function historyViewerVisible() : Boolean
      {
         return _historyViewer == null ? false : _historyViewer.visible;
      }
      
      public function hideHistoryViewer() : void
      {
         if(_historyViewer != null)
         {
            _historyViewer.hideHistoryViewer();
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return true;
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc3_:int = 0;
         var _loc1_:RoomChatItem = null;
         var _loc4_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_.y > _loc4_)
            {
               _loc4_ = _loc1_.y;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < var_1523.length)
         {
            _loc1_ = var_1523[_loc3_];
            if(_loc1_.y > _loc4_)
            {
               _loc4_ = _loc1_.y;
            }
            _loc3_++;
         }
         _loc4_ = int((_loc4_ += 32) < 0 ? 0 : _loc4_);
         var _loc2_:int = 0;
         stretchAreaBottomTo(var_1470.top + _loc4_);
         _loc2_ -= 0;
         if(Math.abs(_loc2_) < 3)
         {
            resetArea();
            return;
         }
         _loc3_ = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            _loc1_.y += _loc2_;
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < var_1523.length)
         {
            _loc1_ = var_1523[_loc3_];
            _loc1_.y += _loc2_;
            _loc3_++;
         }
         var_3362 = true;
      }
      
      public function mouseUp() : void
      {
         var_1794.stopDragging();
         var _loc1_:Number = -39;
         if(_loc1_ < var_2344)
         {
            if(_loc1_ <= var_1641 + var_1470.y)
            {
               if(historyViewerActive())
               {
                  hideHistoryViewer();
               }
               resetArea();
               return;
            }
         }
         if(var_3362 && !historyViewerActive())
         {
            resetArea();
            var_3362 = false;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(historyViewerActive())
         {
            var_1574.height = getTotalContentHeight() + 23;
            alignItems();
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:RoomChatItem = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.enableDragTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_1523.length)
         {
            _loc1_ = var_1523[_loc2_];
            _loc1_.enableDragTooltip();
            _loc2_++;
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:RoomChatItem = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.disableDragTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_1523.length)
         {
            _loc1_ = var_1523[_loc2_];
            _loc1_.disableDragTooltip();
            _loc2_++;
         }
      }
      
      public function get isGameSession() : Boolean
      {
         return handler.container.roomSession.isGameSession;
      }
      
      public function removeItem(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         _loc2_ = _itemList.indexOf(param1);
         if(_loc2_ > -1)
         {
            _itemList.splice(_loc2_,1);
         }
         _loc2_ = _movingItems.indexOf(param1);
         if(_loc2_ > -1)
         {
            _movingItems.splice(_loc2_,1);
         }
         if(param1.view != null)
         {
            var_1574.removeChild(param1.view);
            param1.hideView();
         }
         param1.dispose();
         resetArea(false);
      }
   }
}
