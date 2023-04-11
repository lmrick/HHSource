package com.sulake.habbo.ui.widget.furniture.video
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.class_3207;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.class_3324;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.object.IRoomObject;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_136.class_1618;
   
   public class YoutubeDisplayWidget extends RoomWidgetBase
   {
      
      private static const const_1179:uint = 4291611903;
      
      private static const const_981:uint = 4294967295;
       
      
      private var _habboTracking:class_1693;
      
      private var var_171:Object;
      
      private var _window:class_3151;
      
      private var _roomObject:IRoomObject;
      
      private var var_1525:class_3151;
      
      private var var_2536:class_3127;
      
      private var _queuedVideoParams:Object;
      
      private var var_2844:String;
      
      private var _canControlPlayback:Boolean;
      
      private var var_2637:int = -1;
      
      public function YoutubeDisplayWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18, param5:class_1693)
      {
         super(param1,param2,param3,param4);
         _habboTracking = param5;
         ownHandler.widget = this;
      }
      
      private function get ownHandler() : class_3324
      {
         return var_1453 as class_3324;
      }
      
      override public function get mainWindow() : class_3127
      {
         return _window;
      }
      
      public function show(param1:IRoomObject, param2:Boolean) : void
      {
         _roomObject = param1;
         _canControlPlayback = param2;
         createWindow(param2);
         _window.visible = true;
      }
      
      private function createWindow(param1:Boolean) : void
      {
         if(_window != null)
         {
            return;
         }
         _window = windowManager.buildFromXML(XML(assets.getAssetByName("video_viewer_xml").content)) as class_3151;
         if(param1)
         {
            var_2536 = IItemListWindow(_window.findChildByName("playlists")).removeListItemAt(0);
         }
         else
         {
            _window.findChildByName("right_pane").dispose();
            _window.findChildByName("video_background").width = -20;
            _window.findChildByName("video_background").setParamFlag(128);
            _window.width = -250;
         }
         _window.procedure = windowProcedure;
         _window.center();
      }
      
      private function onPlayerLoaderInit(param1:Event) : void
      {
         var _loc2_:Loader = null;
         if(_window == null)
         {
            return;
         }
         var _loc3_:LoaderInfo = param1.target as LoaderInfo;
         if(_loc3_)
         {
            _loc2_ = _loc3_.loader;
            class_3207(_window.findChildByName("video_wrapper")).setDisplayObject(_loc2_);
            _loc2_.content.addEventListener("onReady",onPlayerReady);
            _loc2_.content.addEventListener("onStateChange",onPlayerStateChange);
            _loc2_.content.addEventListener("mouseUp",onVideoMouseEvent);
            _loc2_.content.addEventListener("mouseMove",onVideoMouseEvent);
         }
      }
      
      private function onVideoMouseEvent(param1:MouseEvent) : void
      {
         if(_window != null && _canControlPlayback)
         {
            DisplayObject(param1.target).stage.dispatchEvent(new MouseEvent(param1.type));
            if(var_171 && param1.type == "mouseUp" && var_2844 != "")
            {
               if(var_171.getPlayerState() == 1)
               {
                  ownHandler.pauseVideo(_roomObject.getId());
               }
               else if(var_171.getPlayerState() == 2)
               {
                  ownHandler.continueVideo(_roomObject.getId());
               }
            }
         }
      }
      
      private function onPlayerReady(param1:Event) : void
      {
         var _loc2_:class_3127 = null;
         var_171 = param1.target;
         if(_window != null)
         {
            _loc2_ = _window.findChildByName("video_wrapper");
            var_171.setSize(_loc2_.width,_loc2_.height);
            if(_queuedVideoParams != null)
            {
               loadVideo(_queuedVideoParams);
               _queuedVideoParams = null;
            }
         }
         else
         {
            var_171.destroy();
         }
      }
      
      private function onPlayerStateChange(param1:Event) : void
      {
         var_171 = param1.target;
         if(_window != null)
         {
            switch(var_171.getPlayerState())
            {
               case -1:
               case 1:
                  if(var_2637 == 2)
                  {
                     var_171.pauseVideo();
                     break;
                  }
            }
         }
      }
      
      public function hide(param1:IRoomObject) : void
      {
         if(_roomObject != param1)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_2536 != null)
         {
            var_2536.dispose();
            var_2536 = null;
         }
         if(var_171 != null)
         {
            var_171.destroy();
            var_171 = null;
         }
         if(var_2844 != null)
         {
            _habboTracking.trackEventLog("YouTubeTVs",var_2844,"video.closed");
         }
         _queuedVideoParams = null;
         var_1525 = null;
         _roomObject = null;
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         hide(_roomObject);
         _habboTracking = null;
         super.dispose();
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc5_:class_3127 = null;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc8_:class_3127 = null;
         var _loc9_:IItemListWindow = null;
         var _loc7_:int = 0;
         var _loc4_:class_3151 = null;
         loop1:
         switch(param1.type)
         {
            case "WME_CLICK":
               switch(param2.name)
               {
                  case "header_button_close":
                     hide(_roomObject);
                     break loop1;
                  case "playlist_prev":
                     ownHandler.switchToPreviousVideo(_roomObject.getId());
                     break loop1;
                  case "playlist_next":
                     ownHandler.switchToNextVideo(_roomObject.getId());
                     break loop1;
                  default:
                     if(param2 is IRegionWindow)
                     {
                        if(var_1525 != null)
                        {
                           var_1525.findChildByName("item_background").color = 4294967295;
                        }
                        if(var_1525 == param2)
                        {
                           var_1525 = null;
                           ownHandler.selectPlaylist(_roomObject.getId(),"");
                        }
                        else
                        {
                           var_1525 = param2 as class_3151;
                           var_1525.findChildByName("item_background").color = 4291611903;
                           ownHandler.selectPlaylist(_roomObject.getId(),var_1525.name);
                        }
                        updateButtons();
                        break loop1;
                     }
               }
               break;
            case "WE_RESIZE":
               switch(param2.name)
               {
                  case "video_viewer":
                     if(_window != null)
                     {
                        if((_loc5_ = _window.findChildByName("right_pane")) != null)
                        {
                           _loc3_ = (_loc6_ = -29) * 0.66;
                           (_loc8_ = _window.findChildByName("video_background")).width = _loc3_;
                           _loc5_.x = _loc8_.right + 9;
                           _loc5_.width = _loc6_ - _loc3_;
                           break loop1;
                        }
                        break loop1;
                     }
                     break loop1;
                  case "playlists":
                     if((_loc9_ = param2 as IItemListWindow) != null)
                     {
                        _loc7_ = 0;
                        while(_loc7_ < _loc9_.numListItems)
                        {
                           (_loc4_ = _loc9_.getListItemAt(_loc7_) as class_3151).findChildByName("item_background").width = _loc9_.width;
                           _loc4_.findChildByName("item_contents").width = _loc9_.width;
                           _loc4_.findChildByName("item_description").width = _loc9_.width - 22;
                           _loc7_++;
                        }
                        break loop1;
                     }
                     break loop1;
                  case "video_wrapper":
                     if(var_171 != null)
                     {
                        var_171.setSize(param2.width,param2.height);
                        break loop1;
                     }
               }
         }
      }
      
      public function showVideo(param1:int, param2:String, param3:int, param4:int, param5:int) : void
      {
         if(_roomObject == null || _roomObject.getId() != param1)
         {
            return;
         }
         var _loc6_:Object = param3 > 0 || param4 > 0 ? {
            "videoId":param2,
            "startSeconds":param3,
            "endSeconds":param4,
            "suggestedQuality":"large"
         } : {
            "videoId":param2,
            "suggestedQuality":"large"
         };
         if(var_171 != null)
         {
            loadVideo(_loc6_);
            _queuedVideoParams = null;
         }
         else
         {
            _queuedVideoParams = _loc6_;
         }
         var_2637 = param5;
      }
      
      public function controlVideo(param1:int, param2:int) : void
      {
         if(_roomObject == null || _roomObject.getId() != param1)
         {
            return;
         }
         if(_window != null)
         {
            if(var_171)
            {
               switch(param2 - 1)
               {
                  case 0:
                     var_2637 = 1;
                     var_171.playVideo();
                     break;
                  case 1:
                     var_2637 = 2;
                     var_171.pauseVideo();
               }
            }
         }
      }
      
      private function loadVideo(param1:Object) : void
      {
         var_2844 = param1.videoId;
         var _loc2_:* = var_2844 != "";
         if(_loc2_)
         {
            var_171.loadVideoById(param1);
            _habboTracking.trackEventLog("YouTubeTVs",var_2844,"video.started");
         }
         else
         {
            var_171.stopVideo();
         }
         if(_window != null)
         {
            _window.findChildByName("no_videos_label").visible = !_loc2_;
            _window.findChildByName("video_wrapper").visible = _loc2_;
         }
      }
      
      public function populatePlaylists(param1:int, param2:Vector.<class_1618>, param3:String) : void
      {
         var _loc4_:class_3151 = null;
         if(_roomObject == null || _roomObject.getId() != param1 || _window == null || var_2536 == null)
         {
            return;
         }
         var _loc6_:IItemListWindow;
         if((_loc6_ = _window.findChildByName("playlists") as IItemListWindow) == null)
         {
            return;
         }
         _loc6_.destroyListItems();
         var_1525 = null;
         for each(var _loc5_ in param2)
         {
            (_loc4_ = var_2536.clone() as class_3151).name = _loc5_.playlistId;
            _loc4_.findChildByName("item_background").width = _loc6_.width;
            if(_loc5_.playlistId == param3)
            {
               _loc4_.findChildByName("item_background").color = 4291611903;
               var_1525 = _loc4_;
            }
            _loc4_.findChildByName("item_contents").width = _loc6_.width;
            _loc4_.findChildByName("item_title").caption = _loc5_.title;
            _loc4_.findChildByName("item_description").caption = _loc5_.description.replace(/\r/g,"");
            _loc4_.findChildByName("item_description").width = _loc6_.width - 22;
            _loc6_.addListItem(_loc4_);
         }
         updateButtons();
      }
      
      private function updateButtons() : void
      {
         if(_window == null)
         {
            return;
         }
         if(var_1525 != null)
         {
            _window.findChildByName("playlist_prev").enable();
            _window.findChildByName("playlist_next").enable();
         }
         else
         {
            _window.findChildByName("playlist_prev").disable();
            _window.findChildByName("playlist_next").disable();
         }
      }
   }
}
