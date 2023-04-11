package com.sulake.habbo.notifications
{
   import adobe.serialization.json.JSONDecoder;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.event.CatalogEvent;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.notifications.feed.NotificationController;
   import com.sulake.habbo.notifications.singular.SingularNotificationController;
   import com.sulake.habbo.notifications.utils.PetImageUtility;
   import com.sulake.habbo.notifications.utils.ProductImageUtility;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import package_7.class_341;
   
   public class HabboNotifications extends class_20 implements class_2082
   {
       
      
      private var _communication:class_25;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _windowManager:class_1684;
      
      private var _localization:class_18;
      
      private var _inventory:class_1697;
      
      private var _friendList:class_1869;
      
      private var _roomEngine:IRoomEngine;
      
      private var _catalog:IHabboCatalog;
      
      private var _toolBar:IHabboToolbar;
      
      private var var_2589:ProductImageUtility;
      
      private var var_2575:PetImageUtility;
      
      private var _roomSessionManager:IRoomSessionManager;
      
      private var _habboHelp:IHabboHelp;
      
      private var var_2648:NotificationController;
      
      private var var_3231:SingularNotificationController;
      
      private var var_3165:com.sulake.habbo.notifications.class_3136;
      
      private var var_3222:Boolean;
      
      public function HabboNotifications(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_3222 = false;
      }
      
      public function get assetLibrary() : class_21
      {
         return assets;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return _roomSessionManager;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function get toolBar() : IHabboToolbar
      {
         return _toolBar;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return _habboHelp;
      }
      
      public function get singularController() : SingularNotificationController
      {
         return var_3231;
      }
      
      public function get feedController() : NotificationController
      {
         return var_2648;
      }
      
      public function get disabled() : Boolean
      {
         return var_3222;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         var_3222 = param1;
      }
      
      public function get productImageUtility() : ProductImageUtility
      {
         if(_roomEngine == null || _inventory == null)
         {
            return null;
         }
         if(var_2589 == null)
         {
            var_2589 = new ProductImageUtility(_roomEngine,_inventory);
         }
         return var_2589;
      }
      
      public function get petImageUtility() : PetImageUtility
      {
         if(_roomEngine == null)
         {
            return null;
         }
         if(var_2575 == null)
         {
            var_2575 = new PetImageUtility(_roomEngine);
         }
         return var_2575;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboInventory(),function(param1:class_1697):void
         {
            _inventory = param1;
         },false),new ComponentDependency(new IIDHabboFriendList(),function(param1:class_1869):void
         {
            _friendList = param1;
         },false),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDRoomEngine(),function(param1:IRoomEngine):void
         {
            _roomEngine = param1;
         },false),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         },false,[{
            "type":"CATALOG_BUILDER_MEMBERSHIP_EXPIRED",
            "callback":onBuilderMembershipExpired
         },{
            "type":"CATALOG_BUILDER_MEMBERSHIP_IN_GRACE",
            "callback":onBuilderMembershipInGrace
         }]),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolBar = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboRoomSessionManager(),function(param1:IRoomSessionManager):void
         {
            _roomSessionManager = param1;
         },false),new ComponentDependency(new IIDHabboHelp(),function(param1:IHabboHelp):void
         {
            _habboHelp = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         var_3231 = new SingularNotificationController(this);
         var_3165 = new com.sulake.habbo.notifications.class_3136(this,_communication);
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_3165 != null)
         {
            var_3165.dispose();
            var_3165 = null;
         }
         if(var_2648 != null)
         {
            var_2648.dispose();
            var_2648 = null;
         }
         if(var_2575 != null)
         {
            var_2575.dispose();
            var_2575 = null;
         }
         if(var_2589 != null)
         {
            var_2589.dispose();
            var_2589 = null;
         }
         super.dispose();
      }
      
      public function activate() : void
      {
         if(var_2648 != null)
         {
            var_2648.setFeedEnabled(true);
         }
         _communication.connection.send(new class_341());
      }
      
      public function addSongPlayingNotification(param1:String, param2:String) : void
      {
         var_3231.addSongPlayingNotification(param1,param2);
      }
      
      public function showNotification(param1:String, param2:class_24 = null) : void
      {
         var _loc7_:Object = null;
         var _loc9_:String = null;
         var _loc6_:String = null;
         var _loc3_:Boolean = false;
         var _loc5_:String = null;
         if(param2 == null)
         {
            param2 = new class_24();
         }
         var _loc4_:String = "notification." + param1;
         if(propertyExists(_loc4_))
         {
            _loc7_ = new JSONDecoder(getProperty(_loc4_),true).getValue();
            for(var _loc8_ in _loc7_)
            {
               param2[_loc8_] = _loc7_[_loc8_];
            }
         }
         if(param2["display"] == "BUBBLE")
         {
            _loc9_ = getNotificationPart(param2,param1,"message",true);
            _loc3_ = (_loc6_ = getNotificationPart(param2,param1,"linkUrl",false)) != null && _loc6_.substr(0,6) == "event:";
            _loc5_ = getNotificationImageUrl(param2,param1);
            var_3231.addItem(_loc9_,"info",null,_loc5_,null,_loc3_ ? _loc6_.substr(6) : _loc6_);
         }
         else
         {
            new NotificationPopup(this,param1,param2);
         }
      }
      
      public function getNotificationPart(param1:class_24, param2:String, param3:String, param4:Boolean) : String
      {
         var _loc5_:String = null;
         if(param1.hasKey(param3))
         {
            return param1.getValue(param3);
         }
         _loc5_ = ["notification",param2,param3].join(".");
         if(localization.hasLocalization(_loc5_) || param4)
         {
            return localization.getLocalizationWithParamMap(_loc5_,_loc5_,param1);
         }
         return null;
      }
      
      public function getNotificationImageUrl(param1:class_24, param2:String) : String
      {
         var _loc3_:String = param1.getValue("image");
         if(_loc3_ == null)
         {
            _loc3_ = "${image.library.url}notifications/" + param2.replace(/\./g,"_") + ".png";
         }
         return _loc3_;
      }
      
      private function onBuilderMembershipInGrace(param1:CatalogEvent) : void
      {
         showNotification("builders_club.membership_in_grace",null);
      }
      
      private function onBuilderMembershipExpired(param1:CatalogEvent) : void
      {
         showNotification("builders_club.membership_expired",null);
      }
      
      public function createLinkEvent(param1:String) : void
      {
         context.createLinkEvent(param1);
      }
   }
}
