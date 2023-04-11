package com.sulake.habbo.navigator.view
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.HabboNewNavigator;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.transitional.LegacyNavigator;
   import com.sulake.habbo.session.enum.RoomTradingLevelEnum;
   import com.sulake.habbo.utils.FriendlyTime;
   import com.sulake.habbo.window.widgets.class_3366;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import package_11.class_1569;
   import package_2.class_728;
   import package_2.class_931;
   import package_2.class_997;
   import package_5.class_1126;
   
   public class RoomInfoPopup
   {
       
      
      private var _window:class_3151;
      
      private var _navigator:HabboNewNavigator;
      
      private var var_3163:Vector.<String>;
      
      private var var_229:class_1569 = null;
      
      private var _lastWindowPosition:Point;
      
      private var var_3436:Boolean = false;
      
      private var var_4249:Boolean;
      
      private var var_3279:Boolean = false;
      
      private var var_3868:Boolean;
      
      public function RoomInfoPopup(param1:HabboNewNavigator)
      {
         var_3163 = new Vector.<String>(0);
         _lastWindowPosition = new Point(-1,-1);
         super();
         _navigator = param1;
      }
      
      public function show(param1:Boolean) : void
      {
         if(param1)
         {
            if(!_window)
            {
               createWindow();
            }
            populate();
            _window.visible = true;
            var_3436 = false;
            var_3279 = false;
         }
         else if(_window)
         {
            _window.visible = false;
         }
      }
      
      public function get visible() : Boolean
      {
         if(!_window)
         {
            return false;
         }
         return _window.visible;
      }
      
      public function showAt(param1:Boolean, param2:int, param3:int) : void
      {
         var _loc5_:Point = null;
         var _loc4_:* = !this.visible;
         show(param1);
         if(param1)
         {
            _loc5_ = new Point(param2,param3 - 0);
            if(_lastWindowPosition != _loc5_)
            {
               if(_loc4_ && param1 && var_229)
               {
                  _navigator.trackEventLog("browse.openroominfo","Results",var_229.roomName,var_229.flatId);
               }
            }
            position = _loc5_;
            _window.activate();
         }
      }
      
      public function setData(param1:class_1569) : void
      {
         this.var_229 = param1;
      }
      
      public function getGlobalRectangle(param1:Rectangle) : void
      {
         _window.getGlobalRectangle(param1);
      }
      
      private function set position(param1:Point) : void
      {
         _window.position = param1;
         _lastWindowPosition = param1;
      }
      
      private function get roomIsHome() : Boolean
      {
         if(var_3436)
         {
            return var_4249;
         }
         return _navigator.legacyNavigator.isRoomHome(var_229.flatId);
      }
      
      private function set roomIsHome(param1:Boolean) : void
      {
         var_3436 = true;
         var_4249 = param1;
      }
      
      private function get roomIsFavorite() : Boolean
      {
         if(var_3279)
         {
            return var_3868;
         }
         return _navigator.legacyNavigator.isRoomFavorite(var_229.flatId);
      }
      
      private function set roomIsFavorite(param1:Boolean) : void
      {
         var_3279 = true;
         var_3868 = param1;
      }
      
      private function populate() : void
      {
         var _loc7_:class_1126 = null;
         var _loc5_:String = null;
         var _loc1_:String = null;
         var _loc10_:int = 0;
         if(var_229 == null)
         {
            return;
         }
         var _loc4_:IItemListWindow = IItemListWindow(_window.findChildByName("main_content"));
         var _loc9_:IItemListWindow = IItemListWindow(_window.findChildByName("header_content"));
         var _loc6_:IItemListWindow = IItemListWindow(_window.findChildByName("bottom_itemlist"));
         _window.findChildByName("room_owner_region").visible = var_229.showOwner;
         _window.findChildByName("room_group_region").visible = true;
         _window.findChildByName("room_name").caption = var_229.roomName;
         _window.findChildByName("room_desc").caption = var_229.description;
         _window.findChildByName("owner_name").caption = var_229.ownerName;
         _window.findChildByName("room_owner_region").id = var_229.ownerId;
         _window.findChildByName("room_owner_region").procedure = ownerLinkProcedure;
         _window.findChildByName("favorite_region").procedure = roomFavoriteRegionProcedure;
         _window.findChildByName("home_region").procedure = homeRoomRegionProcedure;
         _window.findChildByName("settings_region").procedure = settingsRegionProcedure;
         _window.findChildByName("settings_container").visible = var_229.ownerName == _navigator.sessionData.userName;
         if(_navigator.context.configuration.getBoolean("room.report.enabled") && var_229.ownerName != _navigator.sessionData.userName)
         {
            _window.findChildByName("report_region").id = var_229.ownerId;
            _window.findChildByName("report_region").procedure = reportRegionProcedure;
            _window.findChildByName("report_region").visible = true;
            _window.findChildByName("report_container").visible = true;
         }
         else
         {
            _window.findChildByName("report_region").visible = false;
            _window.findChildByName("report_container").visible = false;
         }
         IItemListWindow(_window.findChildByName("midBottom_itemlist")).arrangeListItems();
         IStaticBitmapWrapperWindow(_window.findChildByName("favorite_icon")).assetUri = "newnavigator_icon_fav_" + (roomIsFavorite ? "yes" : "no");
         IStaticBitmapWrapperWindow(_window.findChildByName("home_icon")).assetUri = "newnavigator_icon_home_" + (roomIsHome ? "yes" : "no");
         var _loc8_:Boolean = true;
         _window.findChildByName("room_group_badge").visible = _loc8_;
         _window.findChildByName("room_owner_region").visible = var_229.showOwner;
         _window.findChildByName("room_group_region").visible = _loc8_;
         _window.findChildByName("room_group_owner_container").visible = _loc8_ || false;
         if(_loc8_)
         {
            class_3366(class_3217(_window.findChildByName("room_group_badge")).widget).badgeId = var_229.groupBadgeCode;
            _window.findChildByName("group_name").caption = var_229.groupName;
            _window.findChildByName("group_name").id = var_229.habboGroupId;
            _window.findChildByName("room_group_region").id = var_229.habboGroupId;
            _window.findChildByName("room_group_region").procedure = groupLinkProcedure;
            if(_loc7_ = _navigator.getCachedGroupDetails(var_229.habboGroupId))
            {
               if(_loc7_.isOwner)
               {
                  IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_admin")).assetUri = "newnavigator_icon_group_owner";
               }
               else if(_loc7_.isAdmin)
               {
                  IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_admin")).assetUri = "newnavigator_icon_group_admin";
               }
               else
               {
                  IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_admin")).assetUri = null;
               }
               IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_size")).assetUri = "${image.library.url}guilds/grouptype_icon_" + _loc7_.type + ".png";
               IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_furnish")).assetUri = !_loc7_.membersCanDecorate ? null : "${image.library.url}guilds/group_decorate_icon.png";
            }
         }
         else
         {
            IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_admin")).assetUri = null;
            IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_size")).assetUri = null;
            IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_furnish")).assetUri = null;
         }
         var _loc3_:Boolean = false;
         if(_loc3_)
         {
            _loc5_ = _navigator.localization.getLocalizationWithParams("navigator.eventsettings.name") + ": " + var_229.roomAdName;
            _loc1_ = _navigator.localization.getLocalizationWithParams("navigator.eventsettings.desc") + ": " + var_229.roomAdDescription + "\n";
            _loc1_ += _navigator.localization.getLocalizationWithParams("roomad.event.expiration_time") + FriendlyTime.getFriendlyTime(_navigator.localization,0);
            _window.findChildByName("event_name").caption = _loc5_;
            _window.findChildByName("event_desc").caption = _loc1_;
         }
         _loc6_.getListItemByName("event_info").visible = _loc3_;
         _loc9_.arrangeListItems();
         var_3163 = new Vector.<String>(0);
         var _loc2_:IItemListWindow = IItemListWindow(_window.findChildByName("tag_list"));
         _loc2_.destroyListItems();
         _loc10_ = 0;
         while(_loc10_ < var_229.tags.length)
         {
            var_3163.push(var_229.tags[_loc10_]);
            _loc2_.addListItem(getNewTagItem(var_229.tags[_loc10_],_loc10_));
            _loc10_++;
         }
         clearProperties();
         addProperty("properties","${navigator.roompopup.property.trading}",RoomTradingLevelEnum.getLocalizationKey(var_229.tradeMode));
         if(_navigator.context.configuration.getBoolean("room.ranking.enabled"))
         {
            addProperty("properties","${navigator.roompopup.property.ranking}",var_229.ranking.toString());
         }
         addProperty("properties","${navigator.roompopup.property.max_users}",var_229.maxUserCount.toString());
         IStaticBitmapWrapperWindow(_window.findChildByName("room_thumbnail")).assetUri = "newnavigator_default_room";
         if(_navigator.sessionData.isPerkAllowed("NAVIGATOR_ROOM_THUMBNAIL_CAMERA"))
         {
            if(false)
            {
               if(_navigator.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
               {
                  IStaticBitmapWrapperWindow(_window.findChildByName("room_thumbnail")).assetUri = _navigator.getProperty("navigator.thumbnail.url_base") + var_229.flatId + ".png";
               }
               else
               {
                  IStaticBitmapWrapperWindow(_window.findChildByName("room_thumbnail")).assetUri = _navigator.getProperty("image.library.url") + var_229.officialRoomPicRef;
               }
            }
            else
            {
               IStaticBitmapWrapperWindow(_window.findChildByName("room_thumbnail")).assetUri = _navigator.getProperty("navigator.thumbnail.url_base") + var_229.flatId + ".png";
            }
         }
         _loc6_.arrangeListItems();
         _loc4_.arrangeListItems();
      }
      
      private function clearProperties() : void
      {
         IItemListWindow(_window.findChildByName("properties")).destroyListItems();
      }
      
      private function addProperty(param1:String, param2:String, param3:String) : void
      {
         var _loc5_:IItemListWindow = IItemListWindow(_window.findChildByName(param1));
         var _loc4_:class_3151;
         (_loc4_ = class_3151(_navigator.windowManager.buildFromXML(XML(_navigator.assets.getAssetByName("property_xml").content)))).findChildByName("property_name").caption = param2;
         _loc4_.findChildByName("property_value").caption = param3;
         _loc5_.addListItem(_loc4_);
      }
      
      private function getNewTagItem(param1:String, param2:int) : class_3127
      {
         var _loc3_:class_3151 = class_3151(_navigator.windowManager.buildFromXML(XML(_navigator.assets.getAssetByName("tag_xml").content)));
         var _loc4_:IRegionWindow;
         (_loc4_ = IRegionWindow(_loc3_.findChildByName("tag_region"))).id = param2;
         _loc4_.procedure = tagRegionProcedure;
         _loc4_.findChildByName("tag_text").caption = "#" + param1;
         return _loc4_;
      }
      
      private function createWindow() : void
      {
         _window = class_3151(_navigator.windowManager.buildFromXML(XML(_navigator.assets.getAssetByName("room_info_popup_bubble_xml").content)));
      }
      
      private function ownerLinkProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _navigator.getExtendedProfile(param2.id);
            destroy();
         }
      }
      
      private function groupLinkProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _navigator.getGuildInfo(param2.id);
            destroy();
         }
      }
      
      private function reportRegionProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _navigator.habboHelp.reportRoom(var_229.flatId,var_229.roomName,var_229.description);
            destroy();
         }
      }
      
      private function tagRegionProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _navigator.performTagSearch(var_3163[param2.id]);
            destroy();
         }
      }
      
      private function settingsRegionProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:RoomSettingsCtrl = null;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl;
            _loc3_.startRoomSettingsEditFromNavigator(var_229.flatId,var_229.habboGroupId);
            destroy();
         }
      }
      
      private function roomFavoriteRegionProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(!roomIsFavorite)
            {
               _navigator.communication.connection.send(new class_728(var_229.flatId));
               roomIsFavorite = true;
            }
            else
            {
               _navigator.communication.connection.send(new class_997(var_229.flatId));
               roomIsFavorite = false;
            }
            IStaticBitmapWrapperWindow(_window.findChildByName("favorite_icon")).assetUri = "newnavigator_icon_fav_" + (roomIsFavorite ? "yes" : "no");
         }
      }
      
      private function homeRoomRegionProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(!roomIsHome)
            {
               _navigator.communication.connection.send(new class_931(var_229.flatId));
               roomIsHome = true;
            }
            IStaticBitmapWrapperWindow(_window.findChildByName("home_icon")).assetUri = "newnavigator_icon_home_" + (roomIsHome ? "yes" : "no");
         }
      }
      
      private function destroy() : void
      {
         if(_window)
         {
            _window.destroy();
         }
         _window = null;
      }
   }
}
