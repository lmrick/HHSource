package com.sulake.habbo.inventory
{
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.inventory.items.class_3172;
   import flash.events.IEventDispatcher;
   
   public interface IHabboInventory extends IUnknown
   {
       
      
      function get events() : IEventDispatcher;
      
      function get clubDays() : int;
      
      function get clubPeriods() : int;
      
      function get clubPastPeriods() : int;
      
      function get clubLevel() : int;
      
      function get clubHasEverBeenMember() : Boolean;
      
      function get clubIsExpiring() : Boolean;
      
      function get citizenshipVipIsExpiring() : Boolean;
      
      function get clubMinutesUntilExpiration() : int;
      
      function get tradingActive() : Boolean;
      
      function get hasRoomSession() : Boolean;
      
      function get unseenItemTracker() : class_3202;
      
      function getAllMyBadgeIds(param1:Array) : Array;
      
      function getActivatedAvatarEffects() : Array;
      
      function getAvatarEffects() : Array;
      
      function requestSelectedFurniToMover(param1:class_3172) : Boolean;
      
      function getFloorItemById(param1:int) : class_3172;
      
      function getWallItemById(param1:int) : class_3172;
      
      function placePetToRoom(param1:int, param2:Boolean = false) : Boolean;
      
      function setEffectSelected(param1:int) : void;
      
      function getLastActivatedEffect() : int;
      
      function setEffectDeselected(param1:int) : void;
      
      function deselectAllEffects(param1:Boolean = false) : void;
      
      function getAvatarEffect(param1:int) : class_3141;
      
      function setupTrading(param1:int, param2:String) : void;
      
      function toggleInventoryPage(param1:String, param2:String = null, param3:Boolean = false) : void;
      
      function toggleInventorySubPage(param1:String) : void;
      
      function removeUnseenFurniCounter(param1:int) : Boolean;
      
      function removeUnseenPetCounter(param1:int) : Boolean;
      
      function hasFigureSetIdInInventory(param1:int) : Boolean;
      
      function hasBoundFigureSetFurniture(param1:String) : Boolean;
      
      function checkCategoryInitilization(param1:String) : Boolean;
      
      function getNonRentedInventoryIds(param1:String, param2:int) : Array;
   }
}
