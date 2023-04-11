package com.sulake.habbo.freeflowchat.history.visualization
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.freeflowchat.history.*;
   import com.sulake.habbo.freeflowchat.history.visualization.entry.class_3299;
   import com.sulake.habbo.freeflowchat.history.visualization.entry.class_3300;
   import com.sulake.habbo.window.utils.class_3216;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class ChatHistoryScrollView implements class_13
   {
       
      
      private var var_1460:HabboFreeFlowChat;
      
      private var _historyBuffer:ChatHistoryBuffer;
      
      private var _rootDisplayObject:DisplayObjectContainer;
      
      private var var_1757:Stage;
      
      private var var_1617:Vector.<class_3300>;
      
      private var var_3112:int = 0;
      
      private var var_2798:Rectangle;
      
      private var _visibleWidth:int = 0;
      
      private var var_3496:int;
      
      private var var_4218:int;
      
      private var var_1881:Sprite;
      
      private var var_2105:Boolean = false;
      
      private var _scrollBar:com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollBar;
      
      private var _ignore:Bitmap;
      
      private var var_1562:class_3300;
      
      public function ChatHistoryScrollView(param1:HabboFreeFlowChat, param2:ChatHistoryBuffer)
      {
         super();
         var_1460 = param1;
         _historyBuffer = param2;
         _rootDisplayObject = new Sprite();
         _rootDisplayObject.x = 0;
         _rootDisplayObject.y = 0;
         _rootDisplayObject.addEventListener("addedToStage",onAddedToStage);
         _scrollBar = new com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollBar(this,param1);
         _ignore = new Bitmap();
         _ignore.bitmapData = BitmapData(var_1460.assets.getAssetByName("close_x").content);
         var_1562 = null;
      }
      
      public function dispose() : void
      {
         deactivateScrolling();
         deactivateView();
         var_1881 = null;
         _ignore = null;
         var_1562 = null;
         if(_rootDisplayObject)
         {
            _rootDisplayObject.removeEventListener("addedToStage",onAddedToStage);
            _rootDisplayObject = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_1881 == null && _rootDisplayObject == null;
      }
      
      public function get rootDisplayObject() : DisplayObjectContainer
      {
         return _rootDisplayObject;
      }
      
      public function activateView() : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:class_3300 = null;
         var _loc1_:class_3299 = null;
         if(!_historyBuffer)
         {
            return;
         }
         deactivateView();
         var_1617 = new Vector.<class_3300>(_historyBuffer.entries.length);
         _loc4_ = 0;
         _loc3_ = -var_3112;
         while(_loc4_ < _historyBuffer.entries.length)
         {
            _loc2_ = new class_3300();
            _loc1_ = _historyBuffer.entries[_loc4_];
            _loc2_.roomId = _loc1_.roomId;
            _loc2_.userId = _loc1_.userId;
            _loc2_.bitmapData = _loc1_.bitmap;
            _loc2_.canIgnore = _loc1_.canIgnore;
            _loc2_.userName = _loc1_.userName;
            _loc3_ -= _loc1_.overlap.y;
            _loc2_.y = _loc3_;
            _loc2_.x = 3;
            _loc3_ += _loc2_.bitmapData.height;
            _loc3_ -= 8;
            var_1617[_loc4_] = _loc2_;
            _rootDisplayObject.addChild(var_1617[_loc4_]);
            _loc4_++;
         }
         _rootDisplayObject.addChild(_scrollBar.displayObject);
         var_2105 = true;
      }
      
      public function deactivateView() : void
      {
         if(disposed)
         {
            return;
         }
         for each(var _loc1_ in var_1617)
         {
            _rootDisplayObject.removeChild(_loc1_);
            _loc1_.bitmapData = null;
         }
         if(var_1562 != null)
         {
            _rootDisplayObject.removeChild(_ignore);
            var_1562 = null;
         }
         var_1617 = new Vector.<class_3300>(0);
         if(false && _scrollBar.displayObject.parent == _rootDisplayObject)
         {
            _rootDisplayObject.removeChild(_scrollBar.displayObject);
         }
         var_2105 = false;
      }
      
      public function activateScrolling() : void
      {
         deactivateScrolling();
         _rootDisplayObject.stage.addEventListener("mouseDown",mouseDragEventHandler);
         var_1757 = _rootDisplayObject.stage;
         var_1757.addEventListener("resize",onStageResized);
      }
      
      public function deactivateScrolling() : void
      {
         if(var_1757)
         {
            var_1757.removeEventListener("mouseDown",mouseDragEventHandler);
            var_1757.removeEventListener("mouseMove",mouseDragEventHandler,true);
            var_1757.removeEventListener("mouseUp",mouseDragEventHandler);
            var_1757.removeEventListener("resize",onStageResized);
         }
      }
      
      public function get topY() : int
      {
         return var_3112;
      }
      
      public function get bufferHeight() : int
      {
         return _historyBuffer.totalHeight;
      }
      
      public function set topY(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:class_3299 = null;
         var_3112 = param1;
         if(var_1617)
         {
            _loc4_ = 0;
            _loc3_ = -var_3112;
            while(_loc4_ < _historyBuffer.entries.length)
            {
               if(var_1617.length <= _loc4_)
               {
                  break;
               }
               _loc2_ = _historyBuffer.entries[_loc4_];
               _loc3_ -= _loc2_.overlap.y;
               var_1617[_loc4_].y = _loc3_;
               _loc3_ += _loc2_.bitmap.height - 8;
               _loc4_++;
            }
         }
         if(var_1562 != null)
         {
            _ignore.y = var_1562.y + (0 - 0) / 2;
         }
         _scrollBar.updateThumbTrack();
      }
      
      public function addHistoryEntry(param1:class_3299) : void
      {
         var _loc2_:class_3300 = new class_3300();
         _loc2_.bitmapData = param1.bitmap;
         _loc2_.y = -var_3112 + _historyBuffer.totalHeight - param1.bitmap.height + 8;
         _loc2_.x = 3;
         _loc2_.userId = param1.userId;
         _loc2_.roomId = param1.roomId;
         _loc2_.canIgnore = param1.canIgnore;
         _loc2_.userName = param1.userName;
         var_1617.push(_loc2_);
         _rootDisplayObject.addChild(var_1617[-1]);
      }
      
      public function scrollUpAndSpliceTopItem(param1:int) : void
      {
         if(var_1617 && false)
         {
            _rootDisplayObject.removeChild(var_1617[0]);
            var_1617.splice(0,1);
            for each(var _loc2_ in var_1617)
            {
               _loc2_.y -= param1;
            }
         }
      }
      
      public function get viewPort() : Rectangle
      {
         return var_2798;
      }
      
      public function set viewPort(param1:Rectangle) : void
      {
         var_2798 = param1;
         _rootDisplayObject.width = param1.width;
         _rootDisplayObject.height = param1.height;
         _rootDisplayObject.scaleX = 1;
         _rootDisplayObject.scaleY = 1;
         if(!var_1881)
         {
            var_1881 = new Sprite();
            _rootDisplayObject.addChild(var_1881);
         }
         var_1881.graphics.clear();
         var_1881.graphics.beginFill(16777215);
         var_1881.graphics.drawRect(0,0,viewPort.width,viewPort.height);
         _rootDisplayObject.mask = var_1881;
         _scrollBar.displayObject.x = 0 - 0;
         viewBottom = param1.height;
      }
      
      public function set viewBottom(param1:int) : void
      {
         _rootDisplayObject.y = param1 - 0;
         _scrollBar.height = param1;
         _scrollBar.displayObject.y = 0 - param1;
      }
      
      public function set viewWidth(param1:int) : void
      {
         _visibleWidth = param1;
         _scrollBar.displayObject.x = _visibleWidth - 0;
      }
      
      public function scrollToBottom() : void
      {
         topY = 0 - 0 + 100;
      }
      
      public function get isActive() : Boolean
      {
         return var_2105;
      }
      
      private function findSpriteAtY(param1:int) : class_3300
      {
         for each(var _loc2_ in var_1617)
         {
            if(param1 >= _loc2_.y && param1 <= _loc2_.y + _loc2_.height)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function mouseDragEventHandler(param1:Event) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:class_3300 = null;
         if(!_rootDisplayObject || true)
         {
            return;
         }
         var _loc2_:MouseEvent = MouseEvent(param1);
         switch(_loc2_.type)
         {
            case "mouseDown":
               if(_loc2_.stageY < NaN && _loc2_.stageX < _scrollBar.displayObject.x)
               {
                  _scrollBar.endScroll();
                  var_3496 = _loc2_.stageY;
                  var_4218 = topY;
                  var_1757.addEventListener("mouseMove",mouseDragEventHandler,true);
                  var_1757.addEventListener("mouseUp",mouseDragEventHandler);
                  break;
               }
               break;
            case "mouseMove":
               _loc5_ = _loc2_.stageY - var_3496;
               topY = var_4218 - _loc5_;
               param1.stopImmediatePropagation();
               break;
            case "mouseUp":
               var_1757.removeEventListener("mouseMove",mouseDragEventHandler,true);
               var_1757.removeEventListener("mouseUp",mouseDragEventHandler);
               if((_loc4_ = _loc2_.stageY - var_3496) < 1 && _loc4_ > -1)
               {
                  if(!hitIgnore(_loc2_.stageX,_loc2_.stageY))
                  {
                     _loc3_ = findSpriteAtY(_loc2_.stageY);
                     if(_loc3_)
                     {
                        onEntrySpriteClicked(_loc3_);
                        moveIgnore(_loc3_);
                        break;
                     }
                     break;
                  }
                  break;
               }
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var _loc2_:Stage = _rootDisplayObject.stage;
         viewPort = new Rectangle(0,0,_loc2_.stageWidth,_loc2_.stageHeight - 50);
      }
      
      private function onStageResized(param1:Event) : void
      {
         if(var_1757)
         {
            viewPort = new Rectangle(0,0,var_1757.stageWidth,-50);
         }
      }
      
      private function onEntrySpriteClicked(param1:class_3300) : void
      {
         if(!var_1460)
         {
            return;
         }
         var_1460.selectAvatar(param1.roomId,param1.userId);
      }
      
      private function moveIgnore(param1:class_3300) : void
      {
         if(!var_1460 || param1 == var_1562)
         {
            return;
         }
         if(!param1.canIgnore || var_1460.sessionDataManager.isIgnored(param1.userName))
         {
            if(var_1562 != null)
            {
               _rootDisplayObject.removeChild(_ignore);
               var_1562 = null;
            }
            return;
         }
         _ignore.x = param1.x + param1.width + 5;
         _ignore.y = param1.y + (param1.height - 0) / 2;
         _rootDisplayObject.addChild(_ignore);
         var_1562 = param1;
      }
      
      private function hitIgnore(param1:int, param2:int) : Boolean
      {
         if(var_1562 == null || param1 < _ignore.x || param1 > NaN || param2 < _ignore.y || param2 > NaN)
         {
            return false;
         }
         var_1460.localizations.registerParameter("chat.ignore_user.confirm.info","username",var_1562.userName);
         var _loc4_:String = String(var_1460.localizations.getLocalization("chat.ignore_user.confirm.title"));
         var _loc3_:String = String(var_1460.localizations.getLocalization("chat.ignore_user.confirm.info"));
         var_1460.windowManager.confirmWithModal(_loc4_,_loc3_,0,ignoreConfirmDialogEventProcessor);
         return true;
      }
      
      private function ignoreConfirmDialogEventProcessor(param1:class_3216, param2:class_3134) : void
      {
         param1.dispose();
         if(param2.type == "WE_OK")
         {
            var_1460.sessionDataManager.ignoreUser(var_1562.userName);
         }
         if(var_1562 != null)
         {
            _rootDisplayObject.removeChild(_ignore);
            var_1562 = null;
         }
      }
   }
}
