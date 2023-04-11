package com.sulake.core.localization
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.class_24;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class CoreLocalizationManager extends class_20 implements class_13, ICoreLocalizationManager
   {
      
      private static const INTERPOLATION_DEPTH_LIMIT:int = 3;
       
      
      private var var_44:Dictionary;
      
      private var var_82:class_24;
      
      private var _activeLocalizationDefinition:String;
      
      private var var_163:Array;
      
      private var _acceptEmptyMap:class_24;
      
      private var _activeEnvironmentId:String;
      
      private var _gameDataResources:com.sulake.core.localization.class_40;
      
      public function CoreLocalizationManager(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         var_163 = [];
         super(param1,param2,param3);
      }
      
      private static function validateLocalizationData(param1:String, param2:Boolean) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         if(param1.length == 0 && !param2)
         {
            return false;
         }
         if(param1.indexOf("<!DOCTYPE html") != -1)
         {
            return false;
         }
         return true;
      }
      
      override protected function initComponent() : void
      {
         var_44 = new Dictionary();
         var_82 = new class_24();
         _acceptEmptyMap = new class_24();
      }
      
      override public function dispose() : void
      {
         var_44 = null;
         if(var_82 != null)
         {
            var_82.dispose();
         }
         var_82 = null;
         var_163 = null;
         super.dispose();
      }
      
      public function registerLocalizationDefinition(param1:String, param2:String, param3:String, param4:String) : void
      {
         var _loc5_:LocalizationDefinition;
         if((_loc5_ = var_82[param1]) == null)
         {
            _loc5_ = new LocalizationDefinition(param4,param2,param3);
            var_82[param1] = _loc5_;
         }
      }
      
      public function activateLocalizationDefinition(param1:String) : Boolean
      {
         var _loc2_:LocalizationDefinition = var_82[param1];
         if(_loc2_ != null)
         {
            _activeLocalizationDefinition = param1;
            loadLocalizationFromURL(_loc2_.url,_loc2_.languageCode);
            return true;
         }
         return false;
      }
      
      public function getGameDataResources() : com.sulake.core.localization.class_40
      {
         return _gameDataResources;
      }
      
      public function getLocalizationDefinitions() : class_24
      {
         return var_82;
      }
      
      public function getLocalizationDefinition(param1:String) : ILocalizationDefinition
      {
         return var_82[param1] as ILocalizationDefinition;
      }
      
      public function getActiveEnvironmentId() : String
      {
         return _activeEnvironmentId;
      }
      
      public function getActiveLocalizationDefinition() : ILocalizationDefinition
      {
         return getLocalizationDefinition(_activeLocalizationDefinition);
      }
      
      public function loadLocalizationFromURL(param1:String, param2:String, param3:Boolean = false) : void
      {
         var urlLoader:URLLoader;
         var hashesUrl:String = param1;
         var environmentId:String = param2;
         var acceptEmpty:Boolean = param3;
         if(!hashesUrl || hashesUrl == "")
         {
            class_14.log("[CoreLocalizationManager] Localization hashes URL was null or empty!");
            events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
            return;
         }
         urlLoader = new URLLoader(new URLRequest(hashesUrl));
         urlLoader.addEventListener("complete",function(param1:Event):void
         {
            var _loc4_:class_51 = null;
            var _loc5_:String = null;
            var _loc6_:IAsset = null;
            var _loc7_:String = null;
            var _loc3_:AssetLoaderStruct = null;
            var _loc2_:String = String(param1.currentTarget.data);
            if(_loc2_ && _loc2_.length > 0)
            {
               try
               {
                  if(!(_loc4_ = class_51.parse(_loc2_)).isValid())
                  {
                     events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
                     return;
                  }
                  _gameDataResources = _loc4_;
                  _loc5_ = "localization_" + environmentId.toLowerCase() + "_" + _loc4_.getExternalTextsHash();
                  if((_loc6_ = assets.getAssetByName(_loc5_)) && environmentId == _activeEnvironmentId)
                  {
                     events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_LOADED"));
                     return;
                  }
                  _activeEnvironmentId = environmentId;
                  _acceptEmptyMap.remove(_loc5_);
                  _acceptEmptyMap.add(_loc5_,acceptEmpty);
                  _loc7_ = _loc4_.getExternalTextsUrl() + "/" + _loc4_.getExternalTextsHash();
                  class_14.log("[CoreLocalizationManager] load localization for url: " + _loc7_);
                  _loc3_ = assets.loadAssetFromFile(_loc5_,new URLRequest(_loc7_),"text/plain");
                  _loc3_.addEventListener("AssetLoaderEventComplete",onLocalizationReady);
                  _loc3_.addEventListener("AssetLoaderEventError",onLocalizationFailed);
               }
               catch(error:Error)
               {
                  class_14.log("Failed parsing hashes",error.getStackTrace());
                  events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
               }
            }
            else
            {
               events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
            }
         });
         urlLoader.addEventListener("error",function(param1:Event):void
         {
            events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
         });
         urlLoader.addEventListener("ioError",function(param1:Event):void
         {
            events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
         });
      }
      
      private function onLocalizationReady(param1:AssetLoaderEvent) : void
      {
         var _loc5_:String = null;
         var _loc3_:String = null;
         var _loc4_:ByteArray = null;
         var _loc7_:IAsset = null;
         var _loc2_:Boolean = false;
         var _loc6_:AssetLoaderStruct;
         if((_loc6_ = param1.target as AssetLoaderStruct) != null)
         {
            _loc5_ = _loc6_.assetName;
            if(_loc6_.assetLoader.content is ByteArray)
            {
               (_loc4_ = _loc6_.assetLoader.content as ByteArray).position = 0;
               _loc3_ = _loc4_.readUTFBytes(_loc4_.length);
            }
            else
            {
               _loc3_ = _loc6_.assetLoader.content as String;
            }
            if(_loc7_ = assets.getAssetByName(_loc5_))
            {
               assets.removeAsset(_loc7_).dispose();
            }
            _loc2_ = _acceptEmptyMap.getValue(_loc5_);
            if(!validateLocalizationData(_loc3_,_loc2_))
            {
               this.events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
               return;
            }
            parseLocalizationData(_loc3_);
            this.events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_LOADED"));
         }
      }
      
      private function onLocalizationFailed(param1:AssetLoaderEvent) : void
      {
         var _loc4_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc2_:URLRequest = new URLRequest(_loc4_.assetLoader.url);
         var _loc3_:AssetLoaderStruct = assets.loadAssetFromFile(_loc4_.assetLoader.url,_loc2_,"text/plain");
         _loc3_.addEventListener("AssetLoaderEventComplete",onLocalizationReady);
         _loc3_.addEventListener("AssetLoaderEventError",onLocalizationRetryFailed);
      }
      
      private function onLocalizationRetryFailed(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         ErrorReportStorage.addDebugData("Localization name",_loc2_.assetName);
         ErrorReportStorage.addDebugData("Localization url",_loc2_.assetLoader.url);
         ErrorReportStorage.addDebugData("Localization error","Code: " + _loc2_.assetLoader.errorCode);
      }
      
      public function hasLocalization(param1:String) : Boolean
      {
         var _loc2_:Localization = var_44[param1] as Localization;
         return _loc2_ != null;
      }
      
      public function getLocalization(param1:String, param2:String = "") : String
      {
         var _loc3_:Localization = var_44[param1] as Localization;
         if(_loc3_ == null)
         {
            var_163.push(param1);
            return param2;
         }
         return _loc3_.value;
      }
      
      private function getRawValue(param1:String, param2:String = "") : String
      {
         var _loc3_:Localization = var_44[param1] as Localization;
         if(_loc3_ == null)
         {
            var_163.push(param1);
            return param2;
         }
         return _loc3_.raw;
      }
      
      public function updateLocalization(param1:String, param2:String) : void
      {
         var _loc3_:Localization = var_44[param1];
         if(_loc3_ == null)
         {
            _loc3_ = new Localization(this,param1,param2);
            var_44[param1] = _loc3_;
         }
         else
         {
            _loc3_.setValue(param2);
         }
      }
      
      private function updateAllListeners() : void
      {
         for each(var _loc1_ in var_44)
         {
            _loc1_.updateListeners();
         }
      }
      
      public function registerListener(param1:String, param2:ILocalizable) : Boolean
      {
         var _loc3_:Localization = var_44[param1];
         if(_loc3_ == null)
         {
            var_163.push(param1);
            _loc3_ = new Localization(this,param1,param1);
            var_44[param1] = _loc3_;
         }
         _loc3_.registerListener(param2);
         return true;
      }
      
      public function removeListener(param1:String, param2:ILocalizable) : Boolean
      {
         var _loc3_:Localization = var_44[param1];
         if(_loc3_ != null)
         {
            _loc3_.removeListener(param2);
         }
         return true;
      }
      
      public function registerParameter(param1:String, param2:String, param3:String, param4:String = "%") : String
      {
         var _loc5_:Localization;
         if((_loc5_ = var_44[param1]) == null)
         {
            _loc5_ = new Localization(this,param1,param1);
            var_44[param1] = _loc5_;
         }
         _loc5_.registerParameter(param2,param3,param4);
         return _loc5_.value;
      }
      
      public function getLocalizationRaw(param1:String) : ILocalization
      {
         return var_44[param1] as ILocalization;
      }
      
      public function getKeys() : Array
      {
         var _loc1_:* = [];
         for(var _loc2_ in var_44)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function printNonExistingKeys() : void
      {
         var _loc1_:String = "";
         for each(var _loc2_ in var_163)
         {
            _loc1_ += _loc2_ + "\n";
         }
         class_14.log(_loc1_);
      }
      
      private function applyLocalizationData(param1:Dictionary) : void
      {
         var _loc2_:String = null;
         for(var _loc3_ in param1)
         {
            _loc2_ = String(param1[_loc3_]);
            updateLocalization(_loc3_,_loc2_);
         }
      }
      
      protected function parseLocalizationData(param1:String) : Dictionary
      {
         var _loc6_:int = 0;
         var _loc4_:String = null;
         var _loc11_:Array = null;
         var _loc12_:String = null;
         var _loc10_:String = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc5_:Dictionary = new Dictionary();
         var _loc2_:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/gm;
         var _loc9_:RegExp = /^\s+|\s+$/g;
         var _loc8_:Array = param1.split(_loc2_);
         var _loc7_:RegExp = /\\n/gm;
         var _loc3_:int = int(_loc8_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            if((_loc4_ = String(_loc8_[_loc6_])).charAt(0) != "#")
            {
               if((_loc11_ = _loc4_.split("="))[0].length > 0)
               {
                  if(_loc11_.length > 1)
                  {
                     _loc12_ = _loc11_.shift();
                     _loc10_ = _loc11_.join("=");
                     _loc12_ = _loc12_.replace(_loc9_,"");
                     if((_loc10_ = (_loc10_ = _loc10_.replace(_loc9_,"")).replace(_loc7_,"\n")).length > 0)
                     {
                        updateLocalization(_loc12_,_loc10_);
                        _loc5_[_loc12_] = _loc10_;
                     }
                  }
               }
            }
            _loc6_++;
         }
         updateAllListeners();
         return _loc5_;
      }
      
      override public function interpolate(param1:String) : String
      {
         var _loc5_:int = 0;
         var _loc4_:Object = null;
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:Localization = null;
         var _loc6_:RegExp = /\${([^}]*)}/g;
         _loc5_ = 0;
         while(_loc5_ < 3)
         {
            if((_loc4_ = _loc6_.exec(param1)) == null)
            {
               return param1;
            }
            _loc3_ = 0;
            _loc7_ = 1;
            while(_loc7_ < _loc4_.length)
            {
               _loc2_ = var_44[_loc4_[_loc7_]];
               if(_loc2_ != null)
               {
                  _loc3_++;
                  param1 = param1.replace("${" + _loc4_[_loc7_] + "}",_loc2_.value);
               }
               _loc7_ += 1;
            }
            if(_loc3_ == 0)
            {
               break;
            }
            _loc5_++;
         }
         return super.interpolate(param1);
      }
   }
}
