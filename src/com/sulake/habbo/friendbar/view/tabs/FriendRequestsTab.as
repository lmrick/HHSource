package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.components.class_3349;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.data.FriendRequest;
   import flash.display.BitmapData;
   
   public class FriendRequestsTab extends Tab
   {
      
      protected static const REQUESTS_WINDOW_RESOURCE:String = "friend_requests_tab_xml";
      
      protected static const ICON:String = "icon";
      
      protected static const LABEL:String = "label";
      
      protected static const HEADER:String = "header";
      
      protected static const CANVAS:String = "canvas";
      
      protected static const BUBBLE:String = "bubble";
      
      protected static const REQUEST_LIST:String = "request_entity_list";
      
      protected static const NAME:String = "name";
      
      protected static const COUNTER:String = "badge_counter";
      
      protected static const REGION_PROFILE:String = "region_profile";
      
      protected static const REGION_PROFILE_NAME:String = "region_profile_name";
      
      protected static const const_702:String = "button_accept_all";
      
      protected static const const_607:String = "click_area_discard_all";
      
      protected static const const_967:String = "button_close";
      
      protected static const BUTTON_ACCEPT:String = "button_accept";
      
      protected static const const_655:String = "click_area_discard";
      
      protected static const const_527:String = "text_discard";
      
      private static var var_3497:com.sulake.habbo.friendbar.view.tabs.FriendRequestsTab;
      
      private static const DEFAULT_COLOR:uint = 4294625561;
      
      private static const const_567:uint = 4294957414;
      
      private static const const_1059:uint = 4289431312;
      
      private static const const_1150:uint = 4290616362;
      
      private static const REGION_REJECT_COLOR_EXPOSED:uint = 16770666;
      
      private static const REGION_REJECT_COLOR_NORMAL:uint = 16777215;
       
      
      private var var_103:Array;
      
      private var var_3199:Boolean = false;
      
      private var _entity:class_3151;
      
      public function FriendRequestsTab()
      {
         super();
         _window = allocateRequestsTabWindow();
      }
      
      public static function allocate(param1:Array) : com.sulake.habbo.friendbar.view.tabs.FriendRequestsTab
      {
         var _loc2_:com.sulake.habbo.friendbar.view.tabs.FriendRequestsTab = !!var_3497 ? var_3497 : new com.sulake.habbo.friendbar.view.tabs.FriendRequestsTab();
         _loc2_.var_1501 = false;
         _loc2_.var_103 = param1;
         _loc2_._window.findChildByName("badge_counter").caption = String(param1.length);
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            releaseRequestsTabWindow(_window);
            _window = null;
         }
         if(_entity)
         {
            _entity.dispose();
            _entity = null;
         }
         super.dispose();
      }
      
      override public function recycle() : void
      {
         var _loc1_:class_3349 = null;
         var _loc2_:IItemListWindow = null;
         if(!disposed)
         {
            if(!var_1501)
            {
               if(_window)
               {
                  _loc1_ = _window.findChildByName("bubble") as class_3349;
                  if(_loc1_)
                  {
                     _loc2_ = _loc1_.content.getChildByName("request_entity_list") as IItemListWindow;
                     if(_loc2_)
                     {
                        while(_loc2_.numListItems > 0)
                        {
                           _loc2_.removeListItemAt(0).dispose();
                        }
                     }
                  }
               }
               var_3199 = false;
               var_103 = null;
               var_1501 = true;
               var_3497 = this;
            }
         }
      }
      
      override public function select(param1:Boolean) : void
      {
         var _loc3_:class_3349 = null;
         var _loc7_:IItemListWindow = null;
         var _loc8_:class_3151 = null;
         var _loc2_:FriendRequest = null;
         var _loc5_:class_3282 = null;
         var _loc9_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:BitmapData = null;
         if(!selected)
         {
            if(_window)
            {
               _loc3_ = _window.findChildByName("bubble") as class_3349;
               if(_loc3_)
               {
                  _loc3_.visible = true;
                  if(!var_3199)
                  {
                     if(_loc7_ = _loc3_.content.getChildByName("request_entity_list") as IItemListWindow)
                     {
                        _loc9_ = 0;
                        _loc6_ = 0;
                        while(_loc6_ < var_103.length)
                        {
                           (_loc8_ = _entity.clone() as class_3151).color = _loc6_ % 2 == 0 ? 4289431312 : 4290616362;
                           _loc2_ = var_103[_loc6_];
                           _loc8_.id = _loc2_.id;
                           _loc8_.findChildByName("name").caption = _loc2_.name;
                           _loc5_ = _loc8_.findChildByName("canvas") as class_3282;
                           if(_loc4_ = VIEW.getAvatarFaceBitmap(_loc2_.figure))
                           {
                              _loc5_.disposesBitmap = false;
                              _loc5_.bitmap = _loc4_;
                              _loc5_.width = _loc4_.width;
                              _loc5_.height = _loc4_.height;
                              _loc5_.disposesBitmap = true;
                           }
                           _loc7_.addListItem(_loc8_);
                           _loc9_ += _loc8_.height + _loc7_.spacing;
                           _loc6_++;
                        }
                        _loc7_.height = _loc9_;
                     }
                  }
                  var_3199 = true;
               }
            }
            super.select(param1);
         }
      }
      
      override public function deselect(param1:Boolean) : void
      {
         var _loc2_:class_3127 = null;
         if(selected)
         {
            if(_window)
            {
               _loc2_ = _window.findChildByName("bubble");
               if(_loc2_)
               {
                  _loc2_.visible = false;
               }
            }
            super.deselect(param1);
         }
      }
      
      override protected function expose() : void
      {
         super.expose();
         _window.color = exposed ? 4294957414 : 4294625561;
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         _window.color = exposed ? 4294957414 : 4294625561;
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
      }
      
      private function allocateRequestsTabWindow() : class_3151
      {
         var _loc8_:BitmapDataAsset = null;
         var _loc1_:class_3151 = WINDOWING.buildFromXML(ASSETS.getAssetByName("friend_requests_tab_xml").content as XML) as class_3151;
         var _loc7_:class_3282 = class_3282(_loc1_.findChildByName("canvas"));
         var _loc6_:IRegionWindow = IRegionWindow(_loc1_.findChildByName("header"));
         var _loc5_:IRegionWindow = IRegionWindow(_loc1_.findChildByName("region_profile"));
         var _loc2_:IRegionWindow = IRegionWindow(_loc1_.findChildByName("region_profile_name"));
         var _loc4_:class_3349 = _loc1_.findChildByName("bubble") as class_3349;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = WIDTH;
         _loc1_.height = HEIGHT;
         _loc1_.addEventListener("WME_CLICK",onMouseClick);
         _loc1_.addEventListener("WME_OVER",onMouseOver);
         _loc1_.addEventListener("WME_OUT",onMouseOut);
         _loc6_.addEventListener("WME_CLICK",onMouseClick);
         _loc6_.addEventListener("WME_OVER",onMouseOver);
         _loc6_.addEventListener("WME_OUT",onMouseOut);
         _loc5_.toolTipCaption = var_1690.getLocalization("infostand.profile.link.tooltip","");
         _loc5_.toolTipDelay = 100;
         _loc2_.toolTipCaption = var_1690.getLocalization("infostand.profile.link.tooltip","");
         _loc2_.toolTipDelay = 100;
         _loc7_.disposesBitmap = true;
         _loc4_.visible = false;
         _loc4_.y = -(_loc4_.height - (_loc4_.height - _loc4_.margins.bottom)) - 1;
         _loc4_.procedure = bubbleEventProc;
         _loc8_ = ASSETS.getAssetByName("add_friends_icon_png") as BitmapDataAsset;
         var _loc3_:class_3282 = _loc1_.findChildByName("icon") as class_3282;
         _loc3_.disposesBitmap = false;
         _loc3_.bitmap = _loc8_.content as BitmapData;
         var _loc9_:IItemListWindow;
         _entity = (_loc9_ = _loc4_.content.getChildByName("request_entity_list") as IItemListWindow).removeListItemAt(0) as class_3151;
         return _loc1_;
      }
      
      private function releaseRequestsTabWindow(param1:class_3151) : void
      {
         var _loc2_:IRegionWindow = null;
         var _loc3_:class_3282 = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener("WME_CLICK",onMouseClick);
            param1.removeEventListener("WME_OVER",onMouseOver);
            param1.removeEventListener("WME_OUT",onMouseOut);
            _loc2_ = IRegionWindow(param1.findChildByName("header"));
            _loc2_.removeEventListener("WME_CLICK",onMouseClick);
            _loc2_.removeEventListener("WME_OVER",onMouseOver);
            _loc2_.removeEventListener("WME_OUT",onMouseOut);
            param1.width = WIDTH;
            param1.height = HEIGHT;
            param1.color = 4294625561;
            _loc3_ = class_3282(param1.findChildByName("canvas"));
            if(_loc3_)
            {
               _loc3_.bitmap = null;
            }
            ITextWindow(param1.findChildByTag("label")).underline = false;
         }
      }
      
      private function bubbleEventProc(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "button_close":
                  if(selected)
                  {
                     VIEW.deSelect(true);
                     break;
                  }
                  break;
               case "button_accept_all":
                  DATA.acceptAllFriendRequests();
                  break;
               case "click_area_discard_all":
                  DATA.declineAllFriendRequests();
                  break;
               case "button_accept":
                  DATA.acceptFriendRequest(param2.parent.id);
                  break;
               case "click_area_discard":
                  DATA.declineFriendRequest(param2.parent.id);
                  break;
               case "region_profile":
                  TRACKING.trackGoogle("extendedProfile","friendBar_multipleFriendRequestsAvatar");
                  DATA.showProfile(param2.parent.id);
                  break;
               case "region_profile_name":
                  TRACKING.trackGoogle("extendedProfile","friendBar_multipleFriendRequestsName");
                  DATA.showProfile(param2.parent.id);
            }
         }
         else if(param1.type == "WME_OVER")
         {
            if(param2.name == "click_area_discard")
            {
               ITextWindow(class_3151(param2).getChildByName("text_discard")).textColor = 16770666;
            }
            if(param2.name == "region_profile_name")
            {
               ITextWindow(class_3151(param2).getChildByName("name")).underline = true;
            }
         }
         else if(param1.type == "WME_OUT")
         {
            if(param2.name == "click_area_discard")
            {
               ITextWindow(class_3151(param2).getChildByName("text_discard")).textColor = 16777215;
            }
            if(param2.name == "region_profile_name")
            {
               ITextWindow(class_3151(param2).getChildByName("name")).underline = false;
            }
         }
      }
      
      public function avatarImageReady(param1:FriendRequest, param2:BitmapData) : void
      {
         var _loc6_:IItemListWindow = null;
         var _loc7_:class_3151 = null;
         var _loc5_:int = 0;
         var _loc3_:class_3282 = null;
         if(disposed)
         {
            return;
         }
         var _loc4_:class_3349;
         if(_loc4_ = _window.findChildByName("bubble") as class_3349)
         {
            if(_loc6_ = _loc4_.content.getChildByName("request_entity_list") as IItemListWindow)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc6_.numListItems)
               {
                  if((_loc7_ = _loc6_.getListItemAt(_loc5_) as class_3151).id == param1.id)
                  {
                     _loc3_ = _loc7_.findChildByName("canvas") as class_3282;
                     _loc3_.disposesBitmap = true;
                     _loc3_.bitmap = param2;
                     _loc3_.width = param2.width;
                     _loc3_.height = param2.height;
                     return;
                  }
                  _loc5_++;
               }
            }
         }
      }
   }
}
