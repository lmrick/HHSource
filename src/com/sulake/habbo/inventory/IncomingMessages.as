package com.sulake.habbo.inventory
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.inventory.badges.BadgesModel;
   import com.sulake.habbo.inventory.bots.BotsModel;
   import com.sulake.habbo.inventory.effects.Effect;
   import com.sulake.habbo.inventory.effects.EffectsModel;
   import com.sulake.habbo.inventory.events.HabboInventoryFurniListParsedEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.FurnitureItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.inventory.pets.PetsModel;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.session.furniture.class_3148;
   import flash.utils.getTimer;
   import package_10.class_1038;
   import package_10.class_606;
   import package_101.class_1042;
   import package_104.class_497;
   import package_104.class_591;
   import package_104.class_957;
   import package_11.class_975;
   import package_125.class_1052;
   import package_125.class_1057;
   import package_125.class_1122;
   import package_125.class_1253;
   import package_125.class_1264;
   import package_125.class_1329;
   import package_125.class_1333;
   import package_125.class_1411;
   import package_125.class_1450;
   import package_125.class_1451;
   import package_127.class_1054;
   import package_127.class_1355;
   import package_127.class_1424;
   import package_127.class_1502;
   import package_130.class_1276;
   import package_131.class_1060;
   import package_131.class_1076;
   import package_131.class_1178;
   import package_131.class_1325;
   import package_132.class_1441;
   import package_14.class_259;
   import package_14.class_272;
   import package_14.class_570;
   import package_14.class_677;
   import package_144.class_1121;
   import package_144.class_1139;
   import package_144.class_1422;
   import package_147.class_1192;
   import package_153.class_1100;
   import package_153.class_1108;
   import package_153.class_1149;
   import package_153.class_1543;
   import package_16.class_1595;
   import package_16.class_183;
   import package_16.class_256;
   import package_16.class_302;
   import package_16.class_339;
   import package_16.class_392;
   import package_16.class_503;
   import package_16.class_510;
   import package_16.class_666;
   import package_16.class_824;
   import package_16.class_945;
   import package_166.class_1152;
   import package_166.class_1399;
   import package_166.class_1447;
   import package_166.class_1510;
   import package_17.class_486;
   import package_175.class_1337;
   import package_175.class_1357;
   import package_175.class_1382;
   import package_176.class_1342;
   import package_28.class_201;
   import package_5.class_800;
   import package_5.class_993;
   import package_55.class_1598;
   import package_55.class_216;
   import package_55.class_268;
   import package_55.class_330;
   import package_55.class_367;
   import package_55.class_426;
   import package_6.class_142;
   import package_61.class_1007;
   import package_61.class_1041;
   import package_61.class_1581;
   import package_61.class_242;
   import package_61.class_317;
   import package_65.class_243;
   import package_65.class_414;
   import package_65.class_848;
   import package_65.class_886;
   import package_67.class_244;
   import package_67.class_557;
   import package_67.class_561;
   import package_8.class_640;
   import package_95.class_1008;
   
   public class IncomingMessages
   {
      
      private static const GROUPED_FURNI_TYPE:String = "credit_groupitem_type_id";
       
      
      private var _inventory:com.sulake.habbo.inventory.HabboInventory;
      
      private var _com:class_25;
      
      private var var_2927:Vector.<class_24>;
      
      private var var_3040:Vector.<class_24>;
      
      private var var_4334:Vector.<class_24>;
      
      private var var_3043:Vector.<class_24>;
      
      private var var_1585:int;
      
      public function IncomingMessages(param1:com.sulake.habbo.inventory.HabboInventory)
      {
         super();
         _inventory = param1;
         _com = _inventory.communication;
         _com.addHabboConnectionMessageEvent(new class_486(onRoomEnter));
         _com.addHabboConnectionMessageEvent(new class_945(onTradingOpen,class_1333));
         _com.addHabboConnectionMessageEvent(new class_256(onTradingOtherNotAllowed,class_1450));
         _com.addHabboConnectionMessageEvent(new class_975(onFlatAccessDenied));
         _com.addHabboConnectionMessageEvent(new class_1038(onRoomLeft));
         _com.addHabboConnectionMessageEvent(new class_414(onMarketplaceItemStats));
         _com.addHabboConnectionMessageEvent(new class_243(onMarketplaceConfiguration));
         _com.addHabboConnectionMessageEvent(new class_503(onTradingClose,class_1052));
         _com.addHabboConnectionMessageEvent(new class_848(onMarketplaceMakeOfferResult));
         _com.addHabboConnectionMessageEvent(new class_666(onTradingOpenFailed,class_1329));
         _com.addHabboConnectionMessageEvent(new class_367(onFurnitureAddOrUpdate));
         _com.addHabboConnectionMessageEvent(new class_268(onPostItPlaced));
         _com.addHabboConnectionMessageEvent(new class_557(onBots));
         _com.addHabboConnectionMessageEvent(new class_142(onUserRights));
         _com.addHabboConnectionMessageEvent(new class_201(onAchievementReceived));
         _com.addHabboConnectionMessageEvent(new class_993(onClubStatus));
         _com.addHabboConnectionMessageEvent(new class_242(onAvatarEffectAdded));
         _com.addHabboConnectionMessageEvent(new class_591(onBadgePointLimits));
         _com.addHabboConnectionMessageEvent(new class_216(onFurniList));
         _com.addHabboConnectionMessageEvent(new class_183(onTradingConfirmation,class_1253));
         _com.addHabboConnectionMessageEvent(new class_561(onBotAdded));
         _com.addHabboConnectionMessageEvent(new class_570(onPets));
         _com.addHabboConnectionMessageEvent(new class_957(onBadgeReceived));
         _com.addHabboConnectionMessageEvent(new class_800(onUserBadges));
         _com.addHabboConnectionMessageEvent(new class_510(onTradingCompleted,class_1057));
         _com.addHabboConnectionMessageEvent(new class_824(onTradingItemList,class_1264));
         _com.addHabboConnectionMessageEvent(new class_1008(onFigureSetIds));
         _com.addHabboConnectionMessageEvent(new class_339(onTradingYouAreNotAllowed,class_1451));
         _com.addHabboConnectionMessageEvent(new class_302(onTradingAccepted,class_1411));
         _com.addHabboConnectionMessageEvent(new class_392(onTradingNotOpen,class_1122));
         _com.addHabboConnectionMessageEvent(new class_317(onAvatarEffectExpired));
         _com.addHabboConnectionMessageEvent(new class_640(onNotEnoughCredits));
         _com.addHabboConnectionMessageEvent(new class_606(onRoomLeft));
         _com.addHabboConnectionMessageEvent(new class_677(onPetRemoved));
         _com.addHabboConnectionMessageEvent(new class_886(onMarketplaceCanMakeOfferResult));
         _com.addHabboConnectionMessageEvent(new class_244(onBotRemoved));
         _com.addHabboConnectionMessageEvent(new class_330(onFurniListInvalidate));
         _com.addHabboConnectionMessageEvent(new class_1007(onAvatarEffects));
         _com.addHabboConnectionMessageEvent(new class_497(onBadges));
         _com.addHabboConnectionMessageEvent(new class_1042(onAchievementsScore));
         _com.addHabboConnectionMessageEvent(new class_272(onPetAdded));
         _com.addHabboConnectionMessageEvent(new class_1041(onAvatarEffectActivated));
         _com.addHabboConnectionMessageEvent(new class_259(onGoToBreedingNestFailure));
         _com.addHabboConnectionMessageEvent(new class_426(onFurniListRemove));
      }
      
      public function dispose() : void
      {
         _inventory = null;
         _com = null;
      }
      
      public function onFurniList(param1:class_216) : void
      {
         var _loc4_:class_1447;
         if((_loc4_ = param1.getParser()) == null)
         {
            return;
         }
         if(true)
         {
            _inventory.initializeFurniturePage();
         }
         var _loc2_:FurniModel = _inventory.furniModel;
         if(_loc2_ == null)
         {
            return;
         }
         if(var_3040 == null)
         {
            var_3040 = new Vector.<class_24>(_loc4_.totalFragments,true);
         }
         var _loc5_:class_24;
         (_loc5_ = new class_24()).concatenate(_loc4_.furniFragment);
         var _loc3_:class_24 = addMessageFragment(_loc5_,_loc4_.totalFragments,_loc4_.fragmentNo,var_3040);
         if(!_loc3_)
         {
            return;
         }
         _loc2_.insertFurniture(_loc3_);
         var_3040 = null;
         _inventory.events.dispatchEvent(new HabboInventoryFurniListParsedEvent("furni"));
      }
      
      public function onFurnitureAddOrUpdate(param1:IMessageEvent) : void
      {
         var _loc2_:FurnitureItem = null;
         var _loc5_:GroupItem = null;
         var _loc3_:class_1399 = (param1 as class_367).getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc7_:FurniModel;
         if((_loc7_ = _inventory.furniModel) == null || !_loc7_.isListInited())
         {
            return;
         }
         var _loc6_:Vector.<class_1598> = _loc3_.getFurni();
         for each(var _loc4_ in _loc6_)
         {
            if(_loc5_ = _loc7_.getItemWithStripId(_loc4_.itemId))
            {
               _loc2_ = _loc5_.getItem(_loc4_.itemId);
               if(_loc2_)
               {
                  _loc2_.update(_loc4_);
                  _loc5_.hasUnseenItems = true;
               }
            }
            else
            {
               _loc2_ = new FurnitureItem(_loc4_);
               _loc7_.addOrUpdateItem(_loc2_,false);
            }
         }
         _loc7_.setViewToState();
         _loc7_.updateView();
      }
      
      public function onFurniListRemove(param1:IMessageEvent) : void
      {
         var _loc2_:class_1510 = (param1 as class_426).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc5_:FurniModel;
         if((_loc5_ = _inventory.furniModel) == null)
         {
            return;
         }
         var _loc4_:int = _loc2_.stripId;
         var _loc3_:GroupItem = _loc5_.removeFurni(_loc4_);
         if(_loc3_)
         {
            _loc5_.resetUnseenItems();
         }
      }
      
      public function onFurniListInvalidate(param1:IMessageEvent) : void
      {
         _inventory.setInventoryCategoryInit("furni",false);
         _inventory.setInventoryCategoryInit("rentables",false);
      }
      
      public function onPostItPlaced(param1:IMessageEvent) : void
      {
         var _loc2_:class_1152 = (param1 as class_268).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:FurniModel = _inventory.furniModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = _loc2_.id;
         var _loc5_:int = _loc2_.itemsLeft;
         _loc3_.updatePostItCount(_loc4_,_loc5_);
      }
      
      public function onAvatarEffects(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc4_:class_1581 = null;
         var _loc7_:Effect = null;
         if(_inventory == null)
         {
            return;
         }
         var _loc6_:EffectsModel;
         if((_loc6_ = _inventory.effectsModel) == null)
         {
            return;
         }
         var _loc3_:class_1325 = (param1 as class_1007).getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:Array = _loc3_.effects;
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc5_] as class_1581;
            (_loc7_ = new Effect()).type = _loc4_.type;
            _loc7_.subType = _loc4_.subType;
            _loc7_.duration = _loc4_.duration;
            _loc7_.isPermanent = _loc4_.isPermanent;
            _loc7_.amountInInventory = _loc4_.inactiveEffectsInInventory;
            if(_loc4_.secondsLeftIfActive >= 0)
            {
               _loc7_.isActive = true;
               _loc7_.secondsLeft = _loc4_.secondsLeftIfActive;
               _loc7_.amountInInventory++;
            }
            else if(_loc4_.secondsLeftIfActive == -1)
            {
               _loc7_.isActive = false;
               _loc7_.secondsLeft = _loc4_.duration;
            }
            _loc6_.addEffect(_loc7_,false);
            _loc5_++;
         }
         _inventory.setInventoryCategoryInit("effects");
         _loc6_.refreshViews();
         _inventory.notifyChangedEffects();
      }
      
      public function onAvatarEffectAdded(param1:IMessageEvent) : void
      {
         var _loc5_:EffectsModel;
         if((_loc5_ = _inventory.effectsModel) == null)
         {
            return;
         }
         var _loc2_:class_1178 = (param1 as class_242).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc7_:int = _loc2_.type;
         var _loc6_:int = _loc2_.subType;
         var _loc8_:int = _loc2_.duration;
         var _loc3_:Boolean = _loc2_.isPermanent;
         var _loc4_:Effect;
         (_loc4_ = new Effect()).type = _loc7_;
         _loc4_.subType = _loc6_;
         _loc4_.duration = _loc8_;
         _loc4_.isPermanent = _loc3_;
         _loc4_.secondsLeft = _loc8_;
         _loc5_.addEffect(_loc4_);
         _inventory.notifyChangedEffects();
      }
      
      public function onAvatarEffectActivated(param1:IMessageEvent) : void
      {
         var _loc3_:EffectsModel = _inventory.effectsModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1060 = (param1 as class_1041).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:int = _loc2_.type;
         _loc3_.setEffectActivated(_loc4_);
         _inventory.notifyChangedEffects();
      }
      
      public function onAvatarEffectExpired(param1:IMessageEvent) : void
      {
         var _loc3_:EffectsModel = _inventory.effectsModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1076 = (param1 as class_317).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:int = _loc2_.type;
         _loc3_.setEffectExpired(_loc4_);
         _inventory.notifyChangedEffects();
      }
      
      public function onClubStatus(param1:IMessageEvent) : void
      {
         var _loc2_:class_1276 = (param1 as class_993).getParser();
         if(_loc2_.productName == "habbo_club" || _loc2_.productName == "club_habbo")
         {
            _inventory.setClubStatus(_loc2_.periodsSubscribedAhead,_loc2_.daysToPeriodEnd,_loc2_.hasEverBeenMember,_loc2_.isVIP,_loc2_.responseType == 3,_loc2_.responseType == 4,_loc2_.minutesUntilExpiration,_loc2_.minutesSinceLastModified);
            _inventory.events.dispatchEvent(new HabboInventoryHabboClubEvent());
         }
      }
      
      public function onBadges(param1:IMessageEvent) : void
      {
         var _loc3_:class_1108 = (param1 as class_497).getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:BadgesModel;
         if((_loc4_ = _inventory.badgesModel) == null)
         {
            return;
         }
         if(var_3043 == null)
         {
            var_1585 = getTimer();
            var_3043 = new Vector.<class_24>(_loc3_.totalFragments,true);
         }
         var _loc5_:class_24;
         (_loc5_ = new class_24()).concatenate(_loc3_.currentFragment);
         var _loc2_:class_24 = addMessageFragment(_loc5_,_loc3_.totalFragments,_loc3_.fragmentNo,var_3043);
         if(!_loc2_)
         {
            return;
         }
         var_3043 = null;
         var _loc6_:int = getTimer() - var_1585;
         var_1585 = 0;
         class_14.log("Parsing badges took: " + _loc6_ + "ms");
         var_1585 = getTimer();
         _loc4_.initBadges(_loc2_);
         _loc6_ = getTimer() - var_1585;
         var_1585 = 0;
         class_14.log("Initializing badges took: " + _loc6_ + "ms");
         _loc4_.updateView();
         _inventory.setInventoryCategoryInit("badges");
      }
      
      public function onBadgePointLimits(param1:IMessageEvent) : void
      {
         var _loc2_:class_1149 = (param1 as class_591).getParser();
         for each(var _loc3_ in _loc2_.data)
         {
            _inventory.localization.setBadgePointLimit(_loc3_.badgeId,_loc3_.limit);
         }
      }
      
      public function onUserBadges(param1:IMessageEvent) : void
      {
         var _loc3_:class_800 = param1 as class_800;
         if(_loc3_.userId != _inventory.sessionData.userId)
         {
            return;
         }
         var _loc4_:BadgesModel;
         if((_loc4_ = _inventory.badgesModel) == null)
         {
            return;
         }
         var_1585 = getTimer();
         for each(var _loc2_ in _loc3_.badges)
         {
            _loc4_.updateBadge(_loc2_,true);
         }
         var _loc5_:int = getTimer() - var_1585;
         var_1585 = 0;
         class_14.log("Updating badges " + _loc3_.badges.length + "took: " + _loc5_ + "ms");
         var_1585 = getTimer();
         _loc4_.updateView();
         _loc5_ = getTimer() - var_1585;
         var_1585 = 0;
         class_14.log("Updating badge view took: " + _loc5_ + "ms");
      }
      
      public function onAchievementReceived(param1:IMessageEvent) : void
      {
         var _loc4_:class_201;
         var _loc3_:class_1192 = (_loc4_ = param1 as class_201).getParser();
         var _loc2_:BadgesModel = _inventory.badgesModel;
         if(_loc2_ != null)
         {
            _loc2_.updateBadge(_loc3_.data.badgeCode,false,_loc3_.data.badgeId);
            _loc2_.removeBadge(_loc3_.data.removedBadgeCode);
            _loc2_.updateView();
         }
      }
      
      public function onBadgeReceived(param1:IMessageEvent) : void
      {
         var _loc3_:class_1100 = class_957(param1).getParser();
         var _loc2_:BadgesModel = _inventory.badgesModel;
         if(_loc2_ != null)
         {
            _loc2_.updateBadge(_loc3_.badgeCode,false,_loc3_.badgeId);
            _loc2_.updateView();
         }
      }
      
      public function onAchievementsScore(param1:IMessageEvent) : void
      {
         var _loc2_:class_1042 = param1 as class_1042;
         var _loc3_:class_1342 = _loc2_.getParser() as class_1342;
         if(_loc3_ == null)
         {
            return;
         }
         _inventory.localization.registerParameter("achievements_score_description","score",_loc3_.score.toString());
      }
      
      private function onTradingOpen(param1:IMessageEvent) : void
      {
         var _loc13_:* = 0;
         if(!_inventory)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - inventory is null!");
            return;
         }
         var _loc2_:ISessionDataManager = _inventory.sessionData;
         var _loc16_:IRoomSession = _inventory.roomSession;
         if(!_loc2_)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - sessionData not available!");
            return;
         }
         if(!_loc16_)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - roomSession not available!");
            return;
         }
         _inventory.toggleInventorySubPage("trading");
         var _loc5_:class_945;
         if(!(_loc5_ = param1 as class_945))
         {
            ErrorReportStorage.addDebugData("IncomingEvent","event is of unknown type:" + param1 + "!");
            return;
         }
         var _loc8_:* = _loc5_.userID;
         var _loc3_:class_3259 = _loc16_.userDataManager.getUserData(_loc8_);
         if(!_loc3_)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - failed to retrieve own user data!");
            return;
         }
         var _loc6_:* = _loc3_.name;
         var _loc4_:* = _loc5_.userCanTrade > 0;
         var _loc14_:* = _loc5_.otherUserID;
         var _loc15_:class_3259;
         if(!(_loc15_ = _loc16_.userDataManager.getUserData(_loc14_)))
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - failed to retrieve other user data!");
            return;
         }
         var _loc11_:* = _loc15_.name;
         var _loc10_:* = _loc5_.otherUserCanTrade > 0;
         if(_loc14_ == _loc2_.userId)
         {
            _loc13_ = _loc8_;
            var _loc9_:* = _loc6_;
            var _loc7_:* = _loc4_;
            _loc8_ = _loc14_;
            _loc6_ = _loc11_;
            _loc4_ = _loc10_;
            _loc14_ = _loc13_;
            _loc11_ = _loc9_;
            _loc10_ = _loc7_;
         }
         var _loc12_:TradingModel;
         if((_loc12_ = _inventory.tradingModel) != null)
         {
            _loc12_.startTrading(_loc8_,_loc6_,_loc4_,_loc14_,_loc11_,_loc10_);
         }
      }
      
      private function onTradingOpenFailed(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = _inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingClose(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = _inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingCompleted(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = _inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingAccepted(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = _inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingConfirmation(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = _inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingItemList(param1:IMessageEvent) : void
      {
         var _loc8_:GroupItem = null;
         var _loc2_:class_824 = param1 as class_824;
         var _loc4_:class_24 = new class_24();
         var _loc5_:class_24 = new class_24();
         var _loc6_:int = _inventory.sessionData.userId;
         var _loc3_:FurniModel = _inventory.furniModel;
         if(_loc3_ == null)
         {
            return;
         }
         if(_inventory.getBoolean("trading.warning.enabled") && _loc2_.secondUserNumCredits > 0)
         {
            _loc8_ = _inventory.furniModel.createCreditGroupItem(_loc2_.secondUserNumCredits);
            _loc5_.add("credit_groupitem_type_id",_loc8_);
         }
         populateItemGroups(_loc2_.firstUserItemArray,_loc4_,_loc2_.firstUserID == _loc6_);
         populateItemGroups(_loc2_.secondUserItemArray,_loc5_,_loc2_.secondUserID == _loc6_);
         var _loc7_:TradingModel;
         if((_loc7_ = _inventory.tradingModel) != null)
         {
            _loc7_.updateItemGroupMaps(_loc2_,_loc4_,_loc5_);
         }
      }
      
      private function populateItemGroups(param1:Array, param2:class_24, param3:Boolean) : void
      {
         var _loc9_:GroupItem = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc5_:String = null;
         var _loc4_:class_1595 = null;
         var _loc6_:int = 0;
         var _loc10_:uint = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc10_)
         {
            _loc7_ = (_loc4_ = param1[_loc6_] as class_1595).itemTypeId;
            _loc8_ = _loc4_.category;
            _loc5_ = _loc4_.itemType + String(_loc7_);
            if(!_loc4_.isGroupable || isFurniExternalImage(_loc4_.itemTypeId))
            {
               _loc5_ = "itemid" + _loc4_.itemId;
            }
            if(_loc4_.category == 6)
            {
               _loc5_ = String(_loc7_) + "poster" + _loc4_.stuffData.getLegacyString();
            }
            else if(_loc4_.category == 17)
            {
               _loc5_ = TradingModel.getGuildFurniType(_loc7_,_loc4_.stuffData);
            }
            if((_loc9_ = _loc4_.isGroupable && !isFurniExternalImage(_loc4_.itemTypeId) ? param2.getValue(_loc5_) as GroupItem : null) == null)
            {
               _loc9_ = _inventory.furniModel.createGroupItem(_loc7_,_loc8_,_loc4_.stuffData);
               param2.add(_loc5_,_loc9_);
            }
            _loc9_.push(new FurnitureItem(_loc4_));
            _loc6_++;
         }
      }
      
      private function isFurniExternalImage(param1:int) : Boolean
      {
         var _loc2_:class_3148 = _inventory.getFurnitureData(param1,"i");
         return _loc2_ && _loc2_.isExternalImageType;
      }
      
      private function onTradingNotOpen(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = _inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingOtherNotAllowed(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = _inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingYouAreNotAllowed(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = _inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onRoomLeft(param1:IMessageEvent) : void
      {
         _inventory.closeView();
         _inventory.furniModel.roomLeft();
      }
      
      private function onFlatAccessDenied(param1:IMessageEvent) : void
      {
         var _loc2_:class_1441 = (param1 as class_975).getParser();
         if(true || _loc2_.userName != _inventory.sessionData.userName)
         {
            return;
         }
         _inventory.closeView();
         _inventory.furniModel.roomLeft();
      }
      
      private function onPets(param1:class_570) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc4_:PetsModel;
         if((_loc4_ = _inventory.petsModel) == null)
         {
            return;
         }
         var _loc3_:class_1139 = param1.getParser();
         if(var_2927 == null)
         {
            var_2927 = new Vector.<class_24>(_loc3_.totalFragments,true);
         }
         var _loc5_:class_24;
         (_loc5_ = new class_24()).concatenate(_loc3_.petListFragment);
         var _loc2_:class_24 = addMessageFragment(_loc5_,_loc3_.totalFragments,_loc3_.fragmentNo,var_2927);
         if(!_loc2_)
         {
            return;
         }
         _inventory.petsModel.updatePets(_loc2_);
         var_2927 = null;
      }
      
      private function onPetAdded(param1:class_272) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc3_:PetsModel = _inventory.petsModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1121 = param1.getParser();
         _loc3_.addPet(_loc2_.pet);
         if(_loc2_.openInventory())
         {
         }
      }
      
      private function onGoToBreedingNestFailure(param1:class_259) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc2_:String = "${gotobreedingnestfailure.getnest}";
         var _loc3_:Function = getNest;
         if(param1.getParser().reason == 6)
         {
            _loc2_ = "${gotobreedingnestfailure.getfood}";
            _loc3_ = getFood;
         }
         _inventory.windowManager.simpleAlert("${gotobreedingnestfailure.caption}","${gotobreedingnestfailure.subtitle}","${gotobreedingnestfailure.message." + param1.getParser().reason + "}",_loc2_,"",null,null,_loc3_);
      }
      
      private function getNest() : void
      {
         var _loc1_:String = _inventory.getProperty("gotobreedingnestfailure.catalogpage.nests");
         _inventory.catalog.openCatalogPage(_loc1_);
      }
      
      private function getFood() : void
      {
         var _loc1_:String = _inventory.getProperty("gotobreedingnestfailure.catalogpage.food");
         _inventory.catalog.openCatalogPage(_loc1_);
      }
      
      private function onPetRemoved(param1:class_677) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc3_:PetsModel = _inventory.petsModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1422 = param1.getParser();
         _loc3_.removePet(_loc2_.petId);
      }
      
      private function onBots(param1:class_557) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc3_:BotsModel = _inventory.botsModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1382 = param1.getParser();
         _loc3_.updateItems(_loc2_.items);
         _inventory.setInventoryCategoryInit("bots");
         _loc3_.setListInitialized();
      }
      
      private function onBotRemoved(param1:class_244) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc3_:BotsModel = _inventory.botsModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1337 = param1.getParser();
         _loc3_.removeItem(_loc2_.itemId);
      }
      
      private function onBotAdded(param1:class_561) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc3_:BotsModel = _inventory.botsModel;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.items.length >= _inventory.botsMax)
         {
            return;
         }
         var _loc2_:class_1357 = param1.getParser();
         _loc3_.addItem(_loc2_.item);
      }
      
      private function onMarketplaceConfiguration(param1:class_243) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc4_:MarketplaceModel;
         if((_loc4_ = _inventory.marketplaceModel) == null)
         {
            return;
         }
         var _loc3_:class_1355 = param1.getParser();
         _loc4_.isEnabled = _loc3_.isEnabled;
         _loc4_.commission = _loc3_.commission;
         _loc4_.tokenBatchPrice = _loc3_.tokenBatchPrice;
         _loc4_.tokenBatchSize = _loc3_.tokenBatchSize;
         _loc4_.offerMinPrice = _loc3_.offerMinPrice;
         _loc4_.offerMaxPrice = _loc3_.offerMaxPrice;
         _loc4_.expirationHours = _loc3_.expirationHours;
         _loc4_.averagePricePeriod = _loc3_.averagePricePeriod;
         _loc4_.sellingFeePercentage = _loc3_.sellingFeePercentage;
         _loc4_.revenueLimit = _loc3_.revenueLimit;
         _loc4_.halfTaxLimit = _loc3_.halfTaxLimit;
         _inventory.setInventoryCategoryInit("marketplace");
         var _loc2_:FurniModel = _inventory.furniModel;
         if(_loc2_ != null)
         {
            _loc2_.updateView();
         }
      }
      
      private function onMarketplaceCanMakeOfferResult(param1:class_886) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc3_:MarketplaceModel = _inventory.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1502 = param1.getParser();
         _loc3_.proceedOfferMaking(_loc2_.resultCode,_loc2_.tokenCount);
      }
      
      private function onMarketplaceMakeOfferResult(param1:class_848) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc3_:MarketplaceModel = _inventory.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1424 = param1.getParser();
         _loc3_.endOfferMaking(_loc2_.result);
      }
      
      private function onMarketplaceItemStats(param1:class_414) : void
      {
         if(param1 == null || _inventory == null)
         {
            return;
         }
         var _loc3_:MarketplaceModel = _inventory.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1054 = param1.getParser();
         _loc3_.setAveragePrice(_loc2_.furniCategoryId,_loc2_.furniTypeId,_loc2_.averagePrice);
      }
      
      private function onNotEnoughCredits(param1:class_640) : void
      {
         if(!param1 || !_inventory)
         {
            return;
         }
         var _loc2_:MarketplaceModel = _inventory.marketplaceModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.onNotEnoughCredits();
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:MarketplaceModel = null;
         if(_inventory.isInventoryCategoryInit("marketplace"))
         {
            _loc2_ = _inventory.marketplaceModel;
            if(_loc2_ == null)
            {
               return;
            }
            _loc2_.requestInitialization();
         }
      }
      
      private function onFigureSetIds(param1:class_1008) : void
      {
         _inventory.updatePurchasedFigureSetIds(param1.getParser().figureSetIds,param1.getParser().boundFurnitureNames);
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         if(_inventory.getBoolean("effects.reactivate.on.room.entry"))
         {
            _inventory.effectsModel.reactivateLastEffect();
         }
         _inventory.furniModel.roomEntered();
      }
      
      private function addMessageFragment(param1:class_24, param2:int, param3:int, param4:Vector.<class_24>) : class_24
      {
         if(param2 == 1)
         {
            return param1;
         }
         param4[param3] = param1;
         for each(var _loc5_ in param4)
         {
            if(_loc5_ == null)
            {
               return null;
            }
         }
         var _loc6_:class_24 = new class_24();
         for each(var _loc7_ in param4)
         {
            _loc6_.concatenate(_loc7_);
            _loc7_.dispose();
         }
         param4 = null;
         return _loc6_;
      }
   }
}
