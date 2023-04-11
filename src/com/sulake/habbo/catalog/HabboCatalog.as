package com.sulake.habbo.catalog
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.class_79;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3207;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.avatar.class_1753;
   import com.sulake.habbo.catalog.club.ClubBuyController;
   import com.sulake.habbo.catalog.club.ClubBuyOfferData;
   import com.sulake.habbo.catalog.club.ClubExtendController;
   import com.sulake.habbo.catalog.club.ClubGiftController;
   import com.sulake.habbo.catalog.clubcenter.HabboClubCenter;
   import com.sulake.habbo.catalog.event.CatalogEvent;
   import com.sulake.habbo.catalog.event.CatalogUserEvent;
   import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
   import com.sulake.habbo.catalog.marketplace.IMarketPlace;
   import com.sulake.habbo.catalog.marketplace.MarketPlaceLogic;
   import com.sulake.habbo.catalog.marketplace.class_3227;
   import com.sulake.habbo.catalog.navigation.CatalogNavigator;
   import com.sulake.habbo.catalog.navigation.RequestedPage;
   import com.sulake.habbo.catalog.navigation.class_3125;
   import com.sulake.habbo.catalog.navigation.class_3188;
   import com.sulake.habbo.catalog.navigation.events.CatalogFurniPurchaseEvent;
   import com.sulake.habbo.catalog.offers.IOfferCenter;
   import com.sulake.habbo.catalog.offers.IOfferExtension;
   import com.sulake.habbo.catalog.offers.OfferCenter;
   import com.sulake.habbo.catalog.purchase.GiftWrappingConfiguration;
   import com.sulake.habbo.catalog.purchase.PlacedObjectPurchaseData;
   import com.sulake.habbo.catalog.purchase.PurchaseConfirmationDialog;
   import com.sulake.habbo.catalog.purchase.RentConfirmationWindow;
   import com.sulake.habbo.catalog.purchase.RoomAdPurchaseData;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.purse.PurseEvent;
   import com.sulake.habbo.catalog.purse.PurseUpdateEvent;
   import com.sulake.habbo.catalog.purse.class_3160;
   import com.sulake.habbo.catalog.targetedoffers.OfferController;
   import com.sulake.habbo.catalog.vault.VaultController;
   import com.sulake.habbo.catalog.viewer.CatalogViewer;
   import com.sulake.habbo.catalog.viewer.GameTokensOffer;
   import com.sulake.habbo.catalog.viewer.IPageLocalization;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.PageLocalization;
   import com.sulake.habbo.catalog.viewer.Product;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.class_3229;
   import com.sulake.habbo.catalog.viewer.class_3232;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBuilderSubscriptionUpdatedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetRoomChangedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetPalettesEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendbar.events.FriendBarSelectionEvent;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.groups.events.GuildSettingsChangedInManageEvent;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.inventory.events.HabboInventoryItemAddedEvent;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.IHabboNewNavigator;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.quest.class_2047;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectPlacedOnUserEvent;
   import com.sulake.habbo.room.object.data.class_1610;
   import com.sulake.habbo.room.preview.RoomPreviewer;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.furniture.class_1696;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_1695;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.utils.FriendlyTime;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.habbo.utils.class_3288;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.iid.*;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.utils.Vector3d;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_10.class_606;
   import package_127.class_1054;
   import package_127.class_1355;
   import package_127.class_1424;
   import package_128.SnowWarGameTokenOffer;
   import package_128.SnowWarGameTokensMessageParser;
   import package_128.class_1055;
   import package_128.class_1058;
   import package_128.class_1147;
   import package_128.class_1194;
   import package_128.class_1209;
   import package_128.class_1212;
   import package_128.class_1275;
   import package_128.class_1290;
   import package_128.class_1384;
   import package_128.class_1466;
   import package_128.class_1486;
   import package_13.class_627;
   import package_130.class_1245;
   import package_130.class_1276;
   import package_156.class_1119;
   import package_23.GetSnowWarGameTokensOfferComposer;
   import package_23.PurchaseSnowWarGameTokensOfferComposer;
   import package_23.class_1033;
   import package_23.class_155;
   import package_23.class_264;
   import package_23.class_381;
   import package_23.class_411;
   import package_23.class_433;
   import package_23.class_479;
   import package_23.class_488;
   import package_23.class_495;
   import package_23.class_496;
   import package_23.class_562;
   import package_23.class_757;
   import package_23.class_806;
   import package_23.class_808;
   import package_23.class_831;
   import package_23.class_832;
   import package_23.class_835;
   import package_23.class_876;
   import package_23.class_882;
   import package_23.class_918;
   import package_28.class_281;
   import package_28.class_448;
   import package_5.class_531;
   import package_5.class_564;
   import package_5.class_993;
   import package_65.class_1011;
   import package_65.class_243;
   import package_65.class_414;
   import package_65.class_524;
   import package_65.class_599;
   import package_65.class_848;
   import package_65.class_871;
   import package_7.class_296;
   import package_70.class_925;
   import package_8.SnowWarGameTokensMessageEvent;
   import package_8.class_1409;
   import package_8.class_148;
   import package_8.class_1535;
   import package_8.class_1565;
   import package_8.class_1608;
   import package_8.class_166;
   import package_8.class_205;
   import package_8.class_236;
   import package_8.class_248;
   import package_8.class_258;
   import package_8.class_277;
   import package_8.class_289;
   import package_8.class_584;
   import package_8.class_640;
   import package_8.class_653;
   import package_8.class_697;
   import package_8.class_742;
   import package_8.class_746;
   import package_8.class_752;
   import package_8.class_768;
   import package_8.class_821;
   import package_8.class_845;
   import package_8.class_917;
   import package_8.class_976;
   import package_9.class_126;
   import package_9.class_359;
   import package_9.class_388;
   import package_9.class_391;
   import package_9.class_758;
   import package_9.class_953;
   import package_99.class_439;
   
   public class HabboCatalog extends class_20 implements IHabboCatalog, class_1695, class_41, ILinkEventTracker, class_1696
   {
      
      public static const GET_SNOWWAR_TOKENS:String = "GET_SNOWWAR_TOKENS";
      
      public static const GET_SNOWWAR_TOKENS2:String = "GET_SNOWWAR_TOKENS2";
      
      public static const GET_SNOWWAR_TOKENS3:String = "GET_SNOWWAR_TOKENS3";
      
      private static const DESKTOP_WINDOW_LAYER:uint = 1;
      
      private static const DEFAULT_VIEW_LOCATION:Point = new Point(100,20);
      
      private static const DEFAULT_VIEW_LOCATION_LARGE:Point = new Point(100,5);
      
      private static const MAX_SEARCH_RESULTS_LENGTH:uint = 200;
      
      private static const NO_KNOWN_OFFER:int = -1;
       
      
      private var _windowManager:class_1684;
      
      private var _communication:class_25;
      
      private var _toolbar:IHabboToolbar;
      
      private var _roomEngine:IRoomEngine;
      
      private var _roomSessionManager:IRoomSessionManager;
      
      private var _roomSession:IRoomSession;
      
      private var _localization:class_18;
      
      private var _inventory:class_1697;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _avatarRenderManager:class_1690;
      
      private var _soundManager:class_2089;
      
      private var _friendList:class_1869;
      
      private var _newNavigator:IHabboNewNavigator;
      
      private var _avatarEditor:class_1753;
      
      private var _questEngine:class_2047;
      
      private var var_2641:com.sulake.habbo.catalog.VideoOfferManager;
      
      private var var_66:Boolean = false;
      
      private var var_3245:Boolean = false;
      
      private var var_1487:CatalogViewer;
      
      private var _catalogNavigators:Dictionary;
      
      private var var_1532:Purse;
      
      private var var_1587:IMarketPlace;
      
      private var var_1446:class_3151;
      
      private var var_1511:PurchaseConfirmationDialog;
      
      private var var_3500:String;
      
      private var var_3100:Boolean;
      
      private var var_3929:Boolean = true;
      
      private var var_3445:Boolean = false;
      
      private var _giftWrappingConfiguration:GiftWrappingConfiguration;
      
      private var var_3093:ClubGiftController;
      
      private var var_2024:ClubBuyController;
      
      private var var_2238:ClubExtendController;
      
      private var var_2381:class_24;
      
      private var var_1818:Boolean = false;
      
      private var _offerInFurniPlacing:com.sulake.habbo.catalog.class_3159;
      
      private var _offerPlacingCallbackReceiver:class_3232;
      
      private var var_1513:PlacedObjectPurchaseData;
      
      private var var_1317:Boolean;
      
      private var var_3952:Boolean;
      
      private var var_1594:RoomPreviewer;
      
      private var var_1920:GuildMembershipsController;
      
      private var var_2975:OfferController;
      
      private var _utils:com.sulake.habbo.catalog.HabboCatalogUtils;
      
      private var var_2849:Boolean = false;
      
      private var var_2071:String = null;
      
      private var var_2104:GameTokensOffer;
      
      private var var_2078:GameTokensOffer;
      
      private var var_2012:GameTokensOffer;
      
      private var _bundleDiscountRuleset:class_1535 = null;
      
      private var var_1798:RequestedPage;
      
      private var var_3517:int;
      
      private var var_1705:RoomAdPurchaseData;
      
      private var var_2526:RentConfirmationWindow;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      private var var_497:String = "NORMAL";
      
      private var var_1807:Vector.<class_3148>;
      
      private var _frontPageItems:Vector.<class_1565>;
      
      private var var_2265:Timer;
      
      private var var_3666:Dictionary;
      
      private var var_4176:Boolean;
      
      private var var_3662:int = -1;
      
      private var var_3593:int;
      
      private var var_3768:int;
      
      private var var_3272:int;
      
      private var var_3619:int;
      
      private var _builderMembershipUpdateTime:int;
      
      private var _builderMembershipDisplayUpdateTime:int;
      
      private var var_3368:Boolean;
      
      private var var_3310:Boolean;
      
      private var _offerCenter:OfferCenter;
      
      public function HabboCatalog(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         var_2381 = new class_24();
         super(param1,param2,param3);
         var_1532 = new Purse();
         _utils = new com.sulake.habbo.catalog.HabboCatalogUtils(this);
         registerUpdateReceiver(this,1);
         var_1798 = new RequestedPage();
         param1.attachComponent(new HabboClubCenter(param1,0,param3),[new IIDHabboClubCenter()]);
         param1.attachComponent(new VaultController(param1,0,param3),[new IIDVaultController()]);
      }
      
      public static function setElementImageCentered(param1:class_3127, param2:BitmapData, param3:int = 0) : void
      {
         var _loc7_:class_3282 = null;
         var _loc4_:class_3207 = null;
         if(param2 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.disposed)
         {
            return;
         }
         var _loc8_:int = param3 > 0 ? param3 : param1.height;
         var _loc5_:int = (param1.width - param2.width) / 2;
         var _loc6_:int = (_loc8_ - param2.height) / 2;
         if(param1 as class_3282 != null)
         {
            if((_loc7_ = class_3282(param1)).bitmap == null || param3 > 0)
            {
               _loc7_.bitmap = new BitmapData(param1.width,_loc8_,true,16777215);
            }
            _loc7_.bitmap.fillRect(_loc7_.bitmap.rect,16777215);
            _loc7_.bitmap.copyPixels(param2,param2.rect,new Point(_loc5_,_loc6_),null,null,false);
            param1.invalidate();
         }
         else if(param1 as class_3207 != null)
         {
            (_loc4_ = class_3207(param1)).setDisplayObject(new Bitmap(param2));
            param1.invalidate();
         }
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get avatarRenderManager() : class_1690
      {
         return _avatarRenderManager;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get connection() : IConnection
      {
         return _communication.connection;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function get giftWrappingConfiguration() : GiftWrappingConfiguration
      {
         return _giftWrappingConfiguration;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return _roomEngine;
      }
      
      public function get soundManager() : class_2089
      {
         return _soundManager;
      }
      
      public function get roomPreviewer() : RoomPreviewer
      {
         if(var_1594 == null)
         {
            initializeRoomPreviewer();
         }
         return var_1594;
      }
      
      public function get navigator() : class_1685
      {
         return _newNavigator.legacyNavigator;
      }
      
      public function get utils() : com.sulake.habbo.catalog.HabboCatalogUtils
      {
         return _utils;
      }
      
      public function get questEngine() : class_2047
      {
         return _questEngine;
      }
      
      public function get videoOffers() : IVideoOfferManager
      {
         return var_2641;
      }
      
      public function get frontPageItems() : Vector.<class_1565>
      {
         return _frontPageItems;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         },false,[{
            "type":"HTE_TOOLBAR_CLICK",
            "callback":onHabboToolbarEvent
         }]),new ComponentDependency(new IIDRoomEngine(),function(param1:IRoomEngine):void
         {
            _roomEngine = param1;
         },false,[{
            "type":"REOE_PLACED",
            "callback":onObjectPlacedInRoom
         },{
            "type":"REOE_PLACED_ON_USER",
            "callback":onObjectPlaceOnUser
         },{
            "type":"REOE_SELECTED",
            "callback":onObjectSelected
         }]),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         },false),new ComponentDependency(new IIDHabboInventory(),function(param1:class_1697):void
         {
            _inventory = param1;
         },false,[{
            "type":"HABBO_INVENTORY_ITEM_ADDED",
            "callback":onItemAddedToInventory
         }]),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDAvatarRenderManager(),function(param1:class_1690):void
         {
            _avatarRenderManager = param1;
         },false),new ComponentDependency(new IIDHabboSoundManager(),function(param1:class_2089):void
         {
            _soundManager = param1;
         },false),new ComponentDependency(new IIDHabboRoomSessionManager(),function(param1:IRoomSessionManager):void
         {
            _roomSessionManager = param1;
         },false,[{
            "type":"RSE_STARTED",
            "callback":onRoomSessionEvent
         },{
            "type":"RSE_ENDED",
            "callback":onRoomSessionEvent
         }]),new ComponentDependency(new IIDHabboFriendList(),function(param1:class_1869):void
         {
            _friendList = param1;
         },false),new ComponentDependency(new IIDHabboNewNavigator(),function(param1:IHabboNewNavigator):void
         {
            _newNavigator = param1;
         },false),new ComponentDependency(new IIDHabboFriendBar(),null,false,[{
            "type":"FBVE_FRIEND_SELECTED",
            "callback":onFriendBarSelectionEvent
         }]),new ComponentDependency(new IIDHabboGroupsManager(),null,false,[{
            "type":"GSCIME_GUILD_VISUAL_SETTINGS_CHANGED",
            "callback":onGuildVisualSettingsChanged
         }]),new ComponentDependency(new IIDHabboAvatarEditor(),function(param1:class_1753):void
         {
            _avatarEditor = param1;
         },false),new ComponentDependency(new IIDHabboQuestEngine(),function(param1:class_2047):void
         {
            _questEngine = param1;
         },false)]);
      }
      
      override protected function initComponent() : void
      {
         _messageEvents = new Vector.<IMessageEvent>(0);
         addMessageEvent(new class_248(onSellablePalettes));
         addMessageEvent(new class_845(onClubGiftInfo));
         addMessageEvent(new class_697(onGiftReceiverNotFound));
         addMessageEvent(new class_1011(onMarketPlaceBuyResult));
         addMessageEvent(new class_746(onCatalogPublished));
         addMessageEvent(new class_277(onLimitedEditionSoldOut));
         addMessageEvent(new class_205(onPurchaseError));
         addMessageEvent(new class_584(onHabboClubOffers));
         addMessageEvent(new class_768(onProductOffer));
         addMessageEvent(new class_243(onMarketplaceConfiguration));
         addMessageEvent(new class_742(onHabboClubExtendOffer));
         addMessageEvent(new class_871(onMarketPlaceCancelResult));
         addMessageEvent(new class_166(onBuildersClubSubscriptionStatus));
         addMessageEvent(new class_752(onBundleDiscountRulesetMessageEvent));
         addMessageEvent(new class_236(onVoucherRedeemOk));
         addMessageEvent(new class_448(onActivityPointNotification));
         addMessageEvent(new class_821(onPurchaseNotAllowed));
         addMessageEvent(new class_653(onVoucherRedeemError));
         addMessageEvent(new class_524(onMarketPlaceOwnOffers));
         addMessageEvent(new class_281(onActivityPoints));
         addMessageEvent(new class_414(onMarketplaceItemStats));
         addMessageEvent(new class_258(onCatalogIndex));
         addMessageEvent(new class_148(onBuildersClubFurniCount));
         addMessageEvent(new SnowWarGameTokensMessageEvent(onSnowWarGameTokenOffer));
         addMessageEvent(new class_993(onSubscriptionInfo));
         addMessageEvent(new class_439(onCreditBalance));
         addMessageEvent(new class_976(onCatalogPage));
         addMessageEvent(new class_848(onMarketplaceMakeOfferResult));
         addMessageEvent(new class_564(onGuildMemberships));
         addMessageEvent(new class_531(onApproveNameResult));
         addMessageEvent(new class_640(onNotEnoughBalance));
         addMessageEvent(new class_917(onPurchaseOK));
         addMessageEvent(new class_289(onGiftWrappingConfiguration));
         addMessageEvent(new class_606(onRoomExit));
         addMessageEvent(new class_599(onMarketPlaceOffers));
         context.addLinkEventTracker(this);
         _sessionDataManager.loadProductData(this);
         var_3952 = isNewItemsNotificationEnabled();
         var_2641 = new com.sulake.habbo.catalog.VideoOfferManager(this);
         var_2975 = new OfferController(this);
         var_1807 = _sessionDataManager.getFurniData(this);
         var_3666 = null;
      }
      
      private function addMessageEvent(param1:IMessageEvent) : void
      {
         _messageEvents.push(_communication.addHabboConnectionMessageEvent(param1));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         removeUpdateReceiver(this);
         if(_messageEvents != null && _communication != null)
         {
            for each(var _loc1_ in _messageEvents)
            {
               _communication.removeHabboConnectionMessageEvent(_loc1_);
            }
         }
         if(var_2641)
         {
            var_2641.dispose();
            var_2641 = null;
         }
         if(_offerCenter != null)
         {
            _offerCenter.dispose();
            _offerCenter = null;
         }
         reset(true);
         context.removeLinkEventTracker(this);
         if(var_1511 != null)
         {
            var_1511.dispose();
            var_1511 = null;
         }
         var_1532 = null;
         var_1587 = null;
         if(var_2024 != null)
         {
            var_2024.dispose();
            var_2024 = null;
         }
         if(var_2238 != null)
         {
            var_2238.dispose();
            var_2238 = null;
         }
         if(var_2381 != null)
         {
            var_2381.dispose();
            var_2381 = null;
         }
         _roomSession = null;
         if(var_2526 != null)
         {
            var_2526.dispose();
            var_2526 = null;
         }
         resetPlacedOfferData();
         var_1818 = false;
         _offerPlacingCallbackReceiver = null;
         if(var_1594 != null)
         {
            var_1594.dispose();
            var_1594 = null;
         }
         if(var_1920 != null)
         {
            var_1920.dispose();
            var_1920 = null;
         }
         if(_utils != null)
         {
            _utils.dispose();
            _utils = null;
         }
         disposeSnowWarTokens();
         if(var_1798)
         {
            var_1798 = null;
         }
         if(var_2975)
         {
            var_2975.dispose();
            var_2975 = null;
         }
         super.dispose();
      }
      
      private function disposeSnowWarTokens() : void
      {
         if(var_2104 != null)
         {
            var_2104.dispose();
            var_2104 = null;
         }
         if(var_2078 != null)
         {
            var_2078.dispose();
            var_2078 = null;
         }
         if(var_2012 != null)
         {
            var_2012.dispose();
            var_2012 = null;
         }
      }
      
      private function init() : Boolean
      {
         if(!var_66 && var_3245)
         {
            createMainWindow();
            createCatalogNavigators();
            createCatalogViewer();
            var_66 = true;
            updatePurse();
            createMarketPlace();
            createClubGiftController();
            getGiftWrappingConfiguration();
            createClubBuyController();
            createClubExtendController();
            createGroupMembershipsController();
            initBundleDiscounts();
            events.dispatchEvent(new CatalogEvent("CATALOG_INITIALIZED"));
            send(new class_155());
            return true;
         }
         return false;
      }
      
      private function reset(param1:Boolean = false) : void
      {
         var _loc2_:Boolean = false;
         var_66 = false;
         if(var_1487 != null)
         {
            var_1487.dispose();
            var_1487 = null;
         }
         if(_catalogNavigators != null)
         {
            for each(var _loc3_ in _catalogNavigators)
            {
               _loc3_.dispose();
            }
            _catalogNavigators = null;
         }
         if(var_1446 != null)
         {
            var_1446.dispose();
            var_1446 = null;
         }
         if(!param1)
         {
            if(_sessionDataManager == null)
            {
               class_79.crash("Could not reload product data after reset() because _sessionDataManager was null",7);
               return;
            }
            _loc2_ = _sessionDataManager.loadProductData(this);
            if(_loc2_)
            {
               init();
            }
            else
            {
               events.dispatchEvent(new CatalogEvent("CATALOG_NOT_READY"));
            }
         }
      }
      
      private function send(param1:IMessageComposer) : void
      {
         if(connection == null)
         {
            return;
         }
         connection.send(param1);
      }
      
      public function loadCatalogPage(param1:int, param2:int, param3:String) : void
      {
         isBusy = true;
         var_3517 = param1;
         send(new class_918(param1,param2,param3));
      }
      
      public function purchaseGameTokensOffer(param1:String) : void
      {
         if(param1 == "GET_SNOWWAR_TOKENS" && var_2104)
         {
            send(new PurchaseSnowWarGameTokensOfferComposer(var_2104.offerId));
         }
         else if(param1 == "GET_SNOWWAR_TOKENS2" && var_2078)
         {
            send(new PurchaseSnowWarGameTokensOfferComposer(var_2078.offerId));
         }
         else if(param1 == "GET_SNOWWAR_TOKENS3" && var_2012)
         {
            send(new PurchaseSnowWarGameTokensOfferComposer(var_2012.offerId));
         }
      }
      
      public function purchaseOffer(param1:int, param2:String = "", param3:int = 1) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:class_3125;
         if((_loc5_ = getCatalogNavigator("NORMAL")) != null)
         {
            if((_loc4_ = _loc5_.getNodesByOfferId(param1,true)) != null)
            {
               purchaseProduct(_loc4_[0].pageId,param1,param2,param3);
            }
         }
      }
      
      public function purchaseProduct(param1:int, param2:int, param3:String = "", param4:int = 1) : void
      {
         if(roomAdPurchaseData == null || roomAdPurchaseData.offerId != param2)
         {
            send(new class_808(param1,param2,param3,param4));
         }
         else
         {
            if(false && var_1705.expirationTime.getTime() < new Date().getTime())
            {
               var_1705.extended = false;
            }
            send(new class_479(param1,param2,roomAdPurchaseData.flatId,roomAdPurchaseData.name,roomAdPurchaseData.extended,roomAdPurchaseData.description,roomAdPurchaseData.categoryId));
         }
      }
      
      public function purchaseVipMembershipExtension(param1:int) : void
      {
         send(new class_882(param1));
      }
      
      public function purchaseBasicMembershipExtension(param1:int) : void
      {
         send(new class_562(param1));
      }
      
      public function purchaseProductAsGift(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int, param7:int, param8:int, param9:Boolean = false) : void
      {
         send(new class_876(param1,param2,param3,param4,param5,param6,param7,param8,param9));
      }
      
      public function get roomAdPurchaseData() : RoomAdPurchaseData
      {
         return var_1705;
      }
      
      public function set roomAdPurchaseData(param1:RoomAdPurchaseData) : void
      {
         var_1705 = param1;
      }
      
      public function approveName(param1:String, param2:int) : void
      {
         send(new class_296(param1,param2));
      }
      
      public function set giftReceiver(param1:String) : void
      {
         var_3500 = param1;
      }
      
      public function getSeasonalCurrencyActivityPointType() : int
      {
         return getInteger("seasonalcurrencyindicator.currency",1);
      }
      
      public function showPurchaseConfirmation(param1:com.sulake.habbo.catalog.class_3159, param2:int, param3:String = "", param4:int = 1, param5:IStuffData = null, param6:String = null, param7:Boolean = true, param8:BitmapData = null) : void
      {
         var _loc14_:* = undefined;
         var _loc11_:* = null;
         var _loc9_:* = null;
         var _loc13_:class_3188 = null;
         if(param2 == -12345678)
         {
            if((_loc14_ = currentCatalogNavigator.getNodesByOfferId(param1.offerId,true)) != null)
            {
               param2 = _loc14_[0].pageId;
            }
         }
         class_14.log("buy: " + [param4,param1.offerId,param3]);
         var _loc12_:int = param1.priceInCredits;
         var _loc15_:int = param1.priceInActivityPoints;
         if(multiplePurchaseEnabled)
         {
            _loc12_ = _utils.calculateBundlePrice(true,param1.priceInCredits,param4);
            _loc15_ = _utils.calculateBundlePrice(true,param1.priceInActivityPoints,param4);
         }
         var _loc10_:* = param1 is GameTokensOffer;
         if(_loc12_ > 0 && _loc12_ > var_1532.credits && !_loc10_)
         {
            showNotEnoughCreditsAlert();
            return;
         }
         if(_loc15_ > 0 && _loc15_ > var_1532.getActivityPointsForType(param1.activityPointType) && !_loc10_)
         {
            showNotEnoughActivityPointsAlert(param1.activityPointType);
            return;
         }
         if(param1 is Offer || var_3100 || param1 is GameTokensOffer)
         {
            if(var_1511 == null || false)
            {
               var_1511 = new PurchaseConfirmationDialog(_localization,assets);
            }
            _loc11_ = [];
            if(_friendList != null)
            {
               _loc11_ = _friendList.getFriendNames();
            }
            if((_loc9_ = param6) == null)
            {
               if(var_3500 != null)
               {
                  _loc9_ = var_3500;
               }
            }
            var_1511.showOffer(this,_roomEngine,param1,param2,param3,param4,param5,_loc11_,_loc9_,param8);
         }
         else if(param1 is ClubBuyOfferData)
         {
            if(param2 == -1)
            {
               if((_loc13_ = currentCatalogNavigator.getNodeByName("hc_membership")) != null)
               {
                  param2 = _loc13_.pageId;
               }
            }
            if(param2 >= 0)
            {
               var_2024.showConfirmation(param1 as ClubBuyOfferData,param2);
            }
         }
         if(var_3100)
         {
            var_3100 = false;
            var_1511.turnIntoGifting();
         }
      }
      
      public function purchaseWillBeGift(param1:Boolean) : void
      {
         var_3100 = param1;
      }
      
      private function initializeRoomPreviewer() : void
      {
         if(_roomEngine != null && false && getBoolean("catalog.furniture.animation"))
         {
            if(var_1594 == null)
            {
               var_1594 = new RoomPreviewer(_roomEngine);
               var_1594.createRoomForPreviews();
            }
         }
      }
      
      private function isNewItemsNotificationEnabled() : Boolean
      {
         return getBoolean("toolbar.new_additions.notification.enabled");
      }
      
      public function openCatalog() : void
      {
         cancelFurniInMover();
         toggleCatalog("NORMAL",true);
      }
      
      public function openCatalogPage(param1:String, param2:String = null) : void
      {
         cancelFurniInMover();
         toggleCatalog(param2 == null ? "NORMAL" : param2,true,false);
         if(!var_66 || _catalogNavigators == null || true)
         {
            var_1798.requestByName = param1;
            return;
         }
         currentCatalogNavigator.openPage(param1);
      }
      
      public function openRoomAdCatalogPageInExtendedMode(param1:String, param2:String, param3:String, param4:String, param5:Date, param6:int) : void
      {
         var _loc8_:int = var_3517;
         var_1705 = new RoomAdPurchaseData();
         var_1705.name = param2;
         var_1705.extended = true;
         var_1705.extendedFlatId = _roomEngine.activeRoomId;
         var_1705.description = param3;
         var_1705.flatId = _roomEngine.activeRoomId;
         var_1705.roomName = param4;
         var_1705.expirationTime = param5;
         var_1705.categoryId = param6;
         openCatalogPage(param1);
         var _loc7_:class_3188;
         if((_loc7_ = currentCatalogNavigator.getNodeByName(param1)) != null && _loc7_.pageId == _loc8_)
         {
            getRoomAdsPurchaseInfo();
         }
      }
      
      public function openCatalogPageByOfferId(param1:int, param2:String) : void
      {
         openCatalogPageById(-12345678,param1,param2);
      }
      
      public function openCatalogPageById(param1:int, param2:int, param3:String) : void
      {
         if(var_66 && _catalogNavigators != null && getCatalogNavigator(param3).initialized)
         {
            toggleCatalog(param3,true,false);
            var_1487.setForceRefresh();
            currentCatalogNavigator.openPageById(param1,param2);
         }
         else
         {
            toggleCatalog(param3);
            var_1798.requestById = param1;
            var_1798.requestedOfferId = param2;
         }
      }
      
      public function openInventoryCategory(param1:String) : void
      {
         if(_inventory == null)
         {
            return;
         }
         _inventory.toggleInventoryPage(param1);
      }
      
      public function openCreditsHabblet() : void
      {
         HabboWebTools.openWebPageAndMinimizeClient(getProperty("web.shop.relativeUrl"));
      }
      
      public function get privateRoomSessionActive() : Boolean
      {
         return var_3445;
      }
      
      public function get tradingActive() : Boolean
      {
         if(_inventory == null)
         {
            return false;
         }
         return _inventory.tradingActive;
      }
      
      public function getProductData(param1:String) : class_3200
      {
         return _sessionDataManager.getProductData(param1);
      }
      
      public function getFurnitureData(param1:int, param2:String) : class_3148
      {
         var _loc3_:class_3148 = null;
         if(param2 == "s")
         {
            _loc3_ = _sessionDataManager.getFloorItemData(param1);
         }
         if(param2 == "i")
         {
            _loc3_ = _sessionDataManager.getWallItemData(param1);
         }
         return _loc3_;
      }
      
      public function getFurnitureDataByName(param1:String, param2:String, param3:int = 0) : class_3148
      {
         var _loc4_:class_3148 = null;
         if(_sessionDataManager == null)
         {
            return null;
         }
         if(param2 == "s")
         {
            _loc4_ = _sessionDataManager.getFloorItemDataByName(param1);
         }
         if(param2 == "i")
         {
            _loc4_ = _sessionDataManager.getWallItemDataByName(param1);
         }
         return _loc4_;
      }
      
      public function getPurse() : class_3160
      {
         return var_1532;
      }
      
      public function getMarketPlace() : IMarketPlace
      {
         return var_1587;
      }
      
      public function getClubGiftController() : ClubGiftController
      {
         return var_3093;
      }
      
      public function getClubBuyController() : ClubBuyController
      {
         return var_2024;
      }
      
      public function getClubExtendController() : ClubExtendController
      {
         return var_2238;
      }
      
      public function getPublicMarketPlaceOffers(param1:int, param2:int, param3:String, param4:int) : void
      {
         send(new class_126(param1,param2,param3,param4));
      }
      
      public function getRoomAdsPurchaseInfo() : void
      {
         send(new class_381());
      }
      
      public function sendRoomAdPurchaseInitiatedEvent() : void
      {
         send(new class_757());
      }
      
      public function getOwnMarketPlaceOffers() : void
      {
         send(new class_391());
      }
      
      public function buyMarketPlaceOffer(param1:int) : void
      {
         send(new class_758(param1));
      }
      
      public function redeemSoldMarketPlaceOffers() : void
      {
         send(new class_953());
      }
      
      public function redeemExpiredMarketPlaceOffer(param1:int) : void
      {
         send(new class_359(param1));
      }
      
      public function getMarketplaceItemStats(param1:int, param2:int) : void
      {
         if(!_communication)
         {
            return;
         }
         send(new class_388(param1,param2));
      }
      
      public function getGroupMembershipsController() : GuildMembershipsController
      {
         return var_1920;
      }
      
      public function getPixelEffectIcon(param1:int) : BitmapData
      {
         var _loc2_:BitmapDataAsset = (_inventory as class_20).assets.getAssetByName("fx_icon_" + param1 + "_png") as BitmapDataAsset;
         if(_loc2_ != null && _loc2_.content != null)
         {
            return (_loc2_.content as BitmapData).clone();
         }
         return new BitmapData(1,1,true,16777215);
      }
      
      public function getSubscriptionProductIcon(param1:int) : BitmapData
      {
         var _loc2_:BitmapDataAsset = assets.getAssetByName("icon_hc") as BitmapDataAsset;
         if(_loc2_ != null)
         {
            return (_loc2_.content as BitmapData).clone();
         }
         return new BitmapData(1,1,true,16777215);
      }
      
      public function getSellablePetPalettes(param1:String) : Array
      {
         var _loc2_:Array = var_2381.getValue(param1);
         if(_loc2_ != null)
         {
            return _loc2_.slice();
         }
         send(new class_433(param1));
         return null;
      }
      
      private function updatePurse() : void
      {
         var _loc4_:String = null;
         if(var_1446 == null)
         {
            return;
         }
         _localization.registerParameter("catalog.purse.creditbalance","balance","null");
         _localization.registerParameter("catalog.purse.pixelbalance","balance",String(var_1532.getActivityPointsForType(0)));
         var _loc3_:Number = 11;
         if(true)
         {
            _loc4_ = "catalog.purse.club.join";
         }
         else
         {
            if(false)
            {
               _loc4_ = "catalog.purse.vipdays";
               _loc3_ = 12;
            }
            else
            {
               _loc4_ = "catalog.purse.clubdays";
            }
            _localization.registerParameter(_loc4_,"days","null");
            _localization.registerParameter(_loc4_,"months","null");
         }
         var _loc2_:IIconWindow = var_1446.findChildByName("clubIcon") as IIconWindow;
         if(_loc2_)
         {
            _loc2_.style = _loc3_;
         }
         var _loc1_:ITextWindow = var_1446.findChildByName("clubText") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.caption = _localization.getLocalization(_loc4_);
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type != "HTE_TOOLBAR_CLICK")
         {
            return;
         }
         switch(param1.iconId)
         {
            case "HTIE_ICON_CATALOGUE":
               toggleCatalog("NORMAL");
               break;
            case "HTIE_ICON_BUILDER":
               toggleCatalog("BUILDERS_CLUB");
         }
      }
      
      private function setElementColour(param1:String, param2:int) : void
      {
         if(var_1446 == null)
         {
            return;
         }
         var _loc3_:class_3127 = var_1446.findChildByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.color = param2;
         }
      }
      
      public function get buildersClubEnabled() : Boolean
      {
         return getBoolean("builders.club.enabled");
      }
      
      public function toggleCatalog(param1:String, param2:Boolean = false, param3:Boolean = true) : void
      {
         var _loc4_:ITextFieldWindow = null;
         if(!_sessionDataManager.hasSecurity(5) && !buildersClubEnabled)
         {
            param1 = "NORMAL";
         }
         var _loc5_:* = param1 != var_497;
         var_497 = param1;
         cancelFurniInMover();
         if(var_1446 == null)
         {
            if(init() == false)
            {
               return;
            }
         }
         if(currentCatalogNavigator == null || true)
         {
            refreshCatalogIndex(var_497);
         }
         if(!mainWindowVisible() || param2 || _loc5_)
         {
            if(var_1317)
            {
               var_1317 = false;
               events.dispatchEvent(new CatalogEvent("CATALOG_NEW_ITEMS_HIDE"));
               markNewAdditionPageOpened();
            }
            showMainWindow();
         }
         else if(!WindowToggle.isHiddenByOtherWindows(var_1446))
         {
            hideMainWindow();
         }
         if(mainWindowVisible())
         {
            if(var_1446 != null)
            {
               var_1446.activate();
               if(_loc4_ = var_1446.findChildByName("search.input") as ITextFieldWindow)
               {
                  _loc4_.focus();
                  _loc4_.setSelection(0,_loc4_.text.length);
               }
            }
            else
            {
               class_14.log("[Catalog] No main container!");
            }
            HabboTracking.getInstance().trackGoogle("catalogue","open");
         }
         if(var_1446 != null)
         {
            var_1446.color = param1 == "NORMAL" ? 4296112 : 16758076;
            var_1446.caption = param1 == "NORMAL" ? "${catalog.title}" : "${builder.catalog.title}";
            var_1446.findChildByName("catalog.header.background.border").color = param1 == "NORMAL" ? 4281819765 : 4283320388;
            var_1446.findChildByName("catalog.header.background.body").color = param1 == "NORMAL" ? 4279123794 : 4281149220;
            var_1446.findChildByName("catalog.mode.header").visible = param1 == "NORMAL";
            var_1446.findChildByName("builder.mode.header").visible = param1 == "BUILDERS_CLUB";
            refreshBuilderStatus();
         }
         if(mainWindowVisible())
         {
            events.dispatchEvent(new Event("HABBO_CATALOG_TRACKING_EVENT_OPEN"));
         }
         else
         {
            events.dispatchEvent(new Event("HABBO_CATALOG_TRACKING_EVENT_CLOSE"));
         }
         if(_loc5_ && currentCatalogNavigator != null)
         {
            if(param3)
            {
               currentCatalogNavigator.deactivateCurrentNode();
               currentCatalogNavigator.loadFrontPage();
            }
            currentCatalogNavigator.showIndex();
            if(var_1487 != null)
            {
               var_1487.setForceRefresh();
            }
         }
      }
      
      private function getCurrentLayoutCode() : String
      {
         if(var_1487 == null)
         {
            return "";
         }
         return var_1487.getCurrentLayoutCode();
      }
      
      private function refreshCatalogIndex(param1:String) : void
      {
         send(new class_496(param1));
      }
      
      private function markNewAdditionPageOpened() : void
      {
         send(new class_831());
      }
      
      private function createCatalogNavigators() : void
      {
         _catalogNavigators = new Dictionary();
         _catalogNavigators["NORMAL"] = new CatalogNavigator(this,var_1446,"NORMAL");
         _catalogNavigators["BUILDERS_CLUB"] = new CatalogNavigator(this,var_1446,"BUILDERS_CLUB");
         var _loc1_:BitmapDataAsset = assets.getAssetByName("purse_coins_small") as BitmapDataAsset;
         setElementImage("creditsIcon",_loc1_.content as BitmapData);
         var _loc3_:BitmapDataAsset = assets.getAssetByName("purse_pixels_small") as BitmapDataAsset;
         setElementImage("pixelsIcon",_loc3_.content as BitmapData);
         var _loc2_:BitmapDataAsset = assets.getAssetByName("purse_club_small") as BitmapDataAsset;
         setElementImage("clubIcon",_loc2_.content as BitmapData);
      }
      
      private function createCatalogViewer() : void
      {
         var _loc1_:class_3151 = var_1446.findChildByName("layoutContainer") as class_3151;
         var_1487 = new CatalogViewer(this,_loc1_);
      }
      
      private function createMainWindow() : void
      {
         var _loc4_:String = null;
         var _loc2_:class_3127 = null;
         if(useNonTabbedCatalog())
         {
            _loc4_ = "catalog_ubuntu";
         }
         else
         {
            _loc4_ = "catalog_ubuntu_with_tabs";
         }
         var _loc5_:XmlAsset = assets.getAssetByName(_loc4_) as XmlAsset;
         var_1446 = _windowManager.buildFromXML(_loc5_.content as XML,1) as class_3151;
         var_1446.tags.push("habbo_catalog");
         var_1446.position = DEFAULT_VIEW_LOCATION_LARGE;
         hideMainWindow();
         var _loc3_:class_3127 = var_1446.findChildByName("titlebar_close_button");
         if(_loc3_ == null)
         {
            _loc3_ = var_1446.findChildByTag("close");
         }
         if(_loc3_ != null)
         {
            _loc3_.procedure = onWindowClose;
         }
         var _loc1_:ITextFieldWindow = var_1446.findChildByName("search.input") as ITextFieldWindow;
         if(_loc1_)
         {
            _loc1_.addEventListener("WKE_KEY_DOWN",onSearchInputEvent);
            _loc1_.addEventListener("WKE_KEY_UP",onSearchInputEvent);
            _loc1_.setSelection(0,_loc1_.text.length);
            _loc1_.focus();
            _loc2_ = var_1446.findChildByName("clear_search_button");
            if(_loc2_)
            {
               _loc2_.addEventListener("WME_CLICK",onClearSearch);
            }
         }
      }
      
      public function set isBusy(param1:Boolean) : void
      {
         var _loc2_:class_3127 = null;
         if(var_1446)
         {
            var_1446.caption = param1 ? "${generic.loading}" : "${catalog.title}";
            _loc2_ = var_1446.findChildByName("search_waiting_for_results_mask");
            if(_loc2_)
            {
               _loc2_.visible = param1;
            }
         }
      }
      
      private function onSelectSearch(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_)
         {
            _loc2_.setSelection(0,_loc2_.text.length);
            _loc2_.focus();
         }
      }
      
      private function onClearSearch(param1:WindowMouseEvent = null) : void
      {
         var _loc2_:ITextFieldWindow = var_1446.findChildByName("search.input") as ITextFieldWindow;
         _loc2_.caption = "";
         _loc2_.setSelection(0,_loc2_.text.length);
         _loc2_.focus();
         var _loc3_:IStaticBitmapWrapperWindow = var_1446.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow;
         _loc3_.assetUri = "common_small_pen";
         if(false)
         {
            currentCatalogNavigator.openPageById(var_1487.previousPageId,-1);
         }
         var_1446.findChildByName("search.helper").visible = true;
      }
      
      private function onSearchInputEvent(param1:WindowKeyboardEvent) : void
      {
         if(param1.type == "WKE_KEY_DOWN")
         {
            if(var_2265)
            {
               var_2265.stop();
            }
            return;
         }
         if(var_2265 == null)
         {
            var_2265 = new Timer(50,1);
         }
         if(param1.target.caption.length >= 3)
         {
            var_2265.addEventListener("timer",onKeyUpSearchTimer);
            var_2265.start();
         }
         var _loc2_:class_3127 = var_1446.findChildByName("search.helper");
         _loc2_.visible = param1.target.caption.length == 0;
         var _loc3_:IStaticBitmapWrapperWindow = var_1446.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow;
         _loc3_.assetUri = param1.target.caption.length > 0 ? "icons_close" : "common_small_pen";
         if(param1.target.caption.length == 0)
         {
            onClearSearch();
         }
         else if(param1.keyCode == 13)
         {
            performSearch(param1.target.caption);
         }
      }
      
      private function onKeyUpSearchTimer(param1:TimerEvent) : void
      {
         var _loc2_:ITextFieldWindow = var_1446.findChildByName("search.input") as ITextFieldWindow;
         performSearch(_loc2_.caption);
      }
      
      private function performSearch(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc8_:* = undefined;
         var _loc5_:* = undefined;
         if(var_2265)
         {
            var_2265.stop();
         }
         if(var_1807 == null || param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc2_:* = [];
         var _loc4_:Vector.<class_3148> = new Vector.<class_3148>(0);
         var _loc7_:String = param1.toLocaleLowerCase().replace(" ","");
         for each(var _loc6_ in var_1807)
         {
            if(!(var_497 == "BUILDERS_CLUB" && !_loc6_.availableForBuildersClub))
            {
               if(!(var_497 == "NORMAL" && _loc6_.excludedFromDynamic))
               {
                  _loc3_ = [_loc6_.localizedName,_loc6_.description,_loc6_.className].join(" ");
                  _loc3_ = _loc3_.replace(/ /gi,"");
                  if(var_497 == "BUILDERS_CLUB" && _loc6_.purchaseOfferId == -1 && _loc6_.rentOfferId == -1)
                  {
                     if(_loc6_.furniLine != "" && _loc2_.indexOf(_loc6_.furniLine) < 0)
                     {
                        if(_loc3_.toLocaleLowerCase().indexOf(_loc7_) >= 0)
                        {
                           _loc2_.push(_loc6_.furniLine);
                        }
                     }
                  }
                  else
                  {
                     _loc8_ = currentCatalogNavigator.getNodesByOfferId(_loc6_.purchaseOfferId,true);
                     _loc5_ = currentCatalogNavigator.getNodesByOfferId(_loc6_.rentOfferId,true);
                     if(_loc8_ != null || var_497 == "NORMAL" && _loc5_ != null)
                     {
                        if(_loc3_.toLocaleLowerCase().indexOf(_loc7_) >= 0)
                        {
                           _loc4_.push(_loc6_);
                           if(_loc4_.length >= 200)
                           {
                              break;
                           }
                        }
                     }
                  }
               }
            }
         }
         localization.registerParameter("catalog.search.results","count",_loc4_.length.toString());
         localization.registerParameter("catalog.search.results","needle",param1);
         var_1446.findChildByName("catalog.header.title").caption = "${catalog.search.header}";
         currentCatalogNavigator.deactivateCurrentNode();
         var_1487.showSearchResults(_loc4_);
         currentCatalogNavigator.filter(_loc7_,_loc2_);
      }
      
      public function furniDataReady() : void
      {
         var_1807 = _sessionDataManager.getFurniData(this);
         var_3666 = null;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case "RSE_STARTED":
               var_3445 = param1.session.isPrivateRoom;
               _roomSession = param1.session;
               break;
            case "RSE_ENDED":
               var_3445 = false;
               _roomSession = null;
         }
         if(currentPage != null)
         {
            currentPage.dispatchWidgetEvent(new CatalogWidgetRoomChangedEvent());
         }
      }
      
      private function createMarketPlace() : void
      {
         if(var_1587 == null)
         {
            var_1587 = new MarketPlaceLogic(this,_windowManager,_roomEngine);
         }
      }
      
      private function createClubGiftController() : void
      {
         if(var_3093 == null)
         {
            var_3093 = new ClubGiftController(this);
         }
      }
      
      private function createClubBuyController() : void
      {
         if(var_2024 == null)
         {
            var_2024 = new ClubBuyController(this,connection);
         }
      }
      
      private function createClubExtendController() : void
      {
         if(var_2238 == null)
         {
            var_2238 = new ClubExtendController(this);
         }
      }
      
      private function createGroupMembershipsController() : void
      {
         if(var_1920 == null)
         {
            var_1920 = new GuildMembershipsController(this);
         }
      }
      
      private function getGiftWrappingConfiguration() : void
      {
         send(new class_835());
      }
      
      public function getHabboClubOffers(param1:int) : void
      {
         send(new class_1033(param1));
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         hideMainWindow();
         if(var_1487 != null)
         {
            var_1487.catalogWindowClosed();
         }
      }
      
      private function onCatalogIndex(param1:class_258) : void
      {
         var _loc2_:class_3125 = getCatalogNavigator(param1.catalogType);
         if(_loc2_ == null)
         {
            return;
         }
         var_1317 = param1.newAdditionsAvailable;
         _loc2_.buildCatalogIndex(param1.root);
         if(param1.catalogType == var_497)
         {
            _loc2_.showIndex();
         }
         switch(0)
         {
            case 0:
               if(var_1317 && var_3952 && !newAdditionsPageOpenDisabled && param1.catalogType == "NORMAL")
               {
                  events.dispatchEvent(new CatalogEvent("CATALOG_NEW_ITEMS_SHOW"));
                  openCatalogPage("new_additions");
                  break;
               }
               _loc2_.loadFrontPage();
               break;
            case 1:
               _loc2_.openPageById(var_1798.requestId,var_1798.requestedOfferId);
               var_1798.resetRequest();
               break;
            case 2:
               _loc2_.openPage(var_1798.requestName);
               var_1798.resetRequest();
         }
      }
      
      private function onCatalogPage(param1:class_976) : void
      {
         var _loc10_:* = undefined;
         var _loc11_:class_3200 = null;
         var _loc8_:class_3148 = null;
         var _loc12_:Offer = null;
         var _loc13_:class_1212;
         if((_loc13_ = param1.getParser()).catalogType != var_497)
         {
            return;
         }
         var _loc9_:int = _loc13_.pageId;
         var _loc4_:String = _loc13_.layoutCode;
         var _loc5_:Array = _loc13_.localization.images.concat();
         var _loc14_:Array = _loc13_.localization.texts.concat();
         var _loc2_:IPageLocalization = new PageLocalization(_loc5_,_loc14_);
         var _loc15_:int = _loc13_.offerId;
         var _loc6_:Boolean = _loc13_.acceptSeasonCurrencyAsCredits;
         var _loc3_:Vector.<com.sulake.habbo.catalog.class_3159> = new Vector.<com.sulake.habbo.catalog.class_3159>(0);
         for each(var _loc16_ in _loc13_.offers)
         {
            _loc10_ = new Vector.<class_3169>(0);
            _loc11_ = getProductData(_loc16_.localizationId);
            for each(var _loc7_ in _loc16_.products)
            {
               _loc8_ = getFurnitureData(_loc7_.furniClassId,_loc7_.productType);
               _loc10_.push(new Product(_loc7_.productType,_loc7_.furniClassId,_loc7_.extraParam,_loc7_.productCount,_loc11_,_loc8_,this,_loc7_.uniqueLimitedItem,_loc7_.uniqueLimitedItemSeriesSize,_loc7_.uniqueLimitedItemsLeft));
            }
            if(!(_loc10_.length == 0 && !com.sulake.habbo.catalog.HabboCatalogUtils.buildersClub(_loc16_.localizationId)))
            {
               if((_loc12_ = new Offer(_loc16_.offerId,_loc16_.localizationId,_loc16_.isRent,_loc16_.priceInCredits,_loc16_.priceInActivityPoints,_loc16_.activityPointType,_loc16_.giftable,_loc16_.clubLevel,_loc10_,_loc16_.bundlePurchaseAllowed,this)).productContainer != null && isOfferCompatibleWithCurrentMode(_loc12_))
               {
                  _loc3_.push(_loc12_);
               }
               else
               {
                  _loc12_.dispose();
               }
            }
         }
         if(_loc13_.frontPageItems != null && _loc13_.frontPageItems.length > 0)
         {
            _frontPageItems = _loc13_.frontPageItems;
         }
         if(var_1487 != null && var_3517 == _loc9_)
         {
            var_1487.showCatalogPage(_loc9_,_loc4_,_loc2_,_loc3_,_loc15_,_loc6_);
         }
         isBusy = false;
      }
      
      private function isOfferCompatibleWithCurrentMode(param1:Offer) : Boolean
      {
         return var_497 == "NORMAL" || param1.pricingModel != "pricing_model_bundle" && param1.pricingModel != "pricing_model_multi";
      }
      
      private function onCatalogPublished(param1:IMessageEvent) : void
      {
         var _loc2_:Boolean = mainWindowVisible();
         reset();
         if(_loc2_)
         {
            _windowManager.alert("${catalog.alert.published.title}","${catalog.alert.published.description}",0,alertDialogEventProcessor);
         }
      }
      
      private function onPurchaseError(param1:IMessageEvent) : void
      {
         var _loc3_:class_205 = param1 as class_205;
         var _loc2_:class_1209 = _loc3_.getParser();
         var _loc4_:int;
         var _loc5_:String = (_loc4_ = _loc2_.errorCode) > 0 ? "${catalog.alert.purchaseerror.description." + _loc4_ + "}" : "${catalog.alert.purchaseerror.description}";
         _windowManager.alert("${catalog.alert.purchaseerror.title}",_loc5_,0,alertDialogEventProcessor);
         if(var_1511 != null)
         {
            var_1511.dispose();
            var_1511 = null;
         }
      }
      
      private function onPurchaseNotAllowed(param1:IMessageEvent) : void
      {
         var _loc2_:class_821 = param1 as class_821;
         var _loc3_:class_1194 = _loc2_.getParser();
         var _loc4_:int = _loc3_.errorCode;
         var _loc5_:String = "";
         switch(_loc4_ - 1)
         {
            case 0:
               _loc5_ = "${catalog.alert.purchasenotallowed.hc.description}";
               break;
            default:
               _loc5_ = "${catalog.alert.purchasenotallowed.unknown.description}";
         }
         _windowManager.alert("${catalog.alert.purchasenotallowed.title}",_loc5_,0,alertDialogEventProcessor);
      }
      
      private function onPurchaseOK(param1:IMessageEvent) : void
      {
         var _loc6_:class_3282 = null;
         var _loc2_:BitmapData = null;
         var _loc7_:Point = null;
         var _loc5_:String = null;
         var _loc3_:class_917 = param1 as class_917;
         var _loc4_:class_1290 = _loc3_.getParser();
         events.dispatchEvent(new CatalogFurniPurchaseEvent(_loc4_.offer.localizationId));
         if(var_1511 != null)
         {
            if(!var_1818 && !var_1511.isGiftPurchase())
            {
               if(_loc6_ = var_1511.getIconWrapper())
               {
                  _loc2_ = _loc6_.bitmap;
                  if(_loc2_)
                  {
                     _loc7_ = new Point();
                     _loc6_.getGlobalPosition(_loc7_);
                     _loc5_ = "HTIE_ICON_INVENTORY";
                     if(false)
                     {
                        _loc5_ = "HTIE_ICON_MEMENU";
                     }
                     _toolbar.createTransitionToIcon(_loc5_,_loc2_.clone(),_loc7_.x,_loc7_.y);
                  }
               }
            }
            var_1511.dispose();
         }
         var_1511 = null;
      }
      
      private function onGiftReceiverNotFound(param1:class_697) : void
      {
         if(var_1511 != null)
         {
            var_1511.receiverNotFound();
         }
      }
      
      private function onNotEnoughBalance(param1:IMessageEvent) : void
      {
         var _loc3_:class_640 = param1 as class_640;
         var _loc2_:class_1058 = _loc3_.getParser();
         if(_loc2_.notEnoughCredits)
         {
            showNotEnoughCreditsAlert();
         }
         else if(_loc2_.notEnoughActivityPoints)
         {
            showNotEnoughActivityPointsAlert(_loc2_.activityPointType);
         }
         if(var_1511 != null)
         {
            var_1511.notEnoughCredits();
         }
      }
      
      public function setLeftPaneVisibility(param1:Boolean) : void
      {
         if(!var_1446)
         {
            return;
         }
         var _loc2_:class_3127 = var_1446.findChildByName("navigationContainer");
         if(_loc2_)
         {
            _loc2_.visible = param1;
         }
         _loc2_ = var_1446.findChildByName("searchContainer");
         if(_loc2_)
         {
            _loc2_.visible = param1;
         }
      }
      
      public function showNotEnoughCreditsAlert() : void
      {
         if(!_windowManager)
         {
            return;
         }
         _windowManager.confirm("${catalog.alert.notenough.title}","${catalog.alert.notenough.credits.description}",0,noCreditsConfirmDialogEventProcessor);
      }
      
      public function showNotEnoughActivityPointsAlert(param1:int) : void
      {
         var _loc2_:String = "catalog.alert.notenough.activitypoints.title." + param1;
         var _loc3_:String = "catalog.alert.notenough.activitypoints.description." + param1;
         if(param1 == 0)
         {
            _windowManager.confirm(localization.getLocalization(_loc2_),localization.getLocalization(_loc3_),0,noDucketsConfirmDialogEventProcessor);
         }
         else
         {
            _windowManager.alert(localization.getLocalization(_loc2_),localization.getLocalization(_loc3_),0,alertDialogEventProcessor);
         }
      }
      
      private function onVoucherRedeemOk(param1:class_236) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = "${catalog.alert.voucherredeem.ok.description}";
         if(param1.productName != "")
         {
            _loc2_ = "catalog.alert.voucherredeem.ok.description.furni";
            _localization.registerParameter(_loc2_,"productName",param1.productName);
            _localization.registerParameter(_loc2_,"productDescription",param1.productDescription);
            _loc2_ = "${" + _loc2_ + "}";
         }
         _windowManager.alert("${catalog.alert.voucherredeem.ok.title}",_loc2_,0,alertDialogEventProcessor);
      }
      
      private function onVoucherRedeemError(param1:class_653) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:String = "${catalog.alert.voucherredeem.error.description." + param1.errorCode + "}";
         _windowManager.alert("${catalog.alert.voucherredeem.error.title}",_loc3_,0,alertDialogEventProcessor);
      }
      
      private function onApproveNameResult(param1:class_531) : void
      {
         if(param1 == null || var_1487 == null)
         {
            return;
         }
         var _loc2_:class_1245 = param1.getParser();
         var_1487.dispatchWidgetEvent(new CatalogWidgetApproveNameResultEvent(_loc2_.result,_loc2_.nameValidationInfo));
      }
      
      private function onCreditBalance(param1:IMessageEvent) : void
      {
         var _loc3_:class_439 = param1 as class_439;
         var _loc2_:class_1119 = _loc3_.getParser();
         var_1532.credits = _loc2_.balance;
         updatePurse();
         if(!var_3929 && _soundManager != null)
         {
            _soundManager.playSound("HBST_purchase");
         }
         var_3929 = false;
         events.dispatchEvent(new PurseEvent("catalog_purse_credit_balance",var_1532.credits,0));
         events.dispatchEvent(new PurseUpdateEvent());
      }
      
      private function onActivityPointNotification(param1:IMessageEvent) : void
      {
         var _loc2_:class_448 = param1 as class_448;
         var_1532.activityPoints[_loc2_.type] = _loc2_.amount;
         updatePurse();
         if(_soundManager != null && _loc2_.type == 0)
         {
            _soundManager.playSound("HBST_pixels");
         }
         events.dispatchEvent(new PurseEvent("catalog_purse_activity_point_balance",_loc2_.amount,_loc2_.type));
         events.dispatchEvent(new PurseUpdateEvent());
      }
      
      private function onActivityPoints(param1:IMessageEvent) : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_281 = param1 as class_281;
         var_1532.activityPoints = _loc3_.points;
         updatePurse();
         for(var _loc2_ in _loc3_.points)
         {
            _loc4_ = int(_loc2_);
            events.dispatchEvent(new PurseEvent("catalog_purse_activity_point_balance",_loc3_.points[_loc4_],_loc4_));
         }
         events.dispatchEvent(new PurseUpdateEvent());
      }
      
      private function onSubscriptionInfo(param1:IMessageEvent) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:class_1276 = (param1 as class_993).getParser();
         var_1532.clubDays = Math.max(0,_loc2_.daysToPeriodEnd);
         var_1532.clubPeriods = Math.max(0,_loc2_.periodsSubscribedAhead);
         var_1532.isVIP = _loc2_.isVIP;
         var_1532.pastClubDays = _loc2_.pastClubDays;
         var_1532.pastVipDays = _loc2_.pastVipDays;
         var_1532.isExpiring = _loc2_.responseType == 3 ? true : false;
         var_1532.minutesUntilExpiration = _loc2_.minutesUntilExpiration;
         var_1532.minutesSinceLastModified = _loc2_.minutesSinceLastModified;
         if(false)
         {
            if(_loc2_.productName == "habbo_club" || _loc2_.productName == "club_habbo")
            {
               _loc3_ = _loc2_.isVIP && _loc2_.minutesUntilExpiration > 0;
               ExternalInterface.call("FlashExternalInterface.subscriptionUpdated",_loc3_);
            }
         }
         updatePurse();
         if(_loc2_.responseType == 2)
         {
            reset();
            if(var_2071 != null)
            {
               openCatalogPage(var_2071);
               var_2071 = null;
            }
         }
      }
      
      private function onClubGiftInfo(param1:class_845) : void
      {
         if(!param1 || !var_3093)
         {
            return;
         }
         var _loc2_:class_1486 = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         var_3093.setInfo(_loc2_.daysUntilNextGift,_loc2_.giftsAvailable,_loc2_.offers,_loc2_.giftData);
      }
      
      private function onMarketPlaceOffers(param1:IMessageEvent) : void
      {
         if(var_1587 != null)
         {
            var_1587.onOffers(param1);
         }
      }
      
      private function onMarketPlaceOwnOffers(param1:IMessageEvent) : void
      {
         if(var_1587 != null)
         {
            var_1587.onOwnOffers(param1);
         }
      }
      
      private function onMarketPlaceBuyResult(param1:IMessageEvent) : void
      {
         if(var_1587 != null)
         {
            var_1587.onBuyResult(param1);
         }
      }
      
      private function onMarketPlaceCancelResult(param1:IMessageEvent) : void
      {
         if(var_1587 != null)
         {
            var_1587.onCancelResult(param1);
         }
      }
      
      private function onGiftWrappingConfiguration(param1:class_289) : void
      {
         if(param1 == null)
         {
            return;
         }
         _giftWrappingConfiguration = new GiftWrappingConfiguration(param1);
      }
      
      private function onMarketplaceItemStats(param1:class_414) : void
      {
         if(!param1 || !var_1587)
         {
            return;
         }
         var _loc2_:class_1054 = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:class_3227 = new class_3227();
         _loc3_.averagePrice = _loc2_.averagePrice;
         _loc3_.offerCount = _loc2_.offerCount;
         _loc3_.historyLength = _loc2_.historyLength;
         _loc3_.dayOffsets = _loc2_.dayOffsets;
         _loc3_.averagePrices = _loc2_.averagePrices;
         _loc3_.soldAmounts = _loc2_.soldAmounts;
         _loc3_.furniCategoryId = _loc2_.furniCategoryId;
         _loc3_.furniTypeId = _loc2_.furniTypeId;
         var_1587.itemStats = _loc3_;
      }
      
      private function onMarketplaceConfiguration(param1:class_243) : void
      {
         if(!param1 || !var_1587)
         {
            return;
         }
         var _loc2_:class_1355 = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         var_1587.averagePricePeriod = _loc2_.averagePricePeriod;
      }
      
      private function onMarketplaceMakeOfferResult(param1:class_848) : void
      {
         if(!param1 || !var_1587)
         {
            return;
         }
         var _loc2_:class_1424 = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.result == 1)
         {
            var_1587.refreshOffers();
         }
      }
      
      private function onHabboClubOffers(param1:class_584) : void
      {
         var _loc2_:class_1384 = param1.getParser();
         if(var_2024 != null && (_loc2_.source == 0 || _loc2_.source == 1 || _loc2_.source == 2 || _loc2_.source == 6))
         {
            var_2024.onOffers(_loc2_);
         }
      }
      
      private function onHabboClubExtendOffer(param1:class_742) : void
      {
         if(!var_66)
         {
            init();
         }
         if(var_2238)
         {
            var_2238.onOffer(param1);
         }
      }
      
      private function onRoomExit(param1:IMessageEvent) : void
      {
      }
      
      private function onSellablePalettes(param1:class_248) : void
      {
         var _loc2_:class_1275 = param1.getParser();
         var_2381.remove(_loc2_.productCode);
         var _loc3_:Array = _loc2_.sellablePalettes;
         if(_loc3_ != null)
         {
            var_2381.add(_loc2_.productCode,_loc3_.slice());
            var_1487.dispatchWidgetEvent(new CatalogWidgetSellablePetPalettesEvent(_loc2_.productCode,_loc3_.slice()));
         }
      }
      
      private function setElementImage(param1:String, param2:BitmapData) : void
      {
         var _loc3_:class_3282 = var_1446.findChildByName(param1) as class_3282;
         if(_loc3_ != null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(0,0));
         }
         else
         {
            class_14.log("Could not find element: " + param1);
         }
      }
      
      private function alertDialogEventProcessor(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
         resetPlacedOfferData();
      }
      
      private function noCreditsConfirmDialogEventProcessor(param1:class_3216, param2:class_3134) : void
      {
         param1.dispose();
         resetPlacedOfferData();
         if(param2.type == "WE_OK")
         {
            HabboWebTools.openWebPageAndMinimizeClient(getProperty("web.shop.relativeUrl"));
         }
      }
      
      private function noDucketsConfirmDialogEventProcessor(param1:class_3216, param2:class_3134) : void
      {
         var _loc3_:String = null;
         param1.dispose();
         resetPlacedOfferData();
         if(param2.type == "WE_OK")
         {
            _loc3_ = getProperty("link.format.duckets");
            if(_loc3_ != "")
            {
               _windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,onExternalLink);
               HabboWebTools.navigateToURL(_loc3_,"habboMain");
            }
         }
      }
      
      private function onExternalLink(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
      
      public function redeemVoucher(param1:String) : void
      {
         var _loc2_:* = new class_411(param1);
         send(_loc2_);
         _loc2_.dispose();
         _loc2_ = null;
      }
      
      public function productDataReady() : void
      {
         var_3245 = true;
         events.dispatchEvent(new CatalogEvent("CATALOG_INITIALIZED"));
      }
      
      public function isDraggable(param1:com.sulake.habbo.catalog.class_3159) : Boolean
      {
         return getBoolean("catalog.drag_and_drop") && _roomSession != null && (true || var_1487.currentPage.allowDragging) && (var_497 == "NORMAL" && (false || false && false) || var_497 == "BUILDERS_CLUB" && getBuilderFurniPlaceableStatus(param1) == 0) && param1.pricingModel != "pricing_model_bundle" && param1.pricingModel != "pricing_model_multi" && param1.product != null && param1.product.productType != "e" && param1.product.productType != "h";
      }
      
      public function getBuilderFurniPlaceableStatus(param1:com.sulake.habbo.catalog.class_3159) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:IRoomObject = null;
         var _loc2_:class_3259 = null;
         if(param1 == null)
         {
            return 1;
         }
         if(builderFurniCount < 0 || builderFurniCount >= builderFurniLimit)
         {
            return 2;
         }
         if(roomSession == null)
         {
            return 3;
         }
         if(true)
         {
            return 4;
         }
         if(false && !getBoolean("builders.club.furniture.placement.group.room.enabled"))
         {
            return 5;
         }
         if(builderSecondsLeft <= 0)
         {
            _loc3_ = roomEngine.getRoomObjectCount(roomSession.roomId,100);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = roomEngine.getRoomObjectWithIndex(roomSession.roomId,_loc4_,100);
               _loc2_ = roomSession.userDataManager.getUserDataByIndex(_loc5_.getId());
               if(_loc2_ != null && _loc2_.type == 1 && _loc2_.roomObjectId != roomSession.ownUserRoomId && !_loc2_.isModerator)
               {
                  return 6;
               }
               _loc4_++;
            }
         }
         return 0;
      }
      
      private function updateRoom(param1:String, param2:String) : void
      {
         var _loc4_:String = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId,"room_wall_type");
         var _loc5_:String = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId,"room_floor_type");
         var _loc3_:String = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId,"room_landscape_type");
         _loc4_ = _loc4_ && _loc4_.length > 0 ? _loc4_ : "101";
         _loc5_ = _loc5_ && _loc5_.length > 0 ? _loc5_ : "101";
         _loc3_ = _loc3_ && _loc3_.length > 0 ? _loc3_ : "1.1";
         switch(param1)
         {
            case "floor":
               _roomEngine.updateObjectRoom(_roomEngine.activeRoomId,param2,_loc4_,_loc3_,true);
               break;
            case "wallpaper":
               _roomEngine.updateObjectRoom(_roomEngine.activeRoomId,_loc5_,param2,_loc3_,true);
               break;
            case "landscape":
               _roomEngine.updateObjectRoom(_roomEngine.activeRoomId,_loc5_,_loc4_,param2,true);
               break;
            default:
               _roomEngine.updateObjectRoom(_roomEngine.activeRoomId,_loc5_,_loc4_,_loc3_,true);
         }
      }
      
      public function requestSelectedItemToMover(param1:class_3232, param2:com.sulake.habbo.catalog.class_3159, param3:Boolean = false) : void
      {
         var _loc6_:int = 0;
         if(!isDraggable(param2))
         {
            return;
         }
         var _loc4_:class_3169;
         switch((_loc4_ = param2.product).productType)
         {
            case "s":
               _loc6_ = 10;
               break;
            case "i":
               _loc6_ = 20;
         }
         var _loc5_:Boolean;
         if(_loc5_ = _roomEngine.initializeRoomObjectInsert("catalog",-param2.offerId,_loc6_,_loc4_.productClassId,!!_loc4_.extraParam ? _loc4_.extraParam.toString() : null))
         {
            _offerInFurniPlacing = param2;
            _offerPlacingCallbackReceiver = param1;
            hideMainWindow();
            var_1818 = true;
            var_4176 = param3;
         }
      }
      
      private function onObjectSelected(param1:RoomEngineObjectEvent) : void
      {
         var _loc2_:class_3259 = null;
         if(param1 == null)
         {
            return;
         }
         if(buildersClubEnabled && (!var_66 || !getCatalogNavigator("BUILDERS_CLUB").initialized))
         {
            init();
            refreshCatalogIndex("BUILDERS_CLUB");
         }
         if(param1.type == "REOE_SELECTED" && param1.category == 100)
         {
            _loc2_ = getUserDataForEvent(param1);
            if(_loc2_ != null)
            {
               events.dispatchEvent(new CatalogUserEvent("CATALOG_USER_SELECTED",_loc2_.webID,_loc2_.name));
            }
         }
      }
      
      private function onFriendBarSelectionEvent(param1:FriendBarSelectionEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:String = null;
         var _loc4_:class_3232 = null;
         if(var_1818 && param1.type == "FBVE_FRIEND_SELECTED")
         {
            resetPlacedOfferData(true);
            if(_offerInFurniPlacing == null || false)
            {
               resetObjectMover();
               return;
            }
            _loc3_ = param1.friendId;
            _loc2_ = param1.friendName;
            if((_loc4_ = _offerPlacingCallbackReceiver) != null)
            {
               _loc4_.onDragAndDropDone(true,_loc2_);
            }
            resetObjectMover(false);
            cancelFurniInMover();
         }
      }
      
      private function getUserDataForEvent(param1:RoomEngineObjectEvent) : class_3259
      {
         var _loc3_:IRoomSession = null;
         var _loc2_:class_3259 = null;
         if(_roomSessionManager != null)
         {
            _loc3_ = _roomSessionManager.getSession(param1.roomId);
            if(_loc3_ != null)
            {
               _loc2_ = _loc3_.userDataManager.getUserDataByIndex(param1.objectId);
            }
         }
         return _loc2_;
      }
      
      private function onObjectPlaceOnUser(param1:RoomEngineObjectPlacedOnUserEvent) : void
      {
         var _loc4_:String = null;
         var _loc2_:class_3259 = null;
         var _loc3_:class_3232 = null;
         if(var_1818 && param1.type == "REOE_PLACED_ON_USER")
         {
            resetPlacedOfferData(true);
            if(_offerInFurniPlacing == null || false)
            {
               resetObjectMover();
               return;
            }
            _loc4_ = null;
            _loc2_ = getUserDataForEvent(param1);
            if(_loc2_ != null)
            {
               _loc4_ = _loc2_.name;
            }
            _loc3_ = _offerPlacingCallbackReceiver;
            if(_loc3_ != null)
            {
               _loc3_.onDragAndDropDone(true,_loc4_);
            }
            resetObjectMover(false);
            cancelFurniInMover();
         }
      }
      
      private function onObjectPlacedInRoom(param1:RoomEngineObjectPlacedEvent) : void
      {
         var _loc7_:int = 0;
         var _loc2_:class_3169 = null;
         var _loc5_:Boolean = false;
         var _loc6_:class_3232 = null;
         var _loc4_:IRoomObjectController = null;
         var _loc8_:int = 0;
         var _loc3_:* = undefined;
         if(var_1818 && param1.type == "REOE_PLACED")
         {
            resetPlacedOfferData(true);
            if(_offerInFurniPlacing == null || false)
            {
               resetObjectMover();
               return;
            }
            _loc7_ = param1.category;
            _loc2_ = _offerInFurniPlacing.product;
            _loc5_ = false;
            if(_loc7_ == 20)
            {
               switch(_loc2_.furnitureData.className)
               {
                  case "floor":
                  case "wallpaper":
                  case "landscape":
                     _loc5_ = param1.placedOnFloor || param1.placedOnWall;
                     break;
                  default:
                     _loc5_ = param1.placedInRoom;
               }
            }
            else
            {
               _loc5_ = param1.placedInRoom;
            }
            if(!_loc5_)
            {
               resetObjectMover();
               return;
            }
            var_1513 = new PlacedObjectPurchaseData(param1.roomId,param1.objectId,param1.category,param1.wallLocation,param1.x,param1.y,param1.direction,_offerInFurniPlacing);
            if((_loc6_ = _offerPlacingCallbackReceiver) != null)
            {
               _loc6_.onDragAndDropDone(true,null);
            }
            switch(var_497)
            {
               case "NORMAL":
                  if(_loc7_ == 10)
                  {
                     _roomEngine.addObjectFurniture(param1.roomId,param1.objectId,_loc2_.productClassId,new Vector3d(param1.x,param1.y,param1.z),new Vector3d(param1.direction,0,0),0,new class_1610());
                  }
                  else if(_loc7_ == 20)
                  {
                     switch(_loc2_.furnitureData.className)
                     {
                        case "floor":
                        case "wallpaper":
                        case "landscape":
                           updateRoom(_loc2_.furnitureData.className,_loc2_.extraParam);
                           break;
                        default:
                           _roomEngine.addObjectWallItem(param1.roomId,param1.objectId,_loc2_.productClassId,new Vector3d(param1.x,param1.y,param1.z),new Vector3d(param1.direction * 45,0,0),0,param1.instanceData,0);
                     }
                  }
                  if(_loc4_ = _roomEngine.getRoomObject(param1.roomId,param1.objectId,param1.category) as IRoomObjectController)
                  {
                     _loc4_.getModelController().setNumber("furniture_alpha_multiplier",0.5);
                     break;
                  }
                  break;
               case "BUILDERS_CLUB":
                  if((_loc8_ = _offerInFurniPlacing.page.pageId) == -12345678)
                  {
                     _loc3_ = currentCatalogNavigator.getNodesByOfferId(_offerInFurniPlacing.offerId,true);
                     if(_loc3_ != null)
                     {
                        _loc8_ = _loc3_[0].pageId;
                     }
                  }
                  switch(_loc7_ - 10)
                  {
                     case 0:
                        send(new class_264(_loc8_,_offerInFurniPlacing.offerId,_loc2_.extraParam,param1.x,param1.y,param1.direction));
                        break;
                     case 10:
                        send(new class_806(_loc8_,_offerInFurniPlacing.offerId,_loc2_.extraParam,param1.wallLocation));
                  }
                  if(var_4176)
                  {
                     requestSelectedItemToMover(_loc6_,_offerInFurniPlacing,true);
                     break;
                  }
                  toggleBuilderCatalog();
                  break;
            }
         }
      }
      
      private function resetObjectMover(param1:Boolean = true) : void
      {
         if(param1 && var_1818)
         {
            showMainWindow();
         }
         var_1818 = false;
         _offerPlacingCallbackReceiver = null;
      }
      
      public function syncPlacedOfferWithPurchase(param1:com.sulake.habbo.catalog.class_3159) : void
      {
         if(var_1513)
         {
            if(var_1513.offerId != param1.offerId)
            {
               resetPlacedOfferData();
            }
         }
      }
      
      public function resetPlacedOfferData(param1:Boolean = false) : void
      {
         if(!param1)
         {
            resetObjectMover();
         }
         if(var_1513 != null)
         {
            if(false)
            {
               _roomEngine.disposeObjectFurniture(var_1513.roomId,var_1513.objectId);
            }
            else if(false)
            {
               switch(var_1513.furniData.className)
               {
                  case "floor":
                  case "wallpaper":
                  case "landscape":
                     updateRoom("reset","");
                     break;
                  default:
                     _roomEngine.disposeObjectWallItem(var_1513.roomId,var_1513.objectId);
               }
            }
            else
            {
               _roomEngine.deleteRoomObject(var_1513.objectId,var_1513.category);
            }
            var_1513.dispose();
            var_1513 = null;
         }
      }
      
      public function cancelFurniInMover() : void
      {
         if(_offerInFurniPlacing != null)
         {
            _roomEngine.cancelRoomObjectInsert();
            var_1818 = false;
            _offerInFurniPlacing = null;
         }
      }
      
      private function onItemAddedToInventory(param1:HabboInventoryItemAddedEvent) : void
      {
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:String = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc7_:String = null;
         var _loc2_:String = null;
         if(var_1513 != null && var_1513.productClassId == param1.classId)
         {
            if(true)
            {
               _loc6_ = param1.stripId;
               _loc8_ = 0;
               _loc4_ = "null";
               _loc3_ = 0;
               _loc5_ = 0;
               _loc9_ = 0;
               switch(param1.category - 2)
               {
                  case 0:
                     _loc7_ = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId,"room_wall_type");
                     if(var_1513.extraParameter != _loc7_)
                     {
                        send(new class_925(_loc6_));
                        break;
                     }
                     break;
                  case 1:
                     _loc10_ = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId,"room_floor_type");
                     if(var_1513.extraParameter != _loc10_)
                     {
                        send(new class_925(_loc6_));
                        break;
                     }
                     break;
                  case 2:
                     _loc2_ = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId,"room_landscape_type");
                     if(var_1513.extraParameter != _loc2_)
                     {
                        send(new class_925(_loc6_));
                        break;
                     }
                     break;
                  default:
                     send(new class_627(_loc6_,_loc8_,_loc4_,_loc3_,_loc5_,_loc9_));
               }
               resetPlacedOfferData();
            }
         }
      }
      
      public function setImageFromAsset(param1:class_3127, param2:String, param3:Function) : void
      {
         if(!param2 || !assets)
         {
            return;
         }
         var _loc4_:BitmapDataAsset;
         if((_loc4_ = assets.getAssetByName(param2) as BitmapDataAsset) == null)
         {
            retrievePreviewAsset(param2,param3);
            return;
         }
         if(param1)
         {
            HabboCatalog.setElementImageCentered(param1,_loc4_.content as BitmapData);
         }
      }
      
      public function get imageGalleryHost() : String
      {
         return getProperty("image.library.catalogue.url");
      }
      
      private function retrievePreviewAsset(param1:String, param2:Function) : void
      {
         if(!param1 || !assets)
         {
            return;
         }
         var _loc5_:String = imageGalleryHost + param1 + ".png";
         var _loc3_:URLRequest = new URLRequest(_loc5_);
         var _loc4_:AssetLoaderStruct;
         if(!(_loc4_ = assets.loadAssetFromFile(param1,_loc3_,"image/png")))
         {
            return;
         }
         if(param2 != null)
         {
            _loc4_.addEventListener("AssetLoaderEventComplete",param2);
         }
      }
      
      private function showMainWindow() : void
      {
         var _loc1_:class_3234 = null;
         if(_windowManager != null && var_1446 != null && true)
         {
            _loc1_ = _windowManager.getDesktop(1);
            if(_loc1_ != null)
            {
               _loc1_.addChild(var_1446);
            }
         }
      }
      
      private function hideMainWindow() : void
      {
         var _loc1_:class_3234 = null;
         if(_windowManager != null && var_1446 != null && false)
         {
            _loc1_ = _windowManager.getDesktop(1);
            if(_loc1_ != null && !var_2849)
            {
               _loc1_.removeChild(var_1446);
               if(var_1487 != null)
               {
                  var_1487.catalogWindowClosed();
               }
            }
            var_2849 = false;
         }
      }
      
      private function mainWindowVisible() : Boolean
      {
         return _windowManager != null && var_1446 != null && false;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         if(var_1594 != null)
         {
            var_1594.updatePreviewRoomView();
         }
         if(getTimer() - _builderMembershipDisplayUpdateTime > 500)
         {
            _loc3_ = builderSecondsLeft;
            _loc2_ = builderSecondsLeftWithGrace;
            if(_loc3_ > -3 && _loc3_ < 200 || _loc2_ > -3 && _loc2_ < 200)
            {
               refreshBuilderStatus();
            }
         }
      }
      
      public function onGuildMemberships(param1:class_564) : void
      {
         if(var_1920)
         {
            var_1920.onGuildMembershipsMessageEvent(param1);
         }
      }
      
      private function onSnowWarGameTokenOffer(param1:SnowWarGameTokensMessageEvent) : void
      {
         var _loc3_:SnowWarGameTokensMessageParser = param1.getParser();
         disposeSnowWarTokens();
         for each(var _loc2_ in _loc3_.offers)
         {
            if(_loc2_.localizationId == "GET_SNOWWAR_TOKENS")
            {
               var_2104 = new GameTokensOffer(_loc2_.offerId,_loc2_.localizationId,_loc2_.priceInCredits,_loc2_.priceInActivityPoints,_loc2_.activityPointType);
            }
            else if(_loc2_.localizationId == "GET_SNOWWAR_TOKENS2")
            {
               var_2078 = new GameTokensOffer(_loc2_.offerId,_loc2_.localizationId,_loc2_.priceInCredits,_loc2_.priceInActivityPoints,_loc2_.activityPointType);
            }
            else if(_loc2_.localizationId == "GET_SNOWWAR_TOKENS3")
            {
               var_2012 = new GameTokensOffer(_loc2_.offerId,_loc2_.localizationId,_loc2_.priceInCredits,_loc2_.priceInActivityPoints,_loc2_.activityPointType);
            }
         }
      }
      
      public function buySnowWarTokensOffer(param1:String) : void
      {
         if(param1 == "GET_SNOWWAR_TOKENS" && var_2104)
         {
            showPurchaseConfirmation(var_2104,-1,var_2104.localizationId);
         }
         else if(param1 == "GET_SNOWWAR_TOKENS2" && var_2078)
         {
            showPurchaseConfirmation(var_2078,-1,var_2078.localizationId);
         }
         else if(param1 == "GET_SNOWWAR_TOKENS3" && var_2012)
         {
            showPurchaseConfirmation(var_2012,-1,var_2012.localizationId);
         }
         else
         {
            _communication.connection.send(new GetSnowWarGameTokensOfferComposer());
         }
      }
      
      public function verifyClubLevel(param1:int = 1) : Boolean
      {
         if(_sessionDataManager.clubLevel >= param1)
         {
            return true;
         }
         openClubCenter();
         return false;
      }
      
      public function openClubCenter() : void
      {
         context.createLinkEvent("habboUI/open/hccenter");
      }
      
      public function openVault() : void
      {
         context.createLinkEvent("habboUI/open/vault");
      }
      
      private function onGuildVisualSettingsChanged(param1:GuildSettingsChangedInManageEvent) : void
      {
         if(var_1920)
         {
            var_1920.onGuildVisualSettingsChanged(param1.guildId);
         }
      }
      
      public function get avatarEditor() : class_1753
      {
         return _avatarEditor;
      }
      
      public function checkGiftable(param1:com.sulake.habbo.catalog.class_3159) : void
      {
         send(new class_488(param1.offerId));
      }
      
      public function rememberPageDuringVipPurchase(param1:int) : void
      {
         var _loc2_:class_3188 = currentCatalogNavigator.getNodeById(param1);
         if(_loc2_)
         {
            var_2071 = _loc2_.pageName;
         }
         else
         {
            var_2071 = "frontpage";
         }
      }
      
      public function forgetPageDuringVipPurchase() : void
      {
         var_2071 = null;
         var_2849 = false;
      }
      
      public function doNotCloseAfterVipPurchase() : void
      {
         var_2849 = var_2071 != null;
      }
      
      private function initBundleDiscounts() : void
      {
         sendGetBundleDiscountRuleset();
      }
      
      private function sendGetBundleDiscountRuleset() : void
      {
         send(new class_495());
      }
      
      public function sendGetProductOffer(param1:int) : void
      {
         send(new class_832(param1));
      }
      
      private function onBundleDiscountRulesetMessageEvent(param1:class_752) : void
      {
         var _loc2_:class_1147 = param1.getParser();
         _bundleDiscountRuleset = _loc2_.bundleDiscountRuleset;
         _utils.resolveBundleDiscountFlatPriceSteps();
      }
      
      private function onLimitedEditionSoldOut(param1:class_277) : void
      {
         _windowManager.alert("${catalog.alert.limited_edition_sold_out.title}","${catalog.alert.limited_edition_sold_out.message}",0,alertDialogEventProcessor);
         if(var_1511 != null)
         {
            var_1511.dispose();
            var_1511 = null;
         }
      }
      
      private function onProductOffer(param1:class_768) : void
      {
         var _loc6_:class_3148 = null;
         var _loc3_:class_1055 = param1.getParser();
         var _loc4_:class_1409;
         if(!(_loc4_ = _loc3_.offerData) || _loc4_.products.length == 0)
         {
            return;
         }
         var _loc5_:class_1608;
         if((_loc5_ = _loc4_.products[0]).uniqueLimitedItem)
         {
            var_1487.currentPage.updateLimitedItemsLeft(_loc4_.offerId,_loc5_.uniqueLimitedItemsLeft);
         }
         var _loc7_:Vector.<class_3169> = new Vector.<class_3169>(0);
         var _loc8_:class_3200 = getProductData(_loc4_.localizationId);
         for each(_loc5_ in _loc4_.products)
         {
            _loc6_ = getFurnitureData(_loc5_.furniClassId,_loc5_.productType);
            _loc7_.push(new Product(_loc5_.productType,_loc5_.furniClassId,_loc5_.extraParam,_loc5_.productCount,_loc8_,_loc6_,this,_loc5_.uniqueLimitedItem,_loc5_.uniqueLimitedItemSeriesSize,_loc5_.uniqueLimitedItemsLeft));
         }
         var _loc2_:Offer = new Offer(_loc4_.offerId,_loc4_.localizationId,_loc4_.isRent,_loc4_.priceInCredits,_loc4_.priceInActivityPoints,_loc4_.activityPointType,_loc4_.giftable,_loc4_.clubLevel,_loc7_,_loc4_.bundlePurchaseAllowed,this);
         if(!isOfferCompatibleWithCurrentMode(_loc2_))
         {
            _loc2_.dispose();
            return;
         }
         if(var_1487 && false)
         {
            _loc2_.page = var_1487.currentPage;
            var_1487.currentPage.dispatchWidgetEvent(new SelectProductEvent(_loc2_));
            if(_loc2_.product && _loc2_.product.productType == "i")
            {
               var_1487.currentPage.dispatchWidgetEvent(new SetExtraPurchaseParameterEvent(_loc2_.product.extraParam));
            }
            if(var_1818 && _offerInFurniPlacing)
            {
               _offerInFurniPlacing = _loc2_;
            }
         }
      }
      
      private function onBuildersClubSubscriptionStatus(param1:class_166) : void
      {
         var _loc2_:class_1466 = param1.getParser();
         var_3593 = _loc2_.furniLimit;
         var_3768 = _loc2_.maxFurniLimit;
         var_3272 = _loc2_.secondsLeft;
         _builderMembershipUpdateTime = getTimer();
         var_3619 = _loc2_.secondsLeftWithGrace;
         if(false)
         {
            ExternalInterface.call("FlashExternalInterface.updateBuildersClub",var_3272 > 0);
         }
         if(currentPage != null)
         {
            currentPage.dispatchWidgetEvent(new CatalogWidgetBuilderSubscriptionUpdatedEvent());
         }
         refreshBuilderStatus();
      }
      
      private function onBuildersClubFurniCount(param1:class_148) : void
      {
         var_3662 = param1.getParser().furniCount;
         if(currentPage != null)
         {
            currentPage.dispatchWidgetEvent(new CatalogWidgetBuilderSubscriptionUpdatedEvent());
         }
         refreshBuilderStatus();
      }
      
      private function refreshBuilderStatus() : void
      {
         var _loc4_:Number = var_3272 - (getTimer() - _builderMembershipUpdateTime) / 1000;
         var _loc2_:Number = var_3619 - (getTimer() - _builderMembershipUpdateTime) / 1000;
         if(var_3368 && _loc4_ <= 0 && _loc2_ > 0)
         {
            events.dispatchEvent(new CatalogEvent("CATALOG_BUILDER_MEMBERSHIP_IN_GRACE"));
         }
         else if(var_3310 && _loc2_ <= 0)
         {
            events.dispatchEvent(new CatalogEvent("CATALOG_BUILDER_MEMBERSHIP_EXPIRED"));
         }
         var_3368 = _loc4_ > 0;
         var_3310 = _loc2_ > 0;
         var _loc3_:String = "builder.header.status." + (var_3368 ? "member" : (var_3310 ? "grace" : "trial"));
         var _loc5_:String = String(_localization.getLocalization(_loc3_));
         _localization.registerParameter("builder.header.title","bcstatus",_loc5_);
         var _loc1_:String = var_3368 ? FriendlyTime.getFriendlyTime(_localization,_loc4_) : (var_3310 ? FriendlyTime.getFriendlyTime(_localization,_loc2_) : _loc5_);
         _localization.registerParameter("builder.header.status.membership","duration","<font color=\"#ff8d00\"><b>" + _loc1_ + "</b></font>");
         _localization.registerParameter("builder.header.status.limit","count","<font color=\"#ff8d00\"><b>" + var_3662 + "</b></font>");
         _localization.registerParameter("builder.header.status.limit","limit","<font color=\"#ff8d00\"><b>" + var_3593 + "</b></font>");
         _builderMembershipDisplayUpdateTime = getTimer();
      }
      
      public function get bundleDiscountEnabled() : Boolean
      {
         return var_497 != "BUILDERS_CLUB";
      }
      
      public function get bundleDiscountRuleset() : class_1535
      {
         return _bundleDiscountRuleset;
      }
      
      public function get multiplePurchaseEnabled() : Boolean
      {
         return getBoolean("catalog.multiple.purchase.enabled") && var_497 != "BUILDERS_CLUB";
      }
      
      public function get newAdditionsPageOpenDisabled() : Boolean
      {
         return getBoolean("catalog.new.additions.page.open.disabled");
      }
      
      public function showVipBenefits() : void
      {
         if(!_utils)
         {
            init();
         }
         if(_utils)
         {
            if(!getCatalogNavigator("NORMAL").initialized)
            {
               refreshCatalogIndex("NORMAL");
            }
            _utils.showVipBenefits();
         }
      }
      
      public function get currentPage() : class_3229
      {
         return var_1487 == null ? null : var_1487.currentPage;
      }
      
      public function displayProductIcon(param1:String, param2:int, param3:class_3282) : void
      {
         _utils.displayProductIcon(param1,param2,param3);
      }
      
      public function openRentConfirmationWindow(param1:class_3148, param2:Boolean, param3:int = -1, param4:int = -1, param5:Boolean = false) : void
      {
         if(var_2526 == null)
         {
            var_2526 = new RentConfirmationWindow(this);
         }
         var_2526.show(param1,param2,param3,param4,param5);
      }
      
      public function get roomSession() : IRoomSession
      {
         return _roomSession;
      }
      
      public function get linkPattern() : String
      {
         return "catalog/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         switch(_loc2_[1])
         {
            case "open":
               if(_loc2_.length > 2)
               {
                  openCatalogPage(_loc2_[2]);
                  break;
               }
               openCatalog();
               break;
            case "warehouse":
               if(_loc2_.length > 2)
               {
                  openCatalogPage(_loc2_[2],"BUILDERS_CLUB");
                  break;
               }
               toggleCatalog("BUILDERS_CLUB",true);
               break;
            case "club_buy":
               openClubCenter();
               break;
            default:
               class_14.log("Catalog unknown link-type receive: " + _loc2_[1]);
         }
      }
      
      public function get inventory() : class_1697
      {
         return _inventory;
      }
      
      public function get mainContainer() : class_3151
      {
         return var_1446;
      }
      
      public function toggleBuilderCatalog() : void
      {
         toggleCatalog("BUILDERS_CLUB");
      }
      
      public function get catalogType() : String
      {
         return var_497;
      }
      
      public function getCatalogNavigator(param1:String) : class_3125
      {
         return _catalogNavigators != null ? _catalogNavigators[param1] : null;
      }
      
      public function get currentCatalogNavigator() : class_3125
      {
         return getCatalogNavigator(var_497);
      }
      
      public function get builderFurniLimit() : int
      {
         return var_3593;
      }
      
      public function get builderFurniCount() : int
      {
         return var_3662;
      }
      
      public function get builderMaxFurniLimit() : int
      {
         return var_3768;
      }
      
      public function get builderSecondsLeft() : Number
      {
         return var_3272 - (getTimer() - _builderMembershipUpdateTime) / 1000;
      }
      
      public function get builderSecondsLeftWithGrace() : Number
      {
         return var_3619 - (getTimer() - _builderMembershipUpdateTime) / 1000;
      }
      
      public function get isDoorModeOverriddenInCurrentRoom() : Boolean
      {
         var _loc3_:int = 0;
         var _loc1_:IRoomObject = null;
         var _loc2_:IRoomObject = null;
         if(!buildersClubEnabled || builderSecondsLeft > 0)
         {
            return false;
         }
         var _loc4_:int = roomEngine.getRoomObjectCount(roomSession.roomId,10);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc1_ = roomEngine.getRoomObjectWithIndex(roomSession.roomId,_loc3_,10);
            if(class_3288.isBuilderClubId(_loc1_.getId()))
            {
               return true;
            }
            _loc3_++;
         }
         var _loc5_:int = roomEngine.getRoomObjectCount(roomSession.roomId,20);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc2_ = roomEngine.getRoomObjectWithIndex(roomSession.roomId,_loc3_,20);
            if(class_3288.isBuilderClubId(_loc2_.getId()))
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function getOfferCenter(param1:IOfferExtension) : IOfferCenter
      {
         if(_offerCenter == null)
         {
            _offerCenter = new OfferCenter(windowManager,assets,this);
         }
         _offerCenter.offerExtension = param1;
         return _offerCenter;
      }
      
      public function isNewIdentity() : Boolean
      {
         return getInteger("new.identity",0) > 0;
      }
      
      public function useNonTabbedCatalog() : Boolean
      {
         return getBoolean("client.desktop.use.non.tabbed.catalog");
      }
   }
}
