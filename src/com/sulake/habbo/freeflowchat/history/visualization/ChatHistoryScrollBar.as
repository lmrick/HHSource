package com.sulake.habbo.freeflowchat.history.visualization
{
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class ChatHistoryScrollBar
   {
      
      public static const RIGHT_MARGIN:int = 0;
       
      
      private var var_1772:com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView;
      
      private var _displayObject:Sprite;
      
      private var _background:Sprite;
      
      private var var_1859:Sprite;
      
      private var var_3496:int;
      
      private var var_3979:int;
      
      private var var_1757:Stage;
      
      public function ChatHistoryScrollBar(param1:com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView, param2:HabboFreeFlowChat)
      {
         super();
         var_1772 = param1;
         var_1859 = HabboFreeFlowChat.create9SliceSprite(new Rectangle(2,2,1,1),param2.assets.getAssetByName("scrollbar_thumb").content as BitmapData);
         var_1859.x = 2;
         var_1859.y = 2;
         _background = HabboFreeFlowChat.create9SliceSprite(new Rectangle(2,2,5,5),param2.assets.getAssetByName("scrollbar_back").content as BitmapData);
         _displayObject = new Sprite();
         _displayObject.addChild(_background);
         _displayObject.addChild(var_1859);
         var_1859.addEventListener("addedToStage",onAddedToStage);
         var_1859.addEventListener("removedFromStage",onRemovedFromStage);
         var_1859.addEventListener("mouseDown",mouseDownEventHandler);
      }
      
      public function set height(param1:int) : void
      {
         _background.height = param1;
         updateThumbTrack();
      }
      
      public function get displayObject() : Sprite
      {
         return _displayObject;
      }
      
      public function updateThumbTrack() : void
      {
         var _loc1_:int = var_1772.topY + (var_1772.viewPort.height - 0);
         var_1859.height = Math.min(-4,Math.max(5,int(-4 * (0 / 0))));
         var_1859.y = Math.min(-2,Math.max(2,int(-4 * (Math.max(1,_loc1_) / 0) - 0)));
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var_1757 = var_1859.stage;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         var_1757 = null;
      }
      
      private function mouseDownEventHandler(param1:Event) : void
      {
         var_3496 = MouseEvent(param1).stageY;
         var_3979 = var_1772.topY;
         var_1757.addEventListener("mouseUp",mouseDragEventHandler);
         var_1757.addEventListener("mouseMove",mouseDragEventHandler);
         param1.stopImmediatePropagation();
      }
      
      private function mouseDragEventHandler(param1:Event) : void
      {
         var _loc4_:Number = NaN;
         var _loc2_:int = 0;
         var _loc3_:MouseEvent = MouseEvent(param1);
         switch(_loc3_.type)
         {
            case "mouseMove":
               _loc4_ = 0 / 0;
               _loc2_ = (_loc3_.stageY - var_3496) * _loc4_;
               var_1772.topY = var_3979 + _loc2_;
               break;
            case "mouseUp":
               endScroll();
         }
         param1.stopImmediatePropagation();
      }
      
      public function endScroll() : void
      {
         if(var_1757)
         {
            var_1757.removeEventListener("mouseUp",mouseDragEventHandler);
            var_1757.removeEventListener("mouseMove",mouseDragEventHandler);
         }
      }
   }
}
