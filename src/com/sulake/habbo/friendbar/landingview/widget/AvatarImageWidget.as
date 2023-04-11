package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.habbo.avatar.events.AvatarUpdateEvent;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.window.widgets.class_3308;
   import package_17.class_327;
   import package_6.class_530;
   
   public class AvatarImageWidget implements ILandingViewWidget
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var var_2889:class_3217;
      
      private var var_2684:class_530;
      
      private var var_2654:class_327;
      
      public function AvatarImageWidget(param1:HabboLandingView)
      {
         super();
         _landingView = param1;
         var_2684 = new class_530(onUserObject);
         var_2654 = new class_327(onUserChange);
         _landingView.communicationManager.addHabboConnectionMessageEvent(var_2684);
         _landingView.communicationManager.addHabboConnectionMessageEvent(var_2654);
         _landingView.avatarEditor.events.addEventListener("AVATAR_FIGURE_UPDATED",onAvatarFigureUpdated);
      }
      
      public function get container() : class_3127
      {
         return var_2889;
      }
      
      public function dispose() : void
      {
         if(var_2684 != null)
         {
            _landingView.communicationManager.removeHabboConnectionMessageEvent(var_2684);
            var_2684 = null;
         }
         if(var_2654 != null)
         {
            _landingView.communicationManager.removeHabboConnectionMessageEvent(var_2654);
            var_2654 = null;
         }
         if(_landingView != null)
         {
            _landingView.avatarEditor.events.removeEventListener("AVATAR_FIGURE_UPDATED",onAvatarFigureUpdated);
            _landingView = null;
         }
         var_2889 = null;
      }
      
      public function initialize() : void
      {
         var_2889 = class_3217(_landingView.getXmlWindow("avatar_image"));
      }
      
      public function refresh() : void
      {
         refreshAvatarInfo();
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      private function onUserObject(param1:class_530) : void
      {
         refreshAvatarInfo(param1.getParser().figure);
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:class_327 = param1 as class_327;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            refreshAvatarInfo(_loc2_.figure);
         }
      }
      
      private function onAvatarFigureUpdated(param1:AvatarUpdateEvent) : void
      {
         refreshAvatarInfo(param1.figure);
      }
      
      private function refreshAvatarInfo(param1:String = null) : void
      {
         var _loc2_:class_3308 = null;
         if(!param1 && false)
         {
            param1 = _landingView.sessionDataManager.figure;
         }
         if(var_2889 != null)
         {
            _loc2_ = var_2889.widget as class_3308;
            if(_loc2_ != null)
            {
               _loc2_.figure = param1;
            }
         }
      }
   }
}
