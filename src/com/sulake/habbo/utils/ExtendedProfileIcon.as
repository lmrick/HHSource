package com.sulake.habbo.utils
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.events.class_3134;
   
   public class ExtendedProfileIcon
   {
       
      
      public function ExtendedProfileIcon()
      {
         super();
      }
      
      public static function setup(param1:class_3151, param2:Function) : void
      {
         var _loc3_:class_3127 = param1.findChildByName("user_info_region");
         _loc3_.addEventListener("WME_OVER",onUserInfoMouseOver);
         _loc3_.addEventListener("WME_OUT",onUserInfoMouseOut);
         _loc3_.addEventListener("WME_CLICK",param2);
      }
      
      private static function onUserInfoMouseOver(param1:class_3134) : void
      {
         var _loc2_:IRegionWindow = IRegionWindow(param1.target);
         setUserInfoState(true,_loc2_);
      }
      
      private static function onUserInfoMouseOut(param1:class_3134) : void
      {
         var _loc2_:IRegionWindow = IRegionWindow(param1.target);
         setUserInfoState(false,_loc2_);
      }
      
      public static function setUserInfoState(param1:Boolean, param2:class_3151) : void
      {
         param2.findChildByName("icon_eye_off").visible = !param1;
         param2.findChildByName("icon_eye_over").visible = param1;
      }
      
      public static function onEntry(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_OVER")
         {
            ExtendedProfileIcon.setUserInfoState(true,class_3151(param2.parent));
         }
         else if(param1.type == "WME_OUT")
         {
            ExtendedProfileIcon.setUserInfoState(false,class_3151(param2.parent));
         }
      }
   }
}
