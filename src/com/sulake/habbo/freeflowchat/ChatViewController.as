package com.sulake.habbo.freeflowchat
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryTray;
   import com.sulake.habbo.freeflowchat.viewer.ChatFlowViewer;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   
   public class ChatViewController implements class_13
   {
       
      
      private var _rootDisplayObject:DisplayObjectContainer;
      
      private var var_1757:Stage;
      
      private var var_1460:com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
      
      private var var_3671:ChatFlowViewer;
      
      private var _pulldown:ChatHistoryTray;
      
      private var _flowViewerDisplayObject:DisplayObject;
      
      private var _pulldownDisplayObject:DisplayObject;
      
      public function ChatViewController(param1:com.sulake.habbo.freeflowchat.HabboFreeFlowChat, param2:ChatFlowViewer, param3:ChatHistoryTray)
      {
         super();
         var_1460 = param1;
         var_3671 = param2;
         _pulldown = param3;
         _flowViewerDisplayObject = var_3671.rootDisplayObject;
         _pulldownDisplayObject = _pulldown.rootDisplayObject;
         _rootDisplayObject = new Sprite();
         _rootDisplayObject.addChild(_flowViewerDisplayObject);
         _rootDisplayObject.addChild(_pulldownDisplayObject);
         _rootDisplayObject.addEventListener("addedToStage",onAddedToStage);
      }
      
      public function dispose() : void
      {
         if(_rootDisplayObject)
         {
            var_1460.removeUpdateReceiver(_pulldown);
            if(var_1757)
            {
               var_1757.removeEventListener("resize",onStageResized);
            }
            _rootDisplayObject.removeChild(_pulldownDisplayObject);
            _rootDisplayObject.removeChild(_flowViewerDisplayObject);
            _rootDisplayObject.removeEventListener("addedToStage",onAddedToStage);
            _rootDisplayObject = null;
            _pulldownDisplayObject = null;
            _flowViewerDisplayObject = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _rootDisplayObject == null;
      }
      
      public function get rootDisplayObject() : DisplayObject
      {
         return _rootDisplayObject;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var_1757 = _rootDisplayObject.stage;
         var_1757.addEventListener("resize",onStageResized);
         _pulldown.resize(var_1757.stageWidth,var_1757.stageHeight);
         var_1460.registerUpdateReceiver(_pulldown,200);
      }
      
      private function onStageResized(param1:Event) : void
      {
         _pulldown.resize(var_1757.stageWidth,var_1757.stageHeight);
         var_3671.resize(var_1757.stageWidth,var_1757.stageHeight);
      }
   }
}
