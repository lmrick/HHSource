package com.sulake.habbo.ui.widget.roomchat
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollableWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.habbo.window.class_1684;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryViewer implements class_13
   {
      
      private static const CHAT_ITEM_HEIGHT:int = 18;
      
      private static const SCROLLBAR_WIDTH:int = 20;
      
      public static const MOUSE_HYSTERESIS_TOLERANCE:int = 3;
       
      
      private var _historyPulldown:com.sulake.habbo.ui.widget.roomchat.RoomChatHistoryPulldown;
      
      private var _historyViewerActive:Boolean = false;
      
      private var _historyViewerDragStartY:Number = -1;
      
      private var var_1483:IScrollbarWindow;
      
      private var var_1833:Number = 1;
      
      private var var_3222:Boolean = false;
      
      private var var_1429:com.sulake.habbo.ui.widget.roomchat.RoomChatWidget;
      
      private var var_311:Boolean = false;
      
      private var var_3550:Boolean = false;
      
      private var var_3462:Boolean = false;
      
      public function RoomChatHistoryViewer(param1:com.sulake.habbo.ui.widget.roomchat.RoomChatWidget, param2:class_1684, param3:class_3151, param4:class_21)
      {
         super();
         var_311 = false;
         var_1429 = param1;
         _historyPulldown = new com.sulake.habbo.ui.widget.roomchat.RoomChatHistoryPulldown(param1,param2,param3,param4);
         _historyPulldown.state = 0;
         var _loc5_:IItemListWindow;
         if((_loc5_ = param3.getChildByName("chat_contentlist") as IItemListWindow) == null)
         {
            return;
         }
         param3.removeChild(_loc5_);
         param3.addChild(_loc5_);
         var_1483 = param2.createWindow("chatscroller","",131,0,16,new Rectangle(param3.right - 20,param3.y,20,param3.height - 39),null,0) as IScrollbarWindow;
         param3.addChild(var_1483);
         var_1483.visible = false;
         var_1483.scrollable = _loc5_ as IScrollableWindow;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         var_3222 = param1;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(_historyPulldown == null || var_3222)
         {
            return;
         }
         _historyPulldown.state = param1 ? 1 : 0;
      }
      
      public function get active() : Boolean
      {
         return _historyViewerActive;
      }
      
      public function get scrollbarWidth() : Number
      {
         return _historyViewerActive ? 20 : 0;
      }
      
      public function get pulldownBarHeight() : Number
      {
         return 39;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get visible() : Boolean
      {
         if(_historyPulldown == null)
         {
            return false;
         }
         return false;
      }
      
      public function dispose() : void
      {
         hideHistoryViewer();
         if(var_1483 != null)
         {
            var_1483.dispose();
            var_1483 = null;
         }
         if(_historyPulldown != null)
         {
            _historyPulldown.dispose();
            _historyPulldown = null;
         }
         var_311 = true;
      }
      
      public function update(param1:uint) : void
      {
         if(_historyPulldown != null)
         {
            _historyPulldown.update(param1);
         }
         moveHistoryScroll();
      }
      
      public function toggleHistoryViewer() : void
      {
         if(_historyViewerActive)
         {
            hideHistoryViewer();
         }
         else
         {
            showHistoryViewer();
         }
      }
      
      public function hideHistoryViewer() : void
      {
         var_1833 = 1;
         cancelDrag();
         _historyViewerActive = false;
         setHistoryViewerScrollbar(false);
         _historyPulldown.state = 0;
         if(var_1429 != null)
         {
            var_1429.resetArea();
            var_1429.enableDragTooltips();
            var_1429.handler.container.toolbar.extensionView.extraMargin = 0;
         }
      }
      
      public function showHistoryViewer() : void
      {
         if(!_historyViewerActive && !var_3222)
         {
            _historyViewerActive = true;
            setHistoryViewerScrollbar(true);
            _historyPulldown.state = 1;
            if(var_1429 != null)
            {
               var_1429.reAlignItemsToHistoryContent();
               var_1429.disableDragTooltips();
            }
         }
      }
      
      private function setHistoryViewerScrollbar(param1:Boolean) : void
      {
         if(var_1483 != null)
         {
            var_1483.visible = param1;
            if(param1)
            {
               var_1483.scrollV = 1;
               var_1833 = 1;
            }
            else
            {
               _historyViewerActive = false;
               _historyViewerDragStartY = -1;
            }
         }
      }
      
      public function containerResized(param1:Rectangle, param2:Boolean = false) : void
      {
         if(var_1483 != null)
         {
            var_1483.x = param1.x + param1.width - 0;
            var_1483.y = param1.y;
            var_1483.height = param1.height - 39;
            if(param2)
            {
               var_1483.scrollV = var_1833;
            }
         }
         if(_historyPulldown != null)
         {
            _historyPulldown.containerResized(param1);
         }
      }
      
      private function processDrag(param1:Number, param2:Boolean = false) : void
      {
         var _loc8_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc3_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         if(_historyViewerDragStartY > 0 && param2)
         {
            if(var_3462)
            {
               if(Math.abs(param1 - _historyViewerDragStartY) <= 3)
               {
                  return;
               }
               var_3462 = false;
            }
            if(!_historyViewerActive)
            {
               var_1429.resizeContainerToLowestItem();
               showHistoryViewer();
               moveHistoryScroll();
            }
            if(_historyViewerActive)
            {
               var_1429.handler.container.toolbar.extensionView.extraMargin = 20;
               moveHistoryScroll();
               _loc4_ = var_1483.scrollable.scrollableRegion.height / var_1483.scrollable.visibleRegion.height;
               _loc5_ = (param1 - _historyViewerDragStartY) / 0;
               _loc8_ = var_1833 - _loc5_ / _loc4_;
               _loc8_ = Math.max(0,_loc8_);
               _loc8_ = Math.min(1,_loc8_);
               _loc3_ = param1 - _historyViewerDragStartY;
               _loc6_ = true;
               _loc7_ = true;
               if(var_1483.scrollV < 1 - 18 / var_1483.scrollable.scrollableRegion.height)
               {
                  _loc7_ = false;
               }
               if(_loc7_ || var_3550)
               {
                  var_1429.stretchAreaBottomBy(_loc3_);
                  _loc6_ = false;
                  var_1833 = 1;
                  var_1483.scrollV = 1;
               }
               if(_loc6_)
               {
                  var_1833 = _loc8_;
               }
               _historyViewerDragStartY = param1;
            }
         }
         else
         {
            _historyViewerDragStartY = -1;
         }
      }
      
      public function beginDrag(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:Stage = null;
         if(var_3222)
         {
            return;
         }
         _historyViewerDragStartY = param1;
         var_3550 = param2;
         var_3462 = true;
         if(var_1483 != null)
         {
            var_1833 = var_1483.scrollV;
         }
         if(var_1483 != null)
         {
            _loc3_ = var_1483.context.getDesktopWindow().getDisplayObject();
            if(_loc3_ != null)
            {
               if((_loc4_ = _loc3_.stage) != null)
               {
                  _loc4_.addEventListener("mouseMove",onStageMouseMove);
                  _loc4_.addEventListener("mouseUp",onStageMouseUp);
               }
            }
         }
      }
      
      public function cancelDrag() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:Stage = null;
         _historyViewerDragStartY = -1;
         if(var_1483 != null)
         {
            _loc1_ = var_1483.context.getDesktopWindow().getDisplayObject();
            if(_loc1_ != null)
            {
               _loc2_ = _loc1_.stage;
               if(_loc2_ != null)
               {
                  _loc2_.removeEventListener("mouseMove",onStageMouseMove);
                  _loc2_.removeEventListener("mouseUp",onStageMouseUp);
               }
            }
         }
      }
      
      private function moveHistoryScroll() : void
      {
         if(!_historyViewerActive)
         {
            return;
         }
         if(_historyViewerDragStartY < 0)
         {
            return;
         }
         if(var_3550)
         {
            return;
         }
         var _loc1_:Number = var_1833 - 0;
         if(_loc1_ == 0)
         {
            return;
         }
         if(Math.abs(_loc1_) < 0.01)
         {
            var_1483.scrollV = var_1833;
         }
         else
         {
            var_1483.scrollV += _loc1_ / 2;
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         cancelDrag();
         if(var_1429 != null)
         {
            var_1429.mouseUp();
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         processDrag(param1.stageY,param1.buttonDown);
      }
   }
}
