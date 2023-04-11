package com.sulake.habbo.ui.widget.furniture.trophy
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetAchievementResolutionTrophyDataUpdateEvent;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   
   public class AchievementResolutionTrophyFurniWidget extends RoomWidgetBase implements ITrophyFurniWidget
   {
       
      
      private var _name:String;
      
      private var var_156:String;
      
      private var var_357:String;
      
      private var _color:int;
      
      private var _configuration:class_19;
      
      private var var_1430:com.sulake.habbo.ui.widget.furniture.trophy.ITrophyView;
      
      private var var_3592:int;
      
      public function AchievementResolutionTrophyFurniWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18, param5:class_19)
      {
         super(param1,param2,param3,param4);
         _configuration = param5;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get date() : String
      {
         return var_156;
      }
      
      public function get message() : String
      {
         return var_357;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function get configuration() : class_19
      {
         return _configuration;
      }
      
      override public function dispose() : void
      {
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         _configuration = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWARTDUE_TROPHY_DATA",onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWARTDUE_TROPHY_DATA",onObjectUpdate);
      }
      
      private function onObjectUpdate(param1:RoomWidgetAchievementResolutionTrophyDataUpdateEvent) : void
      {
         _name = param1.name;
         var_156 = param1.date;
         var_357 = param1.message;
         _color = param1.color - 1;
         var_3592 = param1.viewType;
         if(_color < 0 || _color > 2)
         {
            _color = 0;
         }
         updateInterface();
      }
      
      private function updateInterface() : void
      {
         if(var_1430 != null)
         {
            var_1430.dispose();
         }
         var _loc1_:int = var_3592;
         var_1430 = new TrophyView(this);
         var_1430.showInterface();
      }
   }
}
