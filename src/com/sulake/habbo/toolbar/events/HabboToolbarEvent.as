package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const TOOLBAR_CLICK:String = "HTE_TOOLBAR_CLICK";
      
      public static const GROUP_ROOM_INFO_CLICK:String = "HTE_GROUP_ROOM_INFO_CLICK";
      
      public static const ICON_ZOOM:String = "HTIE_ICON_ZOOM";
      
      public static const RESIZED:String = "HTE_RESIZED";
      
      public static const CAMERA_TOGGLE:String = "HTE_ICON_CAMERA";
      
      public static const CAMERA_LAUNCH_ORIGIN_ROOM_TOOL:String = "roomToolsMenu";
      
      public static const CAMERA_LAUNCH_ORIGIN_CHAT:String = "chatCameraCommand";
      
      public static const CAMERA_LAUNCH_ORIGIN_EIW_MAKE_OWN:String = "imageWidgetMakeOwn";
      
      public static const CAMERA_LAUNCH_ORIGIN_TOOLBAR:String = "toolBarCameraIcon";
       
      
      private var var_3599:String;
      
      private var _iconName:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         var_3599 = param1;
      }
      
      public function get iconId() : String
      {
         return var_3599;
      }
      
      public function set iconName(param1:String) : void
      {
         _iconName = param1;
      }
      
      public function get iconName() : String
      {
         return _iconName;
      }
   }
}
