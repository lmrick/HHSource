package com.sulake.bootstrap
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_31;
   import com.sulake.habbo.configuration.HabboConfigurationManager;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.assets.IAssetLibrary;
   
   public class HabboConfigurationManagerBootstrap extends HabboConfigurationManager
   {
       
      
      public function HabboConfigurationManagerBootstrap(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
      }
   }
}
