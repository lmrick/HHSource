package com.sulake.habbo.friendbar.landingview
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.habbo.avatar.class_1753;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.event.CatalogEvent;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendbar.IHabboLandingView;
   import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
   import com.sulake.habbo.friendbar.view.AbstractView;
   import com.sulake.habbo.game.class_1688;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.quest.class_2047;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.product.class_1695;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboAvatarEditor;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboGameManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboQuestEngine;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import package_11.class_468;
   import package_116.class_926;
   import package_2.class_482;
   import package_22.class_316;
   import package_88.class_998;
   
   public class HabboLandingView extends AbstractView implements IHabboLandingView
   {
       
      
      private var _landingViewLayout:WidgetContainerLayout;
      
      private var _communicationManager:class_25;
      
      private var _roomSessionManager:IRoomSessionManager;
      
      private var _catalog:IHabboCatalog;
      
      private var _navigator:class_1685;
      
      private var _questEngine:class_2047;
      
      private var _toolbar:IHabboToolbar;
      
      private var _habboHelp:IHabboHelp;
      
      private var _avatarEditor:class_1753;
      
      private var _gameManager:class_1688;
      
      private var _errorLayout:class_3127;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_1420:Boolean = false;
      
      public function HabboLandingView(param1:class_31, param2:uint, param3:class_21)
      {
         super(param1,param2,param3);
      }
      
      public static function positionAfterAndStretch(param1:class_3151, param2:String, param3:String) : void
      {
         var _loc5_:class_3127 = param1.findChildByName(param2);
         var _loc6_:class_3127;
         var _loc4_:int = (_loc6_ = param1.findChildByName(param3)).x;
         _loc6_.x = _loc5_.x + _loc5_.width + 5;
         _loc6_.width += _loc4_ - _loc6_.x;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function get navigator() : class_1685
      {
         return _navigator;
      }
      
      public function get questEngine() : class_2047
      {
         return _questEngine;
      }
      
      public function get tracking() : class_1693
      {
         return _tracking;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get communicationManager() : class_25
      {
         return _communicationManager;
      }
      
      public function get localizationManager() : class_18
      {
         return _localizationManager;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         }),new ComponentDependency(new IIDHabboRoomSessionManager(),function(param1:IRoomSessionManager):void
         {
            _roomSessionManager = param1;
         }),new ComponentDependency(new IIDHabboConfigurationManager(),null),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         }),new ComponentDependency(new IIDHabboNavigator(),function(param1:class_1685):void
         {
            _navigator = param1;
         }),new ComponentDependency(new IIDHabboQuestEngine(),function(param1:class_2047):void
         {
            _questEngine = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         }),new ComponentDependency(new IIDHabboHelp(),function(param1:IHabboHelp):void
         {
            _habboHelp = param1;
         }),new ComponentDependency(new IIDHabboGameManager(),function(param1:class_1688):void
         {
            _gameManager = param1;
         },false),new ComponentDependency(new IIDHabboAvatarEditor(),function(param1:class_1753):void
         {
            _avatarEditor = param1;
         }),new ComponentDependency(new IIDRoomEngine(),function(param1:IRoomEngine):void
         {
            _roomEngine = param1;
         })]);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            var_1420 = false;
            if(_landingViewLayout)
            {
               _landingViewLayout.dispose();
               _landingViewLayout = null;
            }
            if(_toolbar != null && false)
            {
               _toolbar.events.removeEventListener("HTE_TOOLBAR_CLICK",onToolbarClick);
            }
            if(_errorLayout)
            {
               _errorLayout.dispose();
               _errorLayout = null;
            }
            super.dispose();
         }
      }
      
      public function initialize() : void
      {
         var _loc3_:Array = null;
         var _loc5_:int = 0;
         var _loc4_:String = null;
         var_1420 = true;
         var _loc2_:class_3234 = _windowManager.getDesktop(0);
         var _loc1_:class_3127 = _loc2_.getChildByName("hotel_view_welcome_window");
         if(_loc1_ != null)
         {
            _loc2_.removeChild(_loc1_);
            _loc1_.dispose();
         }
         if(newIdentity && getBoolean("landing.view.new_identity_override_enabled"))
         {
            _loc3_ = getProperty("landing.view.new_identity_widgets").split(",");
            _loc5_ = 1;
            while(_loc5_ <= 6)
            {
               _loc4_ = "landing.view.dynamic.slot." + _loc5_ + ".";
               if(_loc5_ == 1 || _loc5_ == 6)
               {
                  setProperty(_loc4_ + "widget","");
               }
               else
               {
                  setProperty(_loc4_ + "widget","widgetcontainer");
                  setProperty(_loc4_ + "conf","2001-01-01 00:00," + _loc3_[_loc5_ - 2]);
               }
               _loc5_++;
            }
            setProperty("landing.view.dynamic.leftPaneWidth","400");
            setProperty("landing.view.dynamic.rightPaneWidth","400");
         }
         _landingViewLayout = new WidgetContainerLayout(this);
         activate();
      }
      
      public function activate() : void
      {
         if(!var_1420)
         {
            tryInitialize();
         }
         if(_toolbar)
         {
            _toolbar.setToolbarState("HTE_STATE_HOTEL_VIEW");
         }
         if(_landingViewLayout != null)
         {
            _landingViewLayout.activate();
         }
         else
         {
            class_14.log("ERROR - Landing view layout is not initialized and cannot be activated - See caught errors in tryInitialize()");
         }
      }
      
      public function disable() : void
      {
         if(_landingViewLayout != null)
         {
            _landingViewLayout.disable();
            toolbarExtensionExtraMargin = false;
         }
      }
      
      public function get isLandingViewVisible() : Boolean
      {
         return _landingViewLayout != null && false && Boolean(_landingViewLayout.window.visible);
      }
      
      public function send(param1:IMessageComposer) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(param1);
         }
      }
      
      private function onToolbarClick(param1:HabboToolbarEvent) : void
      {
         switch(param1.iconId)
         {
            case "HTIE_ICON_RECEPTION":
               if(_roomSessionManager.getSession(-1))
               {
                  send(new class_316());
                  _roomSessionManager.disposeSession(-1);
                  break;
               }
               break;
            case "HTIE_ICON_GAMES":
               if(getBoolean("game.center.enabled"))
               {
                  disable();
                  break;
               }
         }
      }
      
      override protected function initComponent() : void
      {
         _toolbar.events.addEventListener("HTE_TOOLBAR_CLICK",onToolbarClick);
         _catalog.events.addEventListener("CATALOG_INVISIBLE_PAGE_VISITED",onExpiredLinkCLick);
         _communicationManager.addHabboConnectionMessageEvent(new class_468(onNavigatorSettings));
      }
      
      private function onExpiredLinkCLick(param1:CatalogEvent) : void
      {
         if(var_1420 && _landingViewLayout != null && false && Boolean(_landingViewLayout.window.visible))
         {
            activate();
         }
      }
      
      private function onNavigatorSettings(param1:class_468) : void
      {
         if(param1.getParser().roomIdToEnter <= 0)
         {
            tryInitialize();
         }
      }
      
      private function tryInitialize() : void
      {
         _errorLayout = getXmlWindow("initialization_error");
         _errorLayout.visible = false;
         try
         {
            initialize();
            class_3151(_errorLayout.parent).removeChild(_errorLayout);
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("HabboLandingView","Landing view layout initialization failed!");
            _landingViewLayout.dispose();
            _landingViewLayout = null;
            windowManager.getDesktop(0).addChild(_errorLayout);
            _errorLayout.center();
            _errorLayout.visible = true;
            context.root.error("undefined Landing view initialization failed because of a Flash Error. Landing view removed and disposed!",false,e.errorID);
         }
      }
      
      public function getXmlWindow(param1:String, param2:uint = 1) : class_3127
      {
         var _loc5_:IAsset = null;
         var _loc3_:XmlAsset = null;
         var _loc4_:class_3127 = null;
         try
         {
            _loc5_ = assets.getAssetByName(param1 + "_xml");
            _loc3_ = XmlAsset(_loc5_);
            if(_loc5_ == null || _loc3_ == null)
            {
               return null;
            }
            _loc4_ = _windowManager.buildFromXML(XML(_loc3_.content),param2);
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("HabboLandingView","Failed to build window " + param1 + "_xml!");
            throw e;
         }
         return _loc4_;
      }
      
      public function goToRoom(param1:String = null) : void
      {
         if(param1 == null)
         {
            param1 = getProperty("landing.view.roomcategory");
         }
         if(param1 != null)
         {
            send(new class_482(param1));
         }
      }
      
      public function getProductData(param1:String, param2:class_1695) : class_3200
      {
         if(_sessionDataManager.loadProductData(param2))
         {
            return _sessionDataManager.getProductData(param1);
         }
         return null;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return _habboHelp;
      }
      
      public function requestBadge(param1:String) : void
      {
         send(new class_998(param1));
      }
      
      public function communityGoalVote(param1:int) : void
      {
         send(new class_926(param1));
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function set toolbarExtensionExtraMargin(param1:Boolean) : void
      {
         if(_toolbar && false)
         {
            _toolbar.extensionView.extraMargin = param1 ? 10 : 0;
         }
      }
      
      public function get newIdentity() : Boolean
      {
         return getInteger("new.identity",0) > 0;
      }
      
      public function get dynamicLayoutLeftPaneWidth() : int
      {
         return getInteger("landing.view.dynamic.leftPaneWidth",500);
      }
      
      public function get dynamicLayoutRightPaneWidth() : int
      {
         return getInteger("landing.view.dynamic.rightPaneWidth",250);
      }
      
      public function get avatarEditor() : class_1753
      {
         return _avatarEditor;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return _roomEngine;
      }
   }
}
