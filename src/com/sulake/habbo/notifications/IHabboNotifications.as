package com.sulake.habbo.notifications
{
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.class_24;
   
   public interface IHabboNotifications extends IUnknown
   {
       
      
      function showNotification(param1:String, param2:class_24 = null) : void;
      
      function addSongPlayingNotification(param1:String, param2:String) : void;
   }
}
