package com.sulake.habbo.navigator
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.ExtendedProfileIcon;
   import com.sulake.habbo.utils.FriendlyTime;
   import package_11.class_1569;
   import package_11.class_1625;
   import package_7.class_313;
   
   public class RoomPopupCtrl extends PopupCtrl
   {
       
      
      private var _details:class_3151;
      
      private var var_189:class_1569;
      
      private var var_2474:com.sulake.habbo.navigator.TagRenderer;
      
      private var _navigator:com.sulake.habbo.navigator.class_1686;
      
      private var var_2801:com.sulake.habbo.navigator.GuildInfoCtrl;
      
      public function RoomPopupCtrl(param1:com.sulake.habbo.navigator.class_1686, param2:int, param3:int)
      {
         super(HabboNavigator(param1),param2,param3,"grs_guest_room_details_long");
         _navigator = param1;
         var_2474 = new com.sulake.habbo.navigator.TagRenderer(param1,hideInstantly);
         var_2801 = new com.sulake.habbo.navigator.GuildInfoCtrl(_navigator);
      }
      
      public function set room(param1:class_1569) : void
      {
         var_189 = param1;
      }
      
      override public function refreshContent(param1:class_3151) : void
      {
         if(_details == null)
         {
            _details = class_3151(param1.findChildByName("details_container"));
         }
         _details.visible = true;
         var_2474.useHashTags = true;
         Util.hideChildren(_details);
         var_2801.refresh(_details,var_189);
         refreshRoomName(_details,var_189);
         refreshOwnerName();
         refreshTextWithCaption("roomctg",_details,getRoomCtg(var_189.categoryId));
         refreshRoomDesc(_details,var_189);
         refreshExtraCont();
         refreshEventInfo(var_189);
         refreshRoomSettings();
         refreshInfo(_details,"trading_allowed",false);
         refreshInfo(_details,"doormode_doorbell",false);
         refreshInfo(_details,"doormode_password",false);
         refreshInfo(_details,"doormode_invisible",false);
         Util.moveChildrenToColumn(_details,["guild_info","roomname","roomctg_cont","roomowner_cont","roomdesc","extra_cont","doormode_doorbell","doormode_password","doormode_invisible","trading_allowed","eventinfo_cont","roomsettings_cont"],0,0);
         _details.findChildByName("guild_info").x = 2;
         _details.height = Util.getLowestPoint(_details);
      }
      
      private function refreshOwnerName() : void
      {
         var _loc1_:ITextWindow = ITextWindow(_details.findChildByName("roomowner"));
         var _loc2_:IRegionWindow = IRegionWindow(_details.findChildByName("roomowner_cont"));
         _loc2_.procedure = onOwnerName;
         _loc1_.caption = var_189.showOwner ? var_189.ownerName : "";
         _loc2_.visible = var_189.showOwner;
         ExtendedProfileIcon.setUserInfoState(false,_loc2_);
         Util.layoutChildrenInArea(_loc2_,1000,10,2);
      }
      
      private function refreshRoomSettings() : void
      {
         var _loc2_:IRegionWindow = null;
         var _loc1_:ITextWindow = null;
         _loc2_ = IRegionWindow(_details.findChildByName("roomsettings_cont"));
         _loc1_ = ITextWindow(_details.findChildByName("roomsettings"));
         _loc2_.procedure = onRoomSettings;
         _loc2_.visible = _navigator.sessionData.userId == var_189.ownerId;
         Util.layoutChildrenInArea(_loc2_,1000,10,2);
      }
      
      private function refreshExtraCont() : void
      {
         var _loc1_:class_3151 = class_3151(_details.findChildByName("extra_cont"));
         Util.hideChildren(_loc1_);
         var_2474.refreshTags(_loc1_,var_189.tags);
         if(false)
         {
            refreshTextWithCaption("rating",_loc1_,"undefined");
            _loc1_.findChildByName("rating_cont").visible = true;
         }
         if(Util.hasVisibleChildren(_loc1_))
         {
            Util.moveChildrenToColumn(_loc1_,["tags","startedat_cont","rating_cont"],0,3);
            _loc1_.height = Util.getLowestPoint(_loc1_) + 4;
            _loc1_.visible = true;
         }
      }
      
      private function refreshEventInfo(param1:class_1569) : void
      {
         if(param1.roomAdName == null || param1.roomAdName.length == 0)
         {
            return;
         }
         var _loc2_:class_3151 = class_3151(_details.findChildByName("eventinfo_cont"));
         Util.hideChildren(_loc2_);
         var _loc4_:ITextWindow = ITextWindow(_loc2_.findChildByName("eventinfo_name"));
         var _loc7_:ITextWindow = ITextWindow(_loc2_.findChildByName("eventinfo_desc"));
         var _loc3_:ITextWindow = ITextWindow(_loc2_.findChildByName("eventinfo_expirationtime"));
         var _loc6_:ITextWindow = ITextWindow(_loc2_.findChildByName("eventinfo.caption"));
         _loc4_.caption = param1.roomAdName;
         _loc7_.caption = param1.roomAdDescription;
         _loc3_.caption = FriendlyTime.getFriendlyTime(_navigator.localization,param1.roomAdExpiresInMin * 60);
         _loc7_.height = _loc7_.textHeight + 10;
         _loc3_.y = _loc7_.y + _loc7_.height;
         _loc2_.height = _loc4_.height + _loc7_.height + _loc3_.height + 20;
         var _loc5_:class_3151;
         (_loc5_ = _loc2_.findChildByName("eventinfo_child_container") as class_3151).x = _loc6_.textWidth + 5;
         _loc5_.height = Util.getLowestPoint(_loc5_) + 5;
         _loc2_.visible = true;
         _loc6_.visible = true;
         _loc5_.visible = true;
      }
      
      private function refreshRoomName(param1:class_3151, param2:class_1569) : void
      {
         var _loc3_:ITextWindow = ITextWindow(param1.getChildByName("roomname"));
         _loc3_.visible = true;
         _loc3_.text = param2.roomName;
         _loc3_.height = _loc3_.textHeight + 3;
      }
      
      private function refreshRoomDesc(param1:class_3151, param2:class_1569) : void
      {
         if(param2.description == "")
         {
            return;
         }
         var _loc4_:ITextWindow;
         (_loc4_ = ITextWindow(param1.getChildByName("roomdesc"))).text = param2.description;
         _loc4_.height = _loc4_.textHeight + 10;
         _loc4_.y = Util.getLowestPoint(param1);
         _loc4_.visible = true;
      }
      
      private function refreshTextWithCaption(param1:String, param2:class_3151, param3:String) : void
      {
         var _loc5_:class_3151;
         (_loc5_ = class_3151(param2.findChildByName(param1 + "_cont"))).visible = true;
         var _loc6_:ITextWindow = ITextWindow(_loc5_.getChildByName(param1));
         var _loc4_:ITextWindow = ITextWindow(_loc5_.getChildByName(param1 + ".caption"));
         _loc6_.text = param3;
         Util.moveChildrenToRow(_loc5_,[param1 + ".caption",param1],_loc4_.x,0,2);
      }
      
      private function refreshInfo(param1:class_3151, param2:String, param3:Boolean) : void
      {
         if(!param3)
         {
            return;
         }
         var _loc4_:class_3151;
         (_loc4_ = class_3151(param1.findChildByName(param2))).visible = true;
         navigator.refreshButton(_loc4_,param2,true,null,0);
      }
      
      private function getEventCtg(param1:int) : String
      {
         var _loc3_:String = "roomevent_type_" + param1;
         var _loc2_:String = navigator.getText(_loc3_);
         return _loc2_ == null ? "" : _loc2_;
      }
      
      private function getRoomCtg(param1:int) : String
      {
         for each(var _loc2_ in navigator.data.allCategories)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_.nodeName;
            }
         }
         return "";
      }
      
      private function onOwnerName(param1:class_3134, param2:class_3127) : void
      {
         ExtendedProfileIcon.onEntry(param1,param2);
         if(param1.type == "WME_CLICK")
         {
            _navigator.trackGoogle("extendedProfile","navigator_roomPopup");
            _navigator.send(new class_313(var_189.ownerId));
            this.hideInstantly();
         }
      }
      
      private function onRoomSettings(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _navigator.trackGoogle("roomInfo","editRoomSettings");
            _navigator.roomSettingsCtrl.startRoomSettingsEditFromNavigator(var_189.flatId,var_189.habboGroupId);
            this.hideInstantly();
         }
      }
   }
}
