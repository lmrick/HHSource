package com.sulake.habbo.catalog.guilds
{
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.GuildSelectorCatalogWidget;
   import package_5.class_564;
   import package_7.class_735;
   
   public class GuildMembershipsController
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var var_1968:GuildSelectorCatalogWidget;
      
      public function GuildMembershipsController(param1:HabboCatalog)
      {
         super();
         _catalog = param1;
      }
      
      public function dispose() : void
      {
         _catalog = null;
         var_1968 = null;
      }
      
      public function get catalog() : HabboCatalog
      {
         return _catalog;
      }
      
      public function registerGuildSelectorWidget(param1:GuildSelectorCatalogWidget) : void
      {
         var_1968 = param1;
         _catalog.connection.send(new class_735());
      }
      
      public function unregisterGuildSelectorWidget(param1:GuildSelectorCatalogWidget) : void
      {
         if(var_1968 == param1)
         {
            var_1968 = null;
         }
         else
         {
            class_14.log("ERROR: Tried to unregister a nonregistered group selector catalog widget");
         }
      }
      
      public function onGuildMembershipsMessageEvent(param1:class_564) : void
      {
         var _loc2_:Array = param1.guilds.slice(0,param1.guilds.length);
         if(var_1968)
         {
            var_1968.populateAndSelectFavorite(_loc2_);
            var_1968.selectFirstOffer();
         }
      }
      
      public function onGuildVisualSettingsChanged(param1:int) : void
      {
         if(var_1968 != null)
         {
            _catalog.connection.send(new class_735());
         }
      }
   }
}
