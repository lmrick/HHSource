package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.avatar.animation.class_3154;
   import com.sulake.habbo.avatar.structure.class_3143;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public interface IAvatarRenderManager extends IUnknown
   {
       
      
      function createAvatarImage(param1:String, param2:String, param3:String = null, param4:class_1870 = null, param5:class_3157 = null) : class_3156;
      
      function get assets() : class_21;
      
      function getFigureData() : class_3143;
      
      function getFigureStringWithFigureIds(param1:String, param2:String, param3:Vector.<int>) : String;
      
      function isValidFigureSetForGender(param1:int, param2:String) : Boolean;
      
      function getMandatoryAvatarPartSetIds(param1:String, param2:int) : Array;
      
      function getAssetByName(param1:String) : IAsset;
      
      function get mode() : String;
      
      function set mode(param1:String) : void;
      
      function injectFigureData(param1:XML) : void;
      
      function createFigureContainer(param1:String) : class_3182;
      
      function isFigureReady(param1:class_3182) : Boolean;
      
      function downloadFigure(param1:class_3182, param2:class_1870) : void;
      
      function getAnimationManager() : class_3154;
      
      function get events() : IEventDispatcher;
      
      function resetAssetManager() : void;
      
      function resolveClubLevel(param1:class_3182, param2:String, param3:Array = null) : int;
      
      function getItemIds() : Array;
      
      function get effectMap() : Dictionary;
      
      function purgeAssets() : void;
   }
}
