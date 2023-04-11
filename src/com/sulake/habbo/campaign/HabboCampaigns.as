package com.sulake.habbo.campaign
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.habbo.campaign.calendar.CalendarView;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import package_113.class_673;
   import package_113.class_904;
   import package_121.class_1048;
   import package_121.class_1407;
   import package_121.class_1537;
   import package_89.class_364;
   import package_89.class_597;
   
   public class HabboCampaigns extends class_20 implements ILinkEventTracker
   {
       
      
      private var _communicationManager:class_25;
      
      private var _localizationManager:class_18;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _windowManager:class_1684;
      
      private var _catalog:IHabboCatalog;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_2229:CalendarView;
      
      private var var_1784:class_1537;
      
      private var var_2721:int = -1;
      
      private var var_3586:Boolean = false;
      
      public function HabboCampaigns(param1:class_31, param2:uint, param3:class_21)
      {
         super(param1,param2,param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         },true),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localizationManager = param1;
         }),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         }),new ComponentDependency(new IIDRoomEngine(),function(param1:IRoomEngine):void
         {
            _roomEngine = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         if(false)
         {
            var_1784 = new class_1537();
            var_1784.campaignDays = 24;
            var_1784.currentDay = 5;
            var_1784.campaignName = "summer";
            var_1784.openedDays = new <int>[0,1];
            var_1784.missedDays = new <int>[2,3];
            showCalendar();
         }
         _communicationManager.addHabboConnectionMessageEvent(new class_673(onCampaignCalendarDataMessageEvent));
         _communicationManager.addHabboConnectionMessageEvent(new class_904(onCampaignCalendarDoorOpenedMessageEvent));
         context.addLinkEventTracker(this);
      }
      
      private function onCampaignCalendarDataMessageEvent(param1:class_673) : void
      {
         if(false)
         {
            return;
         }
         var _loc2_:class_1407 = param1.getParser();
         var_1784 = _loc2_.cloneData();
      }
      
      private function onCampaignCalendarDoorOpenedMessageEvent(param1:class_904) : void
      {
         var _loc2_:class_1048 = param1.getParser();
         if(_loc2_.doorOpened)
         {
            showProductNotification(_loc2_.productName,_loc2_.customImage,_loc2_.furnitureClassName);
         }
      }
      
      public function openPackage(param1:int) : void
      {
         var_2721 = param1;
         if(false)
         {
            showProductNotification("A1 KUMIANKKA","","duck");
         }
         else
         {
            _communicationManager.connection.send(new class_597(var_1784.campaignName,param1));
         }
      }
      
      public function openPackageAsStaff(param1:int) : void
      {
         var_2721 = param1;
         if(false)
         {
            showProductNotification("hween_c15_evilcrystal2","targetedoffers/web_offer_credits_small.png","hween_c15_evilcrystal2");
         }
         else
         {
            _communicationManager.connection.send(new class_364(var_1784.campaignName,param1));
         }
      }
      
      private function showProductNotification(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:class_3200;
         if((_loc4_ = _sessionDataManager.getProductData(param1)) != null)
         {
            var_1784.openedDays.push(var_2721);
            var_2721 = -1;
            if(param2 && param2 != "")
            {
               var_2229.setReceivedProduct(_loc4_,getImageGalleryUrl() + param2);
            }
            else if(param3 && param3 != "")
            {
               var_2229.setReceivedProduct(_loc4_);
               requestIconFromRoomEngine(var_2229,param3);
            }
         }
      }
      
      private function requestIconFromRoomEngine(param1:class_3158, param2:String) : class_3266
      {
         var _loc3_:class_3266 = null;
         var _loc4_:class_3148 = null;
         if(_loc4_ = _sessionDataManager.getFloorItemDataByName(param2))
         {
            _loc3_ = _roomEngine.getFurnitureIcon(_loc4_.id,param1);
         }
         else if(_loc4_ = _sessionDataManager.getWallItemDataByName(param2))
         {
            _loc3_ = _roomEngine.getWallItemIcon(_loc4_.id,param1);
         }
         if(_loc3_ && _loc3_.data)
         {
            param1.imageReady(_loc3_.id,_loc3_.data);
         }
         return _loc3_;
      }
      
      public function get linkPattern() : String
      {
         return "openView/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         if(_loc2_[1] == "calendar")
         {
            showCalendar();
         }
      }
      
      private function showCalendar() : void
      {
         if(!var_2229 && var_1784)
         {
            var_2229 = new CalendarView(this,_windowManager);
         }
      }
      
      public function hideCalendar() : void
      {
         if(var_2229)
         {
            var_2229.dispose();
            var_2229 = null;
         }
      }
      
      private function getImageGalleryUrl() : String
      {
         return getProperty("image.library.url");
      }
      
      public function get calendarData() : class_1537
      {
         return var_1784;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return _sessionDataManager.isAnyRoomController;
      }
      
      public function get localizationManager() : class_18
      {
         return _localizationManager;
      }
   }
}
