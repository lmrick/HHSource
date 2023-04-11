package com.sulake.habbo.notifications.singular
{
   import com.sulake.core.utils.class_24;
   import flash.display.BitmapData;
   
   public class HabboNotificationItemStyle
   {
       
      
      private var _icon:BitmapData;
      
      private var _disposeIcon:Boolean;
      
      private var var_4068:String;
      
      private var var_3389:String;
      
      private var _iconAssetUri:String;
      
      public function HabboNotificationItemStyle(param1:class_24, param2:BitmapData, param3:String, param4:Boolean, param5:String)
      {
         super();
         _iconAssetUri = param3;
         if(param1 != null && param3 == null)
         {
            _icon = param1["icon"];
            var_3389 = param1["internallink"];
         }
         if(param2 != null)
         {
            _icon = param2;
            _disposeIcon = param4;
         }
         else
         {
            _disposeIcon = false;
         }
         var_4068 = param5;
      }
      
      public function dispose() : void
      {
         if(_disposeIcon && _icon != null)
         {
            _icon.dispose();
            _icon = null;
         }
      }
      
      public function get icon() : BitmapData
      {
         return _icon;
      }
      
      public function get internalLink() : String
      {
         return var_3389;
      }
      
      public function set internalLink(param1:String) : void
      {
         var_3389 = param1;
      }
      
      public function get iconSrc() : String
      {
         return var_4068;
      }
      
      public function get iconAssetUri() : String
      {
         return _iconAssetUri;
      }
   }
}
