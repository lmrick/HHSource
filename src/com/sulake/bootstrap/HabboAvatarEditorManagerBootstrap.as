package com.sulake.bootstrap
{
   import com.sulake.habbo.avatar.HabboAvatarEditorManager;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IContext;
   
   public class HabboAvatarEditorManagerBootstrap extends HabboAvatarEditorManager
   {
       
      
      public function HabboAvatarEditorManagerBootstrap(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
      }
   }
}
