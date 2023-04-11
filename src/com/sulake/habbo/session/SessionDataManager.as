package com.sulake.habbo.session
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.session.events.MysteryBoxKeysUpdateEvent;
   import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
   import com.sulake.habbo.session.events.UserNameUpdateEvent;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.class_1696;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.session.product.class_1695;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.iid.*;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import package_10.class_847;
   import package_107.class_589;
   import package_111.class_661;
   import package_130.class_1059;
   import package_130.class_1215;
   import package_130.class_1485;
   import package_133.class_1188;
   import package_150.class_1134;
   import package_151.class_1092;
   import package_161.class_1479;
   import package_168.class_1380;
   import package_17.class_327;
   import package_174.class_1327;
   import package_19.class_416;
   import package_40.class_182;
   import package_40.class_714;
   import package_40.class_721;
   import package_40.class_923;
   import package_41.class_290;
   import package_42.class_186;
   import package_44.class_195;
   import package_44.class_331;
   import package_5.class_206;
   import package_5.class_212;
   import package_5.class_522;
   import package_5.class_892;
   import package_53.class_214;
   import package_6.class_123;
   import package_6.class_142;
   import package_6.class_530;
   import package_7.class_628;
   import package_76.class_804;
   import package_8.class_746;
   
   public class SessionDataManager extends class_20 implements ISessionDataManager
   {
      
      public static const const_438:uint = 1;
       
      
      private var _communication:class_25;
      
      private var _windowManager:class_1684;
      
      private var _roomSessionManager:com.sulake.habbo.session.IRoomSessionManager;
      
      private var var_2224:com.sulake.habbo.session.PerkManager;
      
      private var var_247:int;
      
      private var _name:String;
      
      private var var_427:String;
      
      private var var_122:String;
      
      private var _realName:String;
      
      private var var_702:int = 0;
      
      private var var_1337:int = 0;
      
      private var var_1357:int = 0;
      
      private var var_1350:Boolean = true;
      
      private var var_4305:Array;
      
      private var _systemOpen:Boolean;
      
      private var var_4121:Boolean;
      
      private var _isAuthenticHabbo:Boolean;
      
      private var var_235:Dictionary;
      
      private var var_1779:ProductDataParser;
      
      private var _floorItems:class_24;
      
      private var _wallItems:class_24;
      
      private var var_1863:class_24;
      
      private var var_1703:FurnitureDataParser;
      
      private var var_1871:com.sulake.habbo.session.BadgeImageManager;
      
      private var var_4080:com.sulake.habbo.session.HabboGroupInfoManager;
      
      private var var_2981:com.sulake.habbo.session.IgnoredUsersManager;
      
      private var _localization:class_18;
      
      private var var_3245:Boolean = false;
      
      private var _productDataListeners:Array;
      
      private var _furniDataListeners:Array;
      
      private var var_689:int;
      
      private var var_753:int;
      
      private var var_3487:int = 0;
      
      private var var_875:int = -1;
      
      private var _isAmbassador:Boolean;
      
      private var var_3988:Boolean;
      
      private var var_3332:Boolean;
      
      private var var_463:int;
      
      private var var_1342:Boolean = false;
      
      private var _mysteryBoxColor:String;
      
      private var _mysteryKeyColor:String;
      
      private var var_4248:Boolean = false;
      
      private var var_2950:Boolean = false;
      
      private var var_2410:Timer = null;
      
      private var _newFurniDataHash:String = null;
      
      public function SessionDataManager(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         },false),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         },(flags & 1) == 0),new ComponentDependency(new IIDHabboConfigurationManager(),null,true,[{
            "type":"complete",
            "callback":onConfigurationComplete
         }]),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDHabboRoomSessionManager(),function(param1:com.sulake.habbo.session.IRoomSessionManager):void
         {
            _roomSessionManager = param1;
         },false)]);
      }
      
      private function onConfigurationComplete(param1:Event) : void
      {
         var_235 = new Dictionary();
         _floorItems = new class_24();
         _wallItems = new class_24();
         var_1863 = new class_24();
         initFurnitureData();
         initProductData();
         initBadgeImageManager();
      }
      
      override protected function initComponent() : void
      {
         if(_communication)
         {
            _communication.addHabboConnectionMessageEvent(new class_195(onFigureUpdate));
            _communication.addHabboConnectionMessageEvent(new class_206(onUserNameChange));
            _communication.addHabboConnectionMessageEvent(new class_186(onAvailabilityStatus));
            _communication.addHabboConnectionMessageEvent(new class_847(onRoomReady) as IMessageEvent);
            _communication.addHabboConnectionMessageEvent(new class_522(onEmailStatus));
            _communication.addHabboConnectionMessageEvent(new class_327(onUserChange));
            _communication.addHabboConnectionMessageEvent(new class_331(onChangeUserNameResult));
            _communication.addHabboConnectionMessageEvent(new class_530(onUserObject));
            _communication.addHabboConnectionMessageEvent(new class_746(onCatalogPublished));
            _communication.addHabboConnectionMessageEvent(new class_589(onMysteryBoxKeys));
            _communication.addHabboConnectionMessageEvent(new class_212(onAccountSafetyLockStatusChanged));
            _communication.addHabboConnectionMessageEvent(new class_214(onAccountPreferences));
            _communication.addHabboConnectionMessageEvent(new class_290(onPetRespectFailed));
            _communication.addHabboConnectionMessageEvent(new class_892(onInClientLink));
            _communication.addHabboConnectionMessageEvent(new class_142(onUserRights));
            _communication.addHabboConnectionMessageEvent(new class_123(onNoobnessLevelEvent));
         }
         var_4305 = [];
         var_4080 = new com.sulake.habbo.session.HabboGroupInfoManager(this);
         var_2981 = new com.sulake.habbo.session.IgnoredUsersManager(this);
         var_2224 = new com.sulake.habbo.session.PerkManager(this);
         _productDataListeners = [];
         _furniDataListeners = [];
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(_floorItems)
         {
            _floorItems.dispose();
            _floorItems = null;
         }
         if(var_1863)
         {
            var_1863.dispose();
            var_1863 = null;
         }
         if(var_2224)
         {
            var_2224.dispose();
            var_2224 = null;
         }
         _furniDataListeners = null;
         if(var_1703)
         {
            var_1703.removeEventListener("FDP_furniture_data_ready",onFurnitureReady);
            var_1703.dispose();
            var_1703 = null;
         }
         if(var_1779)
         {
            var_1779.removeEventListener("PDP_product_data_ready",onProductsReady);
            var_1779.dispose();
            var_1779 = null;
         }
         super.dispose();
      }
      
      private function initBadgeImageManager() : void
      {
         if(var_1871 != null)
         {
            return;
         }
         var_1871 = new com.sulake.habbo.session.BadgeImageManager(assets,events,this);
      }
      
      private function initFurnitureData() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc1_:String = null;
         if(var_1703)
         {
            var_1703.dispose();
            var_1703 = null;
         }
         var_1703 = new FurnitureDataParser(_floorItems,_wallItems,var_1863,_localization);
         var_1703.addEventListener("FDP_furniture_data_ready",onFurnitureReady);
         if(propertyExists("furnidata.load.url"))
         {
            _loc2_ = getProperty("furnidata.load.url");
            if(_newFurniDataHash != null)
            {
               _loc3_ = _loc2_.lastIndexOf("/");
               _loc1_ = _loc2_.substring(0,_loc3_);
               var_1703.loadData(_loc1_ + "/" + _newFurniDataHash);
            }
            else if(!_localization || !_localization.getGameDataResources())
            {
               var_1703.loadData(_loc2_);
            }
            else
            {
               var_1703.loadData(_loc2_,_localization.getGameDataResources().getFurniDataHash(),_localization.getActiveEnvironmentId());
            }
         }
      }
      
      private function initProductData() : void
      {
         if(var_1779)
         {
            var_1779.dispose();
            var_1779 = null;
         }
         var _loc1_:String = getProperty("productdata.load.url");
         if(!_localization || !_localization.getGameDataResources())
         {
            var_1779 = new ProductDataParser(_loc1_,var_235);
         }
         else
         {
            var_1779 = new ProductDataParser(_loc1_,var_235,_localization.getGameDataResources().getProductDataHash(),_localization.getActiveEnvironmentId());
         }
         var_1779.addEventListener("PDP_product_data_ready",onProductsReady);
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var_1703.removeEventListener("FDP_furniture_data_ready",onFurnitureReady);
         var_4248 = true;
         if(isAuthenticHabbo && !var_2950)
         {
            var_2950 = true;
            for each(var _loc2_ in _furniDataListeners)
            {
               _loc2_.furniDataReady();
            }
         }
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:class_142 = class_142(param1);
         var_689 = _loc2_.clubLevel != 0 ? 2 : 0;
         var_753 = _loc2_.securityLevel;
         var_3487 = Math.max(var_3487,_loc2_.securityLevel);
         _isAmbassador = _loc2_.isAmbassador;
      }
      
      private function onNoobnessLevelEvent(param1:class_123) : void
      {
         var_875 = param1.noobnessLevel;
         if(var_875 != 0)
         {
            context.configuration.setProperty("new.identity","1");
         }
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc4_:String = null;
         var _loc2_:class_530 = param1 as class_530;
         var _loc3_:class_1188 = _loc2_.getParser();
         var_247 = _loc3_.id;
         _name = _loc3_.name;
         var_702 = _loc3_.respectTotal;
         var_1337 = _loc3_.respectLeft;
         var_1357 = _loc3_.petRespectLeft;
         var_427 = _loc3_.figure;
         var_122 = _loc3_.sex;
         _realName = _loc3_.realName;
         var_1350 = _loc3_.nameChangeAllowed;
         var_1342 = _loc3_.accountSafetyLocked;
         try
         {
            if(false && propertyExists("environment.id"))
            {
               _loc4_ = (_loc4_ = (_loc4_ = getProperty("environment.id")).replace("pt","br")).replace("en","com");
               context.displayObjectContainer.stage.nativeWindow.title = "Habbo " + _loc4_.toUpperCase() + " | " + _name;
            }
         }
         catch(e:Error)
         {
         }
         var_2981.initIgnoreList();
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:class_327 = param1 as class_327;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            var_427 = _loc2_.figure;
            var_122 = _loc2_.sex;
         }
      }
      
      private function onFigureUpdate(param1:IMessageEvent) : void
      {
         var _loc2_:class_195 = param1 as class_195;
         if(_loc2_ == null)
         {
            return;
         }
         var_427 = _loc2_.figure;
         var_122 = _loc2_.gender;
         HabboWebTools.updateFigure(var_427);
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:class_206 = param1 as class_206;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:class_1215 = _loc2_.getParser();
         if(_loc3_.webId == var_247)
         {
            _name = _loc3_.newName;
            var_1350 = false;
            events.dispatchEvent(new UserNameUpdateEvent(_name));
         }
      }
      
      private function onChangeUserNameResult(param1:class_331) : void
      {
         var _loc2_:class_1092 = param1.getParser();
         if(_loc2_.resultCode == class_331.var_1402)
         {
            var_1350 = false;
            events.dispatchEvent(new UserNameUpdateEvent(_loc2_.name));
         }
      }
      
      private function onMysteryBoxKeys(param1:class_589) : void
      {
         var _loc2_:class_1380 = param1.getParser();
         _mysteryBoxColor = _loc2_.boxColor;
         _mysteryKeyColor = _loc2_.keyColor;
         events.dispatchEvent(new MysteryBoxKeysUpdateEvent(_mysteryBoxColor,_mysteryKeyColor));
      }
      
      private function onInClientLink(param1:class_892) : void
      {
         context.createLinkEvent(param1.link);
      }
      
      private function onAccountPreferences(param1:class_214) : void
      {
         var _loc2_:class_1327 = param1.getParser() as class_1327;
         var_3332 = _loc2_.roomCameraFollowDisabled;
         var_463 = _loc2_.uiFlags;
         events.dispatchEvent(new SessionDataPreferencesEvent(var_463));
      }
      
      private function onEmailStatus(param1:class_522) : void
      {
         var _loc2_:class_1059 = param1.getParser() as class_1059;
         var_3988 = _loc2_.isVerified;
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:class_1479 = (param1 as class_186).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         _systemOpen = _loc2_.isOpen;
         var_4121 = _loc2_.onShutDown;
         _isAuthenticHabbo = _loc2_.isAuthenticHabbo;
         if(isAuthenticHabbo && var_4248 && !var_2950)
         {
            var_2950 = true;
            for each(var _loc3_ in _furniDataListeners)
            {
               _loc3_.furniDataReady();
            }
         }
      }
      
      private function onPetRespectFailed(param1:class_290) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1357++;
      }
      
      private function onAccountSafetyLockStatusChanged(param1:class_212) : void
      {
         var _loc2_:class_1485 = param1.getParser();
         var_1342 = _loc2_.status == 0;
      }
      
      public function get systemOpen() : Boolean
      {
         return _systemOpen;
      }
      
      public function get systemShutDown() : Boolean
      {
         return var_4121;
      }
      
      public function get isAuthenticHabbo() : Boolean
      {
         return _isAuthenticHabbo;
      }
      
      public function hasSecurity(param1:int) : Boolean
      {
         return var_753 >= param1;
      }
      
      public function get topSecurityLevel() : int
      {
         return var_3487;
      }
      
      public function get clubLevel() : int
      {
         return var_689;
      }
      
      public function get hasVip() : Boolean
      {
         return HabboClubLevelEnum.HasVip(var_689);
      }
      
      public function get hasClub() : Boolean
      {
         return HabboClubLevelEnum.HasClub(var_689);
      }
      
      public function get isNoob() : Boolean
      {
         return var_875 != 0;
      }
      
      public function get isRealNoob() : Boolean
      {
         return var_875 == 2;
      }
      
      public function get userId() : int
      {
         return var_247;
      }
      
      public function get userName() : String
      {
         return _name;
      }
      
      public function get realName() : String
      {
         return _realName;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return var_753 >= 5;
      }
      
      public function get isAmbassador() : Boolean
      {
         return _isAmbassador;
      }
      
      public function get isEmailVerified() : Boolean
      {
         return var_3988;
      }
      
      public function setRoomCameraFollowDisabled(param1:Boolean) : void
      {
         var_3332 = param1;
      }
      
      public function get isRoomCameraFollowDisabled() : Boolean
      {
         return var_3332;
      }
      
      public function setFriendBarState(param1:Boolean) : void
      {
         setUIFlag(1,param1);
      }
      
      public function setRoomToolsState(param1:Boolean) : void
      {
         setUIFlag(2,param1);
      }
      
      public function get uiFlags() : int
      {
         return var_463;
      }
      
      private function setUIFlag(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            if(var_463 & param1)
            {
               return;
            }
            var_463 |= param1;
         }
         else
         {
            if(!(var_463 & param1))
            {
               return;
            }
            var_463 &= ~param1;
         }
         _communication.connection.send(new class_416(var_463));
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return var_1871.getBadgeImage(param1);
      }
      
      public function getBadgeSmallImage(param1:String) : BitmapData
      {
         return var_1871.getSmallBadgeImage(param1);
      }
      
      public function getBadgeImageAssetName(param1:String) : String
      {
         return var_1871.getBadgeImageAssetName(param1);
      }
      
      public function getBadgeImageSmallAssetName(param1:String) : String
      {
         return var_1871.getSmallScaleBadgeAssetName(param1);
      }
      
      public function requestBadgeImage(param1:String) : BitmapData
      {
         return var_1871.getBadgeImage(param1,"normal_badge",false);
      }
      
      public function getBadgeImageWithInfo(param1:String) : BadgeInfo
      {
         return var_1871.getBadgeImageWithInfo(param1);
      }
      
      private function onAlertClose(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return var_4080.getBadgeId(param1);
      }
      
      public function send(param1:IMessageComposer) : void
      {
         _communication.connection.send(param1);
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return var_1871.getBadgeImage(param1,"group_badge");
      }
      
      public function getGroupBadgeSmallImage(param1:String) : BitmapData
      {
         return var_1871.getSmallBadgeImage(param1,"group_badge");
      }
      
      public function getGroupBadgeAssetName(param1:String) : String
      {
         return var_1871.getBadgeImageAssetName(param1,"group_badge");
      }
      
      public function getGroupBadgeSmallAssetName(param1:String) : String
      {
         return var_1871.getSmallScaleBadgeAssetName(param1,"group_badge");
      }
      
      public function isAccountSafetyLocked() : Boolean
      {
         return var_1342;
      }
      
      public function get communication() : class_25
      {
         return _communication;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return var_2981.isIgnored(param1);
      }
      
      public function ignoreUser(param1:String) : void
      {
         var_2981.ignoreUser(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         var_2981.unignoreUser(param1);
      }
      
      public function get respectLeft() : int
      {
         return var_1337;
      }
      
      public function get petRespectLeft() : int
      {
         return var_1357;
      }
      
      public function giveStarGem(param1:int) : void
      {
         if(param1 >= 0)
         {
            send(new class_628(param1));
         }
      }
      
      public function giveRespectFailed() : void
      {
         var_1337 += 1;
      }
      
      public function getCreditVaultStatus() : void
      {
         send(new class_182());
      }
      
      public function getIncomeRewardStatus() : void
      {
         send(new class_721());
      }
      
      public function withdrawCreditVault() : void
      {
         send(new class_714());
      }
      
      public function claimReward(param1:int) : void
      {
         send(new class_923(param1));
      }
      
      public function givePetRespect(param1:int) : void
      {
         if(param1 >= 0 && var_1357 > 0)
         {
            send(new class_804(param1));
            var_1357 -= 1;
         }
      }
      
      public function getProductData(param1:String) : class_3200
      {
         if(!var_3245)
         {
            loadProductData();
         }
         return var_235[param1];
      }
      
      public function getFloorItemData(param1:int) : class_3148
      {
         if(_floorItems == null)
         {
            return null;
         }
         return _floorItems.getValue(param1.toString());
      }
      
      public function getFloorItemsDataByCategory(param1:int) : Array
      {
         var _loc2_:* = [];
         if(_floorItems != null)
         {
            for each(var _loc3_ in _floorItems)
            {
               if(_loc3_.category == param1)
               {
                  _loc2_.push(_loc3_);
               }
            }
         }
         return _loc2_;
      }
      
      public function getWallItemData(param1:int) : class_3148
      {
         if(_wallItems == null)
         {
            return null;
         }
         return _wallItems.getValue(param1.toString());
      }
      
      public function getFloorItemDataByName(param1:String, param2:int = 0) : class_3148
      {
         var _loc3_:int = 0;
         if(var_1863 == null)
         {
            return null;
         }
         var _loc4_:Array;
         if((_loc4_ = var_1863.getValue(param1)) != null && param2 <= _loc4_.length - 1)
         {
            _loc3_ = int(_loc4_[param2]);
            return getFloorItemData(_loc3_);
         }
         return null;
      }
      
      public function getWallItemDataByName(param1:String, param2:int = 0) : class_3148
      {
         var _loc3_:int = 0;
         if(var_1863 == null)
         {
            return null;
         }
         var _loc4_:Array;
         if((_loc4_ = var_1863.getValue(param1)) != null && param2 <= _loc4_.length - 1)
         {
            _loc3_ = int(_loc4_[param2]);
            return getWallItemData(_loc3_);
         }
         return null;
      }
      
      public function openHabboHomePage(param1:int, param2:String) : void
      {
         var _loc3_:String = null;
         if(propertyExists("link.format.userpage"))
         {
            _loc3_ = getProperty("link.format.userpage");
            _loc3_ = _loc3_.replace("%ID%",String(param1));
            _loc3_ = _loc3_.replace("%username%",param2);
            try
            {
               HabboWebTools.navigateToURL(_loc3_,"habboMain");
            }
            catch(e:Error)
            {
               class_14.log("Error occurred!");
            }
         }
      }
      
      public function pickAllFurniture(param1:int) : void
      {
         var session:IRoomSession;
         var roomId:int = param1;
         if(_roomSessionManager == null || _windowManager == null)
         {
            return;
         }
         session = _roomSessionManager.getSession(roomId);
         if(session == null)
         {
            return;
         }
         if(false || isAnyRoomController || false)
         {
            _windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:class_3216, param2:class_3134):void
            {
               param1.dispose();
               if(param2.type == "WE_OK")
               {
                  sendSpecialCommandMessage(":pickall");
               }
            });
         }
      }
      
      public function resetScores(param1:int) : void
      {
         var session:IRoomSession;
         var roomId:int = param1;
         if(_roomSessionManager == null || _windowManager == null)
         {
            return;
         }
         session = _roomSessionManager.getSession(roomId);
         if(session == null)
         {
            return;
         }
         if(false || isAnyRoomController || false)
         {
            _windowManager.confirm("${generic.alert.title}","${room.confirm.resetscores}",0,function(param1:class_3216, param2:class_3134):void
            {
               param1.dispose();
               if(param2.type == "WE_OK")
               {
                  sendSpecialCommandMessage(":resetscores");
               }
            });
         }
      }
      
      public function ejectAllFurniture(param1:int, param2:String) : void
      {
         var session:IRoomSession;
         var roomId:int = param1;
         var message:String = param2;
         if(_roomSessionManager == null || _windowManager == null)
         {
            return;
         }
         session = _roomSessionManager.getSession(roomId);
         if(session == null)
         {
            return;
         }
         if(false || isAnyRoomController || false)
         {
            _windowManager.confirm("${generic.alert.title}","${room.confirm.eject_all}",0,function(param1:class_3216, param2:class_3134):void
            {
               param1.dispose();
               if(param2.type == "WE_OK")
               {
                  sendSpecialCommandMessage(message);
               }
            });
         }
      }
      
      public function ejectPets(param1:int) : void
      {
         if(_roomSessionManager == null || _windowManager == null)
         {
            return;
         }
         var _loc2_:IRoomSession = _roomSessionManager.getSession(param1);
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.isRoomOwner || isAnyRoomController)
         {
            sendSpecialCommandMessage(":ejectpets");
         }
      }
      
      public function pickAllBuilderFurniture(param1:int) : void
      {
         var session:IRoomSession;
         var roomId:int = param1;
         if(_roomSessionManager == null || _windowManager == null)
         {
            return;
         }
         session = _roomSessionManager.getSession(roomId);
         if(session == null)
         {
            return;
         }
         if(false || isAnyRoomController || false)
         {
            _windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all_bc}",0,function(param1:class_3216, param2:class_3134):void
            {
               param1.dispose();
               if(param2.type == "WE_OK")
               {
                  sendSpecialCommandMessage(":pickallbc");
               }
            });
         }
      }
      
      public function loadProductData(param1:class_1695 = null) : Boolean
      {
         if(var_3245)
         {
            return true;
         }
         if(param1 && _productDataListeners.indexOf(param1) == -1)
         {
            _productDataListeners.push(param1);
         }
         return false;
      }
      
      public function addProductsReadyEventListener(param1:class_1695) : void
      {
         if(var_3245)
         {
            param1.productDataReady();
            return;
         }
         if(param1 && _productDataListeners.indexOf(param1) == -1)
         {
            _productDataListeners.push(param1);
         }
      }
      
      private function onProductsReady(param1:Event) : void
      {
         var_1779.removeEventListener("PDP_product_data_ready",onProductsReady);
         var_3245 = true;
         for each(var _loc2_ in _productDataListeners)
         {
            if(_loc2_ != null && !_loc2_.disposed)
            {
               _loc2_.productDataReady();
            }
         }
         _productDataListeners = [];
      }
      
      private function onRoomReady(param1:IMessageEvent) : void
      {
         var _loc3_:class_847 = param1 as class_847;
         if(_loc3_ == null || _loc3_.getParser() == null || param1.connection == null)
         {
            return;
         }
         var _loc2_:class_1134 = _loc3_.getParser();
         HabboWebTools.roomVisited(_loc2_.roomId);
      }
      
      public function sendSpecialCommandMessage(param1:String) : void
      {
         send(new class_661(param1));
      }
      
      public function get roomSessionManager() : com.sulake.habbo.session.IRoomSessionManager
      {
         return _roomSessionManager;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      private function onCatalogPublished(param1:IMessageEvent) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:class_746 = param1 as class_746;
         if(_loc3_.newFurniDataHash != null)
         {
            _newFurniDataHash = _loc3_.newFurniDataHash;
         }
         if(_loc3_.instantlyRefreshCatalogue)
         {
            refreshFurniData(null);
         }
         else
         {
            _loc2_ = getInteger("catalogue.published.min.refresh.interval",5);
            _loc4_ = getInteger("catalogue.published.max.refresh.interval",20);
            _loc5_ = Math.floor(Math.random() * (_loc4_ - _loc2_ + 1)) + _loc2_;
            if(var_2410 == null)
            {
               var_2410 = new Timer(_loc5_ * 3000);
               var_2410.addEventListener("timer",refreshFurniData);
               var_2410.start();
            }
         }
      }
      
      private function refreshFurniData(param1:TimerEvent) : void
      {
         if(var_2410 != null)
         {
            var_2410.removeEventListener("timer",refreshFurniData);
            var_2410 = null;
         }
         _floorItems = new class_24();
         _wallItems = new class_24();
         var_1863 = new class_24();
         initFurnitureData();
      }
      
      public function removeFurniDataListener(param1:class_1696) : void
      {
         if(!_furniDataListeners)
         {
            return;
         }
         var _loc2_:int = _furniDataListeners.indexOf(param1);
         if(_loc2_ > -1)
         {
            _furniDataListeners.splice(_loc2_,1);
         }
      }
      
      public function getFurniData(param1:class_1696) : Vector.<class_3148>
      {
         if(_floorItems == null || false)
         {
            if(_furniDataListeners.indexOf(param1) == -1)
            {
               _furniDataListeners.push(param1);
            }
            return null;
         }
         return Vector.<class_3148>(_floorItems.getValues().concat(_wallItems.getValues()));
      }
      
      public function getXmlWindow(param1:String) : class_3127
      {
         var _loc4_:IAsset = null;
         var _loc2_:XmlAsset = null;
         var _loc3_:class_3127 = null;
         try
         {
            _loc4_ = assets.getAssetByName(param1);
            _loc2_ = XmlAsset(_loc4_);
            _loc3_ = _windowManager.buildFromXML(XML(_loc2_.content));
         }
         catch(e:Error)
         {
         }
         return _loc3_;
      }
      
      public function getButtonImage(param1:String) : BitmapData
      {
         var _loc3_:* = param1;
         var _loc6_:IAsset = assets.getAssetByName(_loc3_);
         var _loc4_:BitmapDataAsset = BitmapDataAsset(_loc6_);
         var _loc2_:BitmapData = BitmapData(_loc4_.content);
         var _loc5_:BitmapData;
         (_loc5_ = new BitmapData(_loc2_.width,_loc2_.height,true,0)).draw(_loc2_);
         return _loc5_;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get nameChangeAllowed() : Boolean
      {
         return var_1350;
      }
      
      public function get perksReady() : Boolean
      {
         return var_2224 != null && false;
      }
      
      public function isPerkAllowed(param1:String) : Boolean
      {
         return var_2224.isPerkAllowed(param1);
      }
      
      public function getPerkErrorMessage(param1:String) : String
      {
         return var_2224.getPerkErrorMessage(param1);
      }
      
      public function get currentTalentTrack() : String
      {
         return getBoolean("talent.track.citizenship.enabled") && !isPerkAllowed("CITIZEN") ? "citizenship" : "helper";
      }
      
      public function get mysteryBoxColor() : String
      {
         return _mysteryBoxColor;
      }
      
      public function get mysteryKeyColor() : String
      {
         return _mysteryKeyColor;
      }
   }
}
