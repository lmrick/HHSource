package com.sulake.bootstrap
{

   import com.sulake.habbo.game.HabboGameManager;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.assets.IAssetLibrary;
   
   public class HabboGameManagerBootstrap extends HabboGameManager
   {
       
      
      public function HabboGameManagerBootstrap(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
      }
   }
}
