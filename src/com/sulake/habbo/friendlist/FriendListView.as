package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class FriendListView
   {
      
      private static const DEFAULT_LOCATION:Point = new Point(110,50);
      
      private static const MIN_LEFT_MARGIN:int = 110;
      
      private static const const_551:int = 1;
       
      
      private var _friendList:com.sulake.habbo.friendlist.HabboFriendList;
      
      private var var_3567:com.sulake.habbo.friendlist.FriendListTabsView;
      
      private var var_1439:class_3281;
      
      private var var_4006:class_3151;
      
      private var _footer:class_3151;
      
      private var var_3469:ITextWindow;
      
      private var var_2259:int = -1;
      
      private var _lastWindowWidth:int = -1;
      
      private var _ignoreResizeEvents:Boolean;
      
      public function FriendListView(param1:com.sulake.habbo.friendlist.HabboFriendList)
      {
         super();
         _friendList = param1;
         var_3567 = new com.sulake.habbo.friendlist.FriendListTabsView(_friendList);
      }
      
      public function openFriendList() : void
      {
         if(var_1439 == null)
         {
            prepare();
            var_1439.position = DEFAULT_LOCATION;
         }
         else
         {
            var_1439.visible = true;
            var_1439.activate();
         }
      }
      
      public function showInfo(param1:class_3134, param2:String) : void
      {
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.type == "WME_OUT")
         {
            var_3469.text = "";
         }
         else if(_loc3_.type == "WME_OVER")
         {
            var_3469.text = param2;
         }
      }
      
      public function refresh(param1:String) : void
      {
         if(this.var_1439 == null)
         {
            return;
         }
         var_3567.refresh(param1);
         refreshWindowSize();
      }
      
      public function close() : void
      {
         if(this.var_1439 != null)
         {
            this.var_1439.visible = false;
         }
      }
      
      public function isOpen() : Boolean
      {
         return var_1439 && false;
      }
      
      private function prepare() : void
      {
         var_1439 = class_3281(_friendList.getXmlWindow("main_window"));
         var_1439.findChildByTag("close").procedure = onWindowClose;
         var_4006 = class_3151(var_1439.content.findChildByName("main_content"));
         _footer = class_3151(var_1439.content.findChildByName("footer"));
         var_3567.prepare(var_4006);
         var_1439.procedure = onWindow;
         var_1439.content.setParamFlag(3072,false);
         var_1439.content.setParamFlag(0,true);
         var_1439.header.setParamFlag(192,false);
         var_1439.header.setParamFlag(0,true);
         var_1439.content.setParamFlag(192,false);
         var_1439.content.setParamFlag(0,true);
         var _loc1_:Boolean = _friendList.getBoolean("friendship.category.management.enabled");
         if(_loc1_ && _friendList.getInteger("spaweb",0) != 1)
         {
            var_1439.findChildByName("open_edit_ctgs_but").procedure = onEditCategoriesButtonClick;
         }
         else
         {
            var_1439.findChildByName("open_edit_ctgs_but").visible = false;
         }
         var_3469 = ITextWindow(var_1439.findChildByName("info_text"));
         var_3469.text = "";
         _friendList.refreshButton(var_1439,"open_edit_ctgs",true,null,0);
         refresh("prepare");
         var_1439.height = 350;
         var_1439.width = 230;
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         class_14.log("Close window");
         var_1439.visible = false;
         _friendList.trackFriendListEvent("HABBO_FRIENDLIST_TRACKING_EVENT_CLOSED");
         _friendList.categories.view.refreshed();
      }
      
      private function onWindow(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_RELOCATE" || param1.type == "WE_RESIZED")
         {
            _friendList.categories.view.refreshed();
         }
         if(param1.type != "WE_RESIZED" || param2 != var_1439)
         {
            return;
         }
         if(this._ignoreResizeEvents)
         {
            return;
         }
         var _loc3_:int = var_2259 == -1 ? 0 : 0 - var_2259;
         var _loc4_:int = _lastWindowWidth == -1 ? 0 : 0 - _lastWindowWidth;
         _friendList.tabs.tabContentHeight = Math.max(100,_friendList.tabs.tabContentHeight + _loc3_);
         _friendList.tabs.windowWidth = Math.max(147,_friendList.tabs.windowWidth + _loc4_);
         refresh("resize: " + _loc3_);
      }
      
      private function refreshWindowSize() : void
      {
         this._ignoreResizeEvents = true;
         _footer.visible = false;
         _footer.y = Util.getLowestPoint(var_1439.content);
         _footer.width = _friendList.tabs.windowWidth;
         _footer.visible = true;
         var_1439.content.height = Util.getLowestPoint(var_1439.content);
         var_1439.content.width = _friendList.tabs.windowWidth - 10;
         var_1439.header.width = _friendList.tabs.windowWidth - 10;
         var_1439.height = var_1439.content.height + 30;
         var_1439.width = _friendList.tabs.windowWidth;
         this._ignoreResizeEvents = false;
         var_1439.scaler.setParamFlag(12288,false);
         var_1439.scaler.setParamFlag(12288,this._friendList.tabs.findSelectedTab() != null);
         var_1439.scaler.setParamFlag(192,false);
         var_1439.scaler.setParamFlag(3072,false);
         var_1439.scaler.x = 0 - var_1439.scaler.width;
         var_1439.scaler.y = 0 - var_1439.scaler.height;
         var_2259 = var_1439.height;
         _lastWindowWidth = var_1439.width;
         class_14.log("RESIZED: " + _friendList.tabs.windowWidth);
      }
      
      private function onEditCategoriesButtonClick(param1:class_3134, param2:class_3127) : void
      {
         _friendList.view.showInfo(param1,"${friendlist.tip.preferences}");
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         class_14.log("Edit categories clicked");
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         _friendList.openHabboWebPage("link.format.friendlist.pref",new Dictionary(),_loc3_.stageX,_loc3_.stageY);
      }
      
      public function get mainWindow() : class_3151
      {
         return var_1439;
      }
      
      public function alignBottomLeftTo(param1:Point) : void
      {
         var _loc2_:Point = param1.clone();
         _loc2_.y -= 0;
         var _loc3_:int = int(_friendList.windowManager.getWindowContext(1).getDesktopWindow().width);
         _loc2_.x = Math.min(_loc3_ - 0,_loc2_.x);
         _loc2_.x = Math.max(110,_loc2_.x);
         var_1439.position = _loc2_;
      }
   }
}
