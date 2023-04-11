package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetGuildSelectedEvent;
   import com.sulake.habbo.window.widgets.class_3366;
   
   public class GuildBadgeViewCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var var_2323:GuildMembershipsController;
      
      public function GuildBadgeViewCatalogWidget(param1:class_3151, param2:GuildMembershipsController)
      {
         super(param1);
         var_2323 = param2;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            var_2323 = null;
            super.dispose();
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         attachWidgetView("guildBadgeViewWidget");
         events.addEventListener("GUILD_SELECTED",onGuildSelected);
         return true;
      }
      
      private function onGuildSelected(param1:CatalogWidgetGuildSelectedEvent) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc2_:class_3366 = class_3217(_window.findChildByName("badge")).widget as class_3366;
         if(_loc2_ != null)
         {
            _loc2_.badgeId = param1.badgeCode;
            _loc2_.groupId = param1.guildId;
         }
      }
   }
}
