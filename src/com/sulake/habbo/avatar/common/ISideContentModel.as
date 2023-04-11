package com.sulake.habbo.avatar.common
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   
   public interface ISideContentModel
   {
       
      
      function dispose() : void;
      
      function reset() : void;
      
      function get controller() : HabboAvatarEditor;
      
      function getWindowContainer() : class_3151;
   }
}
