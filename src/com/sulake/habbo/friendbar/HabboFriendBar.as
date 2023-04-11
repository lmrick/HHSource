package com.sulake.habbo.friendbar
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.habbo.friendbar.data.HabboFriendBarData;
   import com.sulake.habbo.friendbar.groupforums.GroupForumController;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.popup.HabboEpicPopupView;
   import com.sulake.habbo.friendbar.talent.HabboTalent;
   import com.sulake.habbo.friendbar.view.HabboFriendBarView;
   import com.sulake.habbo.friendbar.view.class_3203;
   import com.sulake.iid.IIDHabboEpicPopupView;
   import com.sulake.iid.IIDHabboFriendBarData;
   import com.sulake.iid.IIDHabboFriendBarView;
   import com.sulake.iid.IIDHabboGroupForumController;
   import com.sulake.iid.IIDHabboLandingView;
   import com.sulake.iid.IIDHabboTalent;
   
   public class HabboFriendBar extends class_20 implements IHabboFriendBar
   {
       
      
      public function HabboFriendBar(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         param1.attachComponent(new HabboFriendBarData(param1,0,param3),[new IIDHabboFriendBarData()]);
         param1.attachComponent(new HabboFriendBarView(param1,0,param3),[new IIDHabboFriendBarView()]);
         param1.attachComponent(new HabboLandingView(param1,0,param3),[new IIDHabboLandingView()]);
         param1.attachComponent(new HabboTalent(param1,0,param3),[new IIDHabboTalent()]);
         param1.attachComponent(new HabboEpicPopupView(param1,0,param3),[new IIDHabboEpicPopupView()]);
         param1.attachComponent(new GroupForumController(param1,0,param3),[new IIDHabboGroupForumController()]);
      }
      
      public function set visible(param1:Boolean) : void
      {
         var _loc2_:class_3203 = queueInterface(new IIDHabboFriendBarView()) as class_3203;
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
            _loc2_.release(new IIDHabboFriendBarView());
         }
      }
   }
}
