package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.class_3152;
   import com.sulake.habbo.friendbar.view.class_3203;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.game.class_1688;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Point;
   
   public class Tab implements ITab
   {
      
      public static var WIDTH:int = 127;
      
      public static var HEIGHT:int = 36;
      
      public static var DATA:class_3152;
      
      public static var FRIENDS:class_1869;
      
      public static var GAMES:class_1688;
      
      public static var VIEW:class_3203;
      
      public static var ASSETS:class_21;
      
      public static var WINDOWING:class_1684;
      
      public static var var_1690:class_18;
      
      public static var TRACKING:class_1693;
      
      public static var CROPPER:TextCropper;
      
      protected static const const_879:Boolean = false;
      
      protected static const _MOTION_TIME:int = 80;
      
      protected static const const_651:int = 3;
       
      
      protected var _window:class_3151;
      
      protected var var_1501:Boolean;
      
      private var var_3351:Boolean;
      
      private var _selected:Boolean;
      
      private var _disposed:Boolean;
      
      public function Tab()
      {
         super();
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function get recycled() : Boolean
      {
         return var_1501;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      protected function get exposed() : Boolean
      {
         return var_3351;
      }
      
      public function select(param1:Boolean) : void
      {
         conceal();
         _selected = true;
      }
      
      public function deselect(param1:Boolean) : void
      {
         _selected = false;
      }
      
      public function recycle() : void
      {
         conceal();
         var_1501 = true;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_window)
            {
               _window.dispose();
               _window = null;
            }
            _disposed = true;
         }
      }
      
      protected function expose() : void
      {
         var_3351 = true;
      }
      
      protected function conceal() : void
      {
         var_3351 = false;
      }
      
      protected function onMouseClick(param1:WindowMouseEvent) : void
      {
         if(disposed || recycled)
         {
            return;
         }
         if(selected)
         {
            VIEW.deSelect(true);
         }
         else
         {
            VIEW.selectTab(this,true);
         }
      }
      
      protected function onMouseOver(param1:WindowMouseEvent) : void
      {
         if(disposed || recycled)
         {
            return;
         }
         if(!selected)
         {
            expose();
         }
      }
      
      protected function onMouseOut(param1:WindowMouseEvent) : void
      {
         if(disposed || recycled || _window == null)
         {
            return;
         }
         if(!selected)
         {
            if(!_window.hitTestGlobalPoint(new Point(param1.stageX,param1.stageY)))
            {
               conceal();
            }
         }
      }
   }
}
