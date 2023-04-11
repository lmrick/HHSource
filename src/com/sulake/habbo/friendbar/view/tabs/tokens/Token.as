package com.sulake.habbo.friendbar.view.tabs.tokens
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.motion.DropBounce;
   import com.sulake.core.window.motion.class_3353;
   import com.sulake.habbo.friendbar.data.IFriendNotification;
   import com.sulake.habbo.game.class_1688;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Rectangle;
   
   public class Token implements class_13
   {
      
      protected static var _WINDOW_MANAGER:class_1684;
      
      protected static var var_4124:class_21;
      
      protected static var _GAMES:class_1688;
      
      protected static const TITLE:String = "title";
      
      protected static const MESSAGE:String = "message";
      
      protected static const ICON_RECTANGLE:Rectangle = new Rectangle(0,0,25,25);
       
      
      protected var _icon:IRegionWindow;
      
      protected var _window:class_3151;
      
      protected var _disposed:Boolean;
      
      protected var _notification:IFriendNotification;
      
      public function Token(param1:IFriendNotification)
      {
         super();
         _notification = param1;
      }
      
      public static function set WINDOWING(param1:class_1684) : void
      {
         _WINDOW_MANAGER = param1;
      }
      
      public static function set ASSETS(param1:class_21) : void
      {
         var_4124 = param1;
      }
      
      public static function set GAMES(param1:class_1688) : void
      {
         _GAMES = param1;
      }
      
      public function get typeCode() : int
      {
         return _notification.typeCode;
      }
      
      public function get viewOnce() : Boolean
      {
         return _notification.viewOnce;
      }
      
      public function get notification() : IFriendNotification
      {
         return _notification;
      }
      
      public function get iconElement() : class_3127
      {
         return _icon;
      }
      
      public function get windowElement() : class_3127
      {
         return _window;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(_icon)
         {
            _icon.dispose();
            _icon = null;
         }
         _notification = null;
         _disposed = true;
      }
      
      protected function prepare(param1:String, param2:String, param3:String, param4:String) : void
      {
         _window = _WINDOW_MANAGER.buildFromXML(var_4124.getAssetByName(param3).content as XML) as class_3151;
         _window.findChildByName("title").caption = param1;
         _window.findChildByName("message").caption = !!param2 ? param2 : "";
         _icon = _WINDOW_MANAGER.create("ICON_" + typeCode,5,0,1,Token.ICON_RECTANGLE) as IRegionWindow;
         _icon.mouseThreshold = 0;
         var _loc5_:IStaticBitmapWrapperWindow;
         (_loc5_ = _WINDOW_MANAGER.create("BITMAP_" + typeCode,23,0,0,Token.ICON_RECTANGLE) as IStaticBitmapWrapperWindow).assetUri = param4;
         _icon.addChild(_loc5_);
         if(class_3353.getMotionByTarget(_icon) == null)
         {
            class_3353.runMotion(new DropBounce(_icon,600,32));
         }
      }
   }
}
