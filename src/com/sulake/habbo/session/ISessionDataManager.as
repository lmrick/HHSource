package com.sulake.habbo.session
{
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.session.furniture.class_1696;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_1695;
   import com.sulake.habbo.session.product.class_3200;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   
   public interface ISessionDataManager extends IUnknown
   {
       
      
      function get events() : IEventDispatcher;
      
      function get systemOpen() : Boolean;
      
      function get systemShutDown() : Boolean;
      
      function get isAuthenticHabbo() : Boolean;
      
      function hasSecurity(param1:int) : Boolean;
      
      function get topSecurityLevel() : int;
      
      function get clubLevel() : int;
      
      function get hasVip() : Boolean;
      
      function get hasClub() : Boolean;
      
      function get isNoob() : Boolean;
      
      function get isRealNoob() : Boolean;
      
      function get userId() : int;
      
      function get userName() : String;
      
      function get realName() : String;
      
      function get figure() : String;
      
      function get gender() : String;
      
      function get nameChangeAllowed() : Boolean;
      
      function get isAnyRoomController() : Boolean;
      
      function get isAmbassador() : Boolean;
      
      function get isEmailVerified() : Boolean;
      
      function get mysteryBoxColor() : String;
      
      function get mysteryKeyColor() : String;
      
      function getBadgeImage(param1:String) : BitmapData;
      
      function getBadgeSmallImage(param1:String) : BitmapData;
      
      function getBadgeImageAssetName(param1:String) : String;
      
      function getBadgeImageSmallAssetName(param1:String) : String;
      
      function requestBadgeImage(param1:String) : BitmapData;
      
      function getBadgeImageWithInfo(param1:String) : BadgeInfo;
      
      function getGroupBadgeId(param1:int) : String;
      
      function getGroupBadgeImage(param1:String) : BitmapData;
      
      function getGroupBadgeSmallImage(param1:String) : BitmapData;
      
      function getGroupBadgeAssetName(param1:String) : String;
      
      function getGroupBadgeSmallAssetName(param1:String) : String;
      
      function isAccountSafetyLocked() : Boolean;
      
      function isIgnored(param1:String) : Boolean;
      
      function ignoreUser(param1:String) : void;
      
      function unignoreUser(param1:String) : void;
      
      function get respectLeft() : int;
      
      function get petRespectLeft() : int;
      
      function giveStarGem(param1:int) : void;
      
      function giveRespectFailed() : void;
      
      function givePetRespect(param1:int) : void;
      
      function getProductData(param1:String) : class_3200;
      
      function getFloorItemData(param1:int) : class_3148;
      
      function getFloorItemsDataByCategory(param1:int) : Array;
      
      function getWallItemData(param1:int) : class_3148;
      
      function getFloorItemDataByName(param1:String, param2:int = 0) : class_3148;
      
      function getWallItemDataByName(param1:String, param2:int = 0) : class_3148;
      
      function openHabboHomePage(param1:int, param2:String) : void;
      
      function pickAllFurniture(param1:int) : void;
      
      function resetScores(param1:int) : void;
      
      function ejectAllFurniture(param1:int, param2:String) : void;
      
      function ejectPets(param1:int) : void;
      
      function loadProductData(param1:class_1695 = null) : Boolean;
      
      function getFurniData(param1:class_1696) : Vector.<class_3148>;
      
      function addProductsReadyEventListener(param1:class_1695) : void;
      
      function get perksReady() : Boolean;
      
      function isPerkAllowed(param1:String) : Boolean;
      
      function getPerkErrorMessage(param1:String) : String;
      
      function sendSpecialCommandMessage(param1:String) : void;
      
      function get currentTalentTrack() : String;
      
      function pickAllBuilderFurniture(param1:int) : void;
      
      function removeFurniDataListener(param1:class_1696) : void;
      
      function setRoomCameraFollowDisabled(param1:Boolean) : void;
      
      function get isRoomCameraFollowDisabled() : Boolean;
      
      function setFriendBarState(param1:Boolean) : void;
      
      function setRoomToolsState(param1:Boolean) : void;
      
      function get uiFlags() : int;
      
      function getCreditVaultStatus() : void;
      
      function getIncomeRewardStatus() : void;
      
      function withdrawCreditVault() : void;
      
      function claimReward(param1:int) : void;
   }
}
