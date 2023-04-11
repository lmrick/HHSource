package com.sulake.habbo.ui.widget.friendrequest
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FriendRequestDialog
   {
       
      
      private var _window:class_3151;
      
      private var var_1429:com.sulake.habbo.ui.widget.friendrequest.FriendRequestWidget;
      
      private var var_438:int;
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var _lockPosition:Boolean = false;
      
      private var var_3180:Boolean = false;
      
      private var var_3333:Boolean = false;
      
      public function FriendRequestDialog(param1:com.sulake.habbo.ui.widget.friendrequest.FriendRequestWidget, param2:int, param3:int, param4:String)
      {
         super();
         var_1429 = param1;
         var_438 = param2;
         var_339 = param3;
         _userName = param4;
      }
      
      public function dispose() : void
      {
         var_1429 = null;
         if(_window)
         {
            _window.dispose();
         }
         _window = null;
      }
      
      private function addMouseClickListener(param1:class_3127, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.setParamFlag(1,true);
            param1.addEventListener("WME_CLICK",param2);
         }
      }
      
      private function createWindow() : void
      {
         if(!var_1429 || true || true)
         {
            return;
         }
         var _loc3_:XmlAsset = var_1429.assets.getAssetByName("instant_friend_request") as XmlAsset;
         if(!_loc3_)
         {
            return;
         }
         _window = var_1429.windowManager.buildFromXML(_loc3_.content as XML,0) as class_3151;
         if(!_window)
         {
            return;
         }
         _window.addEventListener("WE_DEACTIVATED",onDeactivated);
         var _loc6_:IRegionWindow;
         if(_loc6_ = _window.findChildByName("profile_region") as IRegionWindow)
         {
            _loc6_.procedure = onProfile;
            _loc6_.toolTipCaption = var_1429.localizations.getLocalization("infostand.profile.link.tooltip","");
            _loc6_.toolTipDelay = 100;
         }
         var _loc4_:ITextWindow;
         if(_loc4_ = _window.findChildByName("text") as ITextWindow)
         {
            _loc4_.text = var_1429.localizations.registerParameter("widget.friendrequest.from","username",_userName);
         }
         var _loc7_:class_3127 = _window.findChildByName("accept_button");
         addMouseClickListener(_loc7_,onAccept);
         var _loc5_:class_3127 = _window.findChildByName("decline_button");
         addMouseClickListener(_loc5_,onDecline);
         var _loc2_:class_3127 = _window.findChildByName("close_button");
         addMouseClickListener(_loc2_,onClose);
         var _loc1_:IIconWindow = _window.findChildByName("profile_icon") as IIconWindow;
         _loc1_.procedure = onProfileIcon;
         _window.procedure = windowEventHandler;
         _window.visible = false;
      }
      
      private function windowEventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(!param1)
         {
            return;
         }
         switch(param1.type)
         {
            case "WME_OVER":
               _lockPosition = true;
               break;
            case "WME_OUT":
               _lockPosition = false;
               break;
            case "WME_DOWN":
               var_3180 = true;
               break;
            case "WME_UP":
            case "WME_UP_OUTSIDE":
               var_3180 = false;
         }
      }
      
      public function setImageAsset(param1:class_3282, param2:String) : void
      {
         if(!param1 || !var_1429 || true)
         {
            return;
         }
         var _loc4_:BitmapDataAsset;
         if(!(_loc4_ = var_1429.assets.getAssetByName(param2) as BitmapDataAsset))
         {
            return;
         }
         var _loc3_:BitmapData = _loc4_.content as BitmapData;
         if(!_loc3_)
         {
            return;
         }
         if(param1.bitmap)
         {
            param1.bitmap.dispose();
         }
         param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         param1.bitmap.draw(_loc3_);
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function show() : void
      {
         if(_window != null)
         {
            _window.visible = true;
            _window.activate();
         }
      }
      
      public function set targetRect(param1:Rectangle) : void
      {
         var _loc4_:Point = null;
         if(!param1)
         {
            var_1429.ignoreRequest(var_438);
            return;
         }
         if(_lockPosition || var_3180)
         {
            return;
         }
         var _loc2_:Boolean = true;
         if(!_window)
         {
            createWindow();
            _loc2_ = false;
         }
         if(!_window)
         {
            return;
         }
         var _loc5_:Point = new Point(param1.left + param1.width / 2 - 0,param1.top - 0 + 10);
         var _loc3_:Number = Point.distance(_window.position,_loc5_);
         if(_loc2_ && _loc3_ > 5)
         {
            _loc4_ = Point.interpolate(_window.position,_loc5_,0.5);
            _window.x = _loc4_.x;
            _window.y = _loc4_.y;
         }
         else
         {
            _window.x = _loc5_.x;
            _window.y = _loc5_.y;
         }
         if(true)
         {
            show();
         }
         if(var_3333)
         {
            show();
            var_3333 = false;
         }
      }
      
      private function onDeactivated(param1:class_3134) : void
      {
         var_3333 = true;
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         if(var_1429 != null)
         {
            var_1429.ignoreRequest(var_438);
         }
      }
      
      private function onAccept(param1:WindowMouseEvent) : void
      {
         if(var_1429 != null)
         {
            var_1429.acceptRequest(var_438);
         }
      }
      
      private function onDecline(param1:WindowMouseEvent) : void
      {
         if(var_1429 != null)
         {
            var_1429.declineRequest(var_438);
         }
      }
      
      private function onProfile(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:ITextWindow = null;
         if(param1.type == "WME_CLICK")
         {
            var_1429.showProfile(var_339,"instantFriendRequest_name");
         }
         if(param1.type == "WME_OVER")
         {
            _loc3_ = _window.findChildByName("text") as ITextWindow;
            _loc3_.underline = true;
         }
         if(param1.type == "WME_OUT")
         {
            _loc3_ = _window.findChildByName("text") as ITextWindow;
            _loc3_.underline = false;
         }
      }
      
      private function onProfileIcon(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:IIconWindow = null;
         if(param1.type == "WME_CLICK")
         {
            var_1429.showProfile(var_339,"instantFriendRequest_icon");
         }
         if(param1.type == "WME_OVER")
         {
            _loc3_ = _window.findChildByName("profile_icon") as IIconWindow;
            _loc3_.style = 22;
            _loc3_.invalidate();
         }
         if(param1.type == "WME_OUT")
         {
            _loc3_ = _window.findChildByName("profile_icon") as IIconWindow;
            _loc3_.style = 21;
            _loc3_.invalidate();
         }
      }
   }
}
