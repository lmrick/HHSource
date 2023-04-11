package com.sulake.habbo.navigator
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.widgets.class_3366;
   import package_11.class_1569;
   import package_7.class_197;
   
   public class GuildInfoCtrl implements class_13
   {
      
      private static const GUILD_INFO_NAME:String = "guild_info";
       
      
      private var _navigator:com.sulake.habbo.navigator.class_1686;
      
      private var _groupId:int;
      
      public function GuildInfoCtrl(param1:com.sulake.habbo.navigator.class_1686)
      {
         super();
         _navigator = param1;
      }
      
      public function dispose() : void
      {
         _navigator = null;
      }
      
      public function get disposed() : Boolean
      {
         return _navigator == null;
      }
      
      public function refresh(param1:class_3151, param2:class_1569, param3:Boolean = false) : void
      {
         var _loc5_:class_3151;
         if((_loc5_ = class_3151(param1.findChildByName("guild_info"))) == null)
         {
            (_loc5_ = class_3151(_navigator.getXmlWindow("guild_info"))).name = "guild_info";
            param1.addChild(_loc5_);
            _loc5_.addEventListener("WME_CLICK",onGuildInfo);
         }
         if(param2 == null || param2.habboGroupId < 1)
         {
            _loc5_.visible = false;
            return;
         }
         _loc5_.visible = true;
         _navigator.registerParameter("navigator.guildbase","groupName",param2.groupName);
         _loc5_.findChildByName("guild_base_txt").caption = _navigator.getText("navigator.guildbase");
         var _loc4_:class_3366;
         (_loc4_ = class_3217(param1.findChildByName("guild_badge")).widget as class_3366).badgeId = param2.groupBadgeCode;
         _loc4_.groupId = param2.habboGroupId;
         _groupId = param2.habboGroupId;
      }
      
      private function onGuildInfo(param1:class_3134) : void
      {
         _navigator.send(new class_197(_groupId,true));
      }
   }
}
