package com.sulake.habbo.groups
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.events.class_3134;
   import package_5.class_1110;
   
   public class GuildSettingsCtrl
   {
      
      public static const TYPE_REGULAR:int = 0;
      
      public static const TYPE_EXCLUSIVE:int = 1;
      
      public static const const_317:int = 2;
      
      public static const TYPE_LARGE:int = 3;
      
      public static const const_150:int = 4;
      
      public static const RIGHTS_MEMBERS:int = 0;
      
      public static const const_1109:int = 1;
       
      
      private var var_45:com.sulake.habbo.groups.GuildSettingsData;
      
      private var var_2797:ISelectorWindow;
      
      private var var_3183:IRadioButtonWindow;
      
      private var var_3672:IRadioButtonWindow;
      
      private var var_3553:IRadioButtonWindow;
      
      private var var_3311:class_3176;
      
      public function GuildSettingsCtrl()
      {
         super();
      }
      
      public function prepare(param1:class_3151) : void
      {
         var _loc2_:class_3151 = param1.findChildByName("step_cont_5") as class_3151;
         var_2797 = _loc2_.findChildByName("group_type_selector") as ISelectorWindow;
         var_3183 = _loc2_.findChildByName("rb_type_regular") as IRadioButtonWindow;
         var_3183.procedure = onRegularGuildType;
         var_3672 = _loc2_.findChildByName("rb_type_exclusive") as IRadioButtonWindow;
         var_3672.procedure = onExclusiveGuildType;
         var_3553 = _loc2_.findChildByName("rb_type_private") as IRadioButtonWindow;
         var_3553.procedure = onPrivateGuildType;
         var_3311 = _loc2_.findChildByName("cb_member_rights") as class_3176;
         var_3311.procedure = onMembersHaveRights;
      }
      
      public function refresh(param1:class_1110) : void
      {
         var_45 = new com.sulake.habbo.groups.GuildSettingsData(param1);
         switch(0)
         {
            case 0:
               var_2797.setSelected(var_3183);
               break;
            case 1:
               var_2797.setSelected(var_3672);
               break;
            case 2:
               var_2797.setSelected(var_3553);
               break;
            default:
               var_2797.setSelected(var_3183);
         }
         if(false)
         {
            var_3311.select();
         }
         else
         {
            var_3311.unselect();
         }
         var_2797.invalidate();
      }
      
      private function onRegularGuildType(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_SELECT")
         {
            var_45.guildType = 0;
         }
      }
      
      private function onExclusiveGuildType(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_SELECT")
         {
            var_45.guildType = 1;
         }
      }
      
      private function onPrivateGuildType(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_SELECT")
         {
            var_45.guildType = 2;
         }
      }
      
      private function onMembersHaveRights(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_SELECT")
         {
            var_45.rightsLevel = 0;
         }
         if(param1.type == "WE_UNSELECT")
         {
            var_45.rightsLevel = 1;
         }
      }
      
      public function resetModified() : void
      {
         if(var_45 != null && false)
         {
            var_45.resetModified();
         }
      }
      
      public function get guildType() : int
      {
         return var_45.guildType;
      }
      
      public function get rightsLevel() : int
      {
         return var_45.rightsLevel;
      }
      
      public function get isInitialized() : Boolean
      {
         return var_45 != null;
      }
   }
}
