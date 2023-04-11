package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.window.*;
   import com.sulake.core.window.components.*;
   import com.sulake.core.window.events.*;
   import com.sulake.habbo.navigator.*;
   import flash.geom.Point;
   import package_11.class_1569;
   import package_2.class_728;
   import package_2.class_997;
   
   public class GuestRoomListCtrl implements IViewCtrl
   {
       
      
      protected var _navigator:HabboNavigator;
      
      private var _content:class_3151;
      
      private var var_19:IItemListWindow;
      
      private var var_1802:RoomPopupCtrl;
      
      private var var_1974:IScrollbarWindow;
      
      protected var var_2577:UserCountRenderer;
      
      private var var_2945:class_3151;
      
      private var var_4029:int;
      
      private var var_3950:Boolean;
      
      private var var_4011:int;
      
      private var _showRoomNumbers:Boolean;
      
      public function GuestRoomListCtrl(param1:HabboNavigator, param2:int, param3:Boolean)
      {
         super();
         _navigator = param1;
         var_4011 = param2;
         _showRoomNumbers = param3;
         var_1802 = new RoomPopupCtrl(_navigator,5,-5);
         var_2577 = new UserCountRenderer(_navigator);
      }
      
      public function dispose() : void
      {
         if(var_1802)
         {
            var_1802.dispose();
            var_1802 = null;
         }
         if(var_2577)
         {
            var_2577.dispose();
            var_2577 = null;
         }
      }
      
      public function set content(param1:class_3151) : void
      {
         _content = param1;
         var_19 = !!_content ? IItemListWindow(_content.findChildByName("item_list")) : null;
         var_1974 = !!_content ? IScrollbarWindow(_content.findChildByName("scroller")) : null;
         if(param1 == null && var_1802)
         {
            var_1802.closePopup();
         }
      }
      
      public function get content() : class_3151
      {
         return _content;
      }
      
      public function refresh() : void
      {
         var _loc4_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:Array = getRooms();
         var _loc1_:int = getVisibleEntryCount();
         var_19.autoArrangeItems = false;
         _loc4_ = 0;
         while(true)
         {
            if(_loc4_ < _loc3_.length)
            {
               refreshEntry(true,_loc4_,_loc3_[_loc4_]);
            }
            else
            {
               _loc2_ = refreshEntry(false,_loc4_,null);
               if(_loc2_)
               {
                  break;
               }
            }
            _loc4_++;
         }
         var_19.autoArrangeItems = true;
         if(var_1974 != null && getVisibleEntryCount() != _loc1_)
         {
            var_1974.scrollV = 0;
         }
         if(_content.findChildByName("no_rooms_found"))
         {
            _content.findChildByName("no_rooms_found").visible = _loc3_.length < 1;
         }
      }
      
      private function getVisibleEntryCount() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < var_19.numListItems)
         {
            if(var_19.getListItemAt(_loc2_).visible)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      protected function getListEntry(param1:int) : class_3151
      {
         var _loc3_:int = 0;
         var _loc2_:class_3151 = class_3151(_navigator.getXmlWindow("grs_guest_room_details_phase_one"));
         _loc2_.background = true;
         _loc2_.addEventListener("WME_MOVE",onMouseMove);
         _loc2_.addEventListener("WME_OVER",onMouseOver);
         _loc2_.addEventListener("WME_OUT",onMouseOut);
         _loc2_.addEventListener("WME_CLICK",onMouseClick);
         _loc2_.setParamFlag(1,true);
         _loc2_.setParamFlag(128,true);
         _loc2_.color = getBgColor(param1);
         _loc2_.tags.push(param1);
         if(_showRoomNumbers)
         {
            _loc3_ = 20;
            _loc2_.findChildByName("roomname").x = _loc2_.findChildByName("roomname").x + _loc3_;
            _loc2_.findChildByName("roomname").width = _loc2_.findChildByName("roomname").width - _loc3_;
         }
         return _loc2_;
      }
      
      protected function getBgColor(param1:int) : uint
      {
         return param1 % 2 != 0 ? 4294967295 : 4292797682;
      }
      
      private function refreshEntry(param1:Boolean, param2:int, param3:class_1569) : Boolean
      {
         var _loc4_:class_3151 = class_3151(var_19.getListItemAt(param2));
         var _loc5_:Boolean = false;
         if(_loc4_ == null)
         {
            if(!param1)
            {
               return true;
            }
            _loc4_ = getListEntry(param2);
            var_19.addListItem(_loc4_);
            _loc5_ = true;
         }
         Util.hideChildren(_loc4_);
         if(param1)
         {
            refreshEntryDetails(_loc4_,param3);
            _loc4_.visible = true;
            _loc4_.height = 17;
         }
         else
         {
            _loc4_.height = 0;
            _loc4_.visible = false;
         }
         if(_loc5_)
         {
            _loc4_.width += var_4011;
            MainViewCtrl.stretchNewEntryIfNeeded(this,_loc4_);
         }
         return false;
      }
      
      protected function refreshEntryDetails(param1:class_3151, param2:class_1569) : void
      {
         param1.visible = true;
         Util.hideChildren(param1);
         refreshFavouriteIcon(param1,param2);
         var _loc3_:String = param2.doorMode == 1 || param2.doorMode == 2 || param2.doorMode == 3 ? "group_base_icon" : "group_base_icon_no_doormode";
         _navigator.refreshButton(param1,_loc3_,param2.habboGroupId > 0,null,0,"group_base_icon");
         _navigator.refreshButton(param1,"home",isHome(param2),null,0);
         _navigator.refreshButton(param1,"doormode_doorbell_small",param2.doorMode == 1,null,0);
         _navigator.refreshButton(param1,"doormode_password_small",param2.doorMode == 2,null,0);
         _navigator.refreshButton(param1,"doormode_invisible_small",param2.doorMode == 3,null,0);
         if(_showRoomNumbers)
         {
            param1.findChildByName("room_number").visible = true;
            param1.findChildByName("room_number").caption = param1.tags[0] + 2 + ".";
         }
         refreshRoomName(param1,param2);
         var_2577.refreshUserCount(param2.maxUserCount,param1,param2.userCount,"${navigator.usercounttooltip.users}",308,2);
         param1.name = "guestroom_" + param2.ownerName + "_" + param2.roomName;
      }
      
      private function refreshRoomName(param1:class_3151, param2:class_1569) : void
      {
         var _loc4_:ITextWindow;
         (_loc4_ = ITextWindow(param1.getChildByName("roomname"))).visible = true;
         var _loc3_:Boolean = param1.findChildByName("home").visible || param1.findChildByName("favourite").visible || param1.findChildByName("make_favourite").visible;
         Util.cutTextToWidth(_loc4_,param2.roomName,_loc3_ ? _loc4_.width - 20 : _loc4_.width);
      }
      
      protected function onMouseMove(param1:class_3134) : void
      {
         this.checkFastHorizontalMove(param1);
      }
      
      protected function onMouseOver(param1:class_3134) : void
      {
         var _loc3_:class_3127 = param1.target;
         if(false && var_3950)
         {
            return;
         }
         hilite(class_3151(_loc3_));
         var _loc2_:int = int(_loc3_.tags[0]);
         var _loc4_:class_1569;
         if((_loc4_ = getRoomAt(_loc2_)) == null)
         {
            return;
         }
         var_1802.room = _loc4_;
         var_1802.showPopup(_loc3_);
      }
      
      public function getRooms() : Array
      {
         return _navigator == null || true || _navigator.data.guestRoomSearchResults == null || _navigator.data.guestRoomSearchResults.rooms == null ? [] : _navigator.data.guestRoomSearchResults.rooms;
      }
      
      private function getRoomAt(param1:int) : class_1569
      {
         return getRooms()[param1];
      }
      
      protected function onMouseOut(param1:class_3134) : void
      {
         var _loc2_:class_3127 = param1.target;
         if(Util.containsMouse(_loc2_))
         {
            return;
         }
         var _loc3_:int = int(_loc2_.tags[0]);
         _loc2_.color = getBgColor(_loc3_);
         var_1802.closePopup();
      }
      
      protected function onMouseClick(param1:class_3134) : void
      {
         var _loc3_:Point = null;
         var _loc5_:class_3127;
         var _loc4_:int = int((_loc5_ = param1.target).tags[0]);
         var _loc2_:class_1569 = getRoomAt(_loc4_);
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.ownerName != _navigator.sessionData.userName)
         {
            if(_loc2_.habboGroupId != 0)
            {
               _navigator.goToPrivateRoom(_loc2_.flatId);
               return;
            }
            _loc3_ = new Point((param1 as WindowMouseEvent).stageX,(param1 as WindowMouseEvent).stageY);
            switch(_loc2_.doorMode - 1)
            {
               case 0:
                  _navigator.doorbell.show(_loc2_,_loc3_);
                  return;
               case 1:
                  _navigator.passwordInput.show(_loc2_,_loc3_);
                  return;
            }
         }
         beforeEnterRoom(_loc4_);
         _navigator.goToRoom(_loc2_.flatId,true,"",_loc4_);
         var_1802.hideInstantly();
      }
      
      public function beforeEnterRoom(param1:int) : void
      {
      }
      
      private function refreshFavouriteIcon(param1:class_3151, param2:class_1569) : void
      {
         var _loc4_:Boolean = _navigator.data.isRoomFavourite(param2.flatId);
         var _loc3_:Boolean = isHome(param2);
         refreshRegion(param1,"make_favourite",!_loc4_ && !_loc3_,onAddFavouriteClick);
         refreshRegion(param1,"favourite",_loc4_ && !_loc3_,onRemoveFavouriteClick);
      }
      
      private function isHome(param1:class_1569) : Boolean
      {
         return param1.flatId == _navigator.data.homeRoomId;
      }
      
      private function refreshRegion(param1:class_3151, param2:String, param3:Boolean, param4:Function) : void
      {
         var _loc5_:IRegionWindow;
         if(!(_loc5_ = param1.findChildByName(param2) as IRegionWindow))
         {
            return;
         }
         if(!param3)
         {
            _loc5_.visible = false;
            if(_loc5_.hasEventListener("WME_CLICK"))
            {
               _loc5_.removeEventListener("WME_CLICK",param4);
            }
         }
         else
         {
            _loc5_.addEventListener("WME_CLICK",param4);
            _loc5_.visible = true;
            _navigator.refreshButton(_loc5_,param2,param3,null,0);
         }
      }
      
      private function onRemoveFavouriteClick(param1:WindowMouseEvent) : void
      {
         var _loc3_:class_3127 = param1.target;
         if(_loc3_ == null || _loc3_.parent == null)
         {
            return;
         }
         var _loc2_:class_1569 = getRoomAt(_loc3_.parent.tags[0]);
         if(_loc2_ == null)
         {
            return;
         }
         _navigator.send(new class_997(_loc2_.flatId));
      }
      
      private function onAddFavouriteClick(param1:WindowMouseEvent) : void
      {
         var _loc3_:class_3127 = param1.target;
         if(_loc3_ == null || _loc3_.parent == null)
         {
            return;
         }
         var _loc2_:class_1569 = getRoomAt(int(_loc3_.parent.tags[0]));
         if(_loc2_ == null)
         {
            return;
         }
         _navigator.send(new class_728(_loc2_.flatId));
      }
      
      private function hilite(param1:class_3151) : void
      {
         var _loc2_:int = 0;
         if(var_2945 != null && true)
         {
            _loc2_ = int(var_2945.tags[0]);
            var_2945.color = getBgColor(_loc2_);
         }
         var_2945 = param1;
         param1.color = 4288861930;
      }
      
      private function checkFastHorizontalMove(param1:class_3134) : void
      {
         var _loc3_:WindowMouseEvent = WindowMouseEvent(param1);
         var _loc2_:int = Math.abs(var_4029 - _loc3_.stageX);
         var_4029 = _loc3_.stageX;
         var_3950 = _loc2_ > 2;
      }
      
      public function get roomPopupCtrl() : RoomPopupCtrl
      {
         return var_1802;
      }
      
      public function get navigator() : HabboNavigator
      {
         return _navigator;
      }
   }
}
