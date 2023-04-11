package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetShowWarningTextEvent;
   import package_5.class_1633;
   
   public class GuildForumSelectorCatalogWidget extends GuildSelectorCatalogWidget
   {
       
      
      public function GuildForumSelectorCatalogWidget(param1:class_3151, param2:GuildMembershipsController)
      {
         super(param1,param2);
      }
      
      override protected function filterGroupMemberships(param1:Array) : Array
      {
         var _loc2_:* = [];
         var _loc4_:int = var_2323.catalog.sessionDataManager.userId;
         var _loc3_:Boolean = var_2323.catalog.sessionDataManager.hasSecurity(4);
         for each(var _loc5_ in param1)
         {
            if(!(!_loc5_.hasForum && _loc5_.ownerId != _loc4_ && !_loc3_))
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      override protected function selectGroup(param1:class_1633) : void
      {
         super.selectGroup(param1);
         events.dispatchEvent(new CatalogWidgetShowWarningTextEvent(param1.hasForum ? "${catalog.alert.group_has_forum}" : ""));
      }
   }
}
