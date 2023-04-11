package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.habbo.avatar.events.LibraryLoadedEvent;
   import com.sulake.habbo.avatar.structure.class_3143;
   import com.sulake.habbo.avatar.structure.figure.FigurePart;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.figure.class_3195;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AvatarAssetDownloadManager extends EventDispatcherWrapper
   {
      
      public static const LIBRARY_LOADED:String = "LIBRARY_LOADED";
      
      private static const LIB_BODY:String = "hh_human_body";
      
      private static const LIB_ITEMS:String = "hh_human_item";
      
      private static const LIB_AVATAR_EDITOR:String = "hh_avatar_editor";
       
      
      private var var_437:com.sulake.habbo.avatar.class_1691;
      
      private var var_1792:Dictionary;
      
      private var var_2847:Dictionary;
      
      private var _assets:class_21;
      
      private var var_2596:Dictionary;
      
      private var _listeners:Dictionary;
      
      private var var_1469:com.sulake.habbo.avatar.AvatarStructure;
      
      private var var_4095:String;
      
      private var var_2852:String;
      
      private var var_3676:Boolean;
      
      private var var_2992:int = 3;
      
      private var var_1842:AssetLoaderStruct;
      
      private var _downloadShiftTimer:Timer;
      
      private var var_2007:Array;
      
      private var var_2537:Array;
      
      private var var_2497:Array;
      
      private const DOWNLOAD_TIMEOUT:int = 100;
      
      private const MAX_SIMULTANEOUS_DOWNLOADS:int = 4;
      
      private var var_3986:String;
      
      private var var_2837:Array;
      
      public function AvatarAssetDownloadManager(param1:com.sulake.habbo.avatar.class_1691, param2:class_21, param3:String, param4:String, param5:com.sulake.habbo.avatar.AvatarStructure, param6:String)
      {
         var _loc10_:XmlAsset = null;
         var _loc8_:XML = null;
         var_2837 = ["hh_human_body","hh_human_item"];
         super();
         var_437 = param1;
         var_1792 = new Dictionary();
         var_2847 = new Dictionary();
         _assets = param2;
         var_1469 = param5;
         var_2596 = new Dictionary();
         var_4095 = param4;
         var_2852 = param3;
         var_3986 = param6;
         _listeners = new Dictionary();
         var_2007 = [];
         var_2537 = [];
         var_2497 = [];
         var_1469.renderManager.events.addEventListener("AVATAR_RENDER_READY",purgeInitDownloadBuffer);
         var _loc7_:URLRequest = new URLRequest(param3);
         var _loc9_:IAsset;
         if((_loc9_ = _assets.getAssetByName("figuremap")) == null)
         {
            var_1842 = _assets.loadAssetFromFile("figuremap",_loc7_,"text/xml");
            addMapLoaderEventListeners();
         }
         else
         {
            _loc8_ = ((_loc10_ = _assets.getAssetByName("figuremap") as XmlAsset).content as XML).copy();
            loadFigureMapData(_loc8_);
         }
         _downloadShiftTimer = new Timer(100,1);
         _downloadShiftTimer.addEventListener("timerComplete",onNextDownloadTimeout);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_2847 = null;
         _assets = null;
         var_2596 = null;
         _listeners = null;
         if(false)
         {
            var_1469.renderManager.events.removeEventListener("AVATAR_RENDER_READY",purgeInitDownloadBuffer);
         }
         var_1469 = null;
         var_2537 = null;
         var_2007 = null;
         if(_downloadShiftTimer)
         {
            _downloadShiftTimer.stop();
            _downloadShiftTimer = null;
         }
         if(var_1842)
         {
            removeMapLoaderEventListeners();
            var_1842 = null;
         }
      }
      
      private function addMapLoaderEventListeners() : void
      {
         if(var_1842)
         {
            var_1842.addEventListener("AssetLoaderEventComplete",onConfigurationComplete);
            var_1842.addEventListener("AssetLoaderEventError",onConfigurationError);
         }
      }
      
      private function removeMapLoaderEventListeners() : void
      {
         if(var_1842)
         {
            var_1842.removeEventListener("AssetLoaderEventComplete",onConfigurationComplete);
            var_1842.removeEventListener("AssetLoaderEventError",onConfigurationError);
         }
      }
      
      private function onConfigurationError(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:URLRequest = null;
         if(disposed)
         {
            return;
         }
         var_2992--;
         if(var_2992 <= 0)
         {
            HabboWebTools.logEventLog("Figuremap download error " + var_2852);
         }
         else
         {
            if(var_2852.indexOf("?") > 0)
            {
               _loc2_ = var_2852 + "&retry=" + var_2992;
            }
            else
            {
               _loc2_ = var_2852 + "?retry=" + var_2992;
            }
            removeMapLoaderEventListeners();
            _loc3_ = new URLRequest(_loc2_);
            var_1842 = _assets.loadAssetFromFile("figuremap",_loc3_,"text/xml");
            addMapLoaderEventListeners();
         }
      }
      
      private function onConfigurationComplete(param1:Event) : void
      {
         var _loc2_:XML = null;
         if(disposed)
         {
            return;
         }
         var _loc3_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc3_ == null)
         {
            return;
         }
         try
         {
            _loc2_ = {_loc3_.assetLoader.content as String};
         }
         catch(e:Error)
         {
            return;
         }
         loadFigureMapData(_loc2_);
      }
      
      private function loadFigureMapData(param1:XML) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.toString() == "")
         {
            return;
         }
         generateMap(param1);
         loadMandatoryLibs();
         var_3676 = true;
         dispatchEvent(new Event("complete"));
      }
      
      public function loadMandatoryLibs() : void
      {
         var _loc2_:AvatarAssetDownloadLibrary = null;
         var _loc1_:Array = var_2837.slice();
         for each(var _loc3_ in _loc1_)
         {
            _loc2_ = var_1792[_loc3_];
            if(_loc2_)
            {
               _loc2_.isMandatory = true;
               addToQueue(_loc2_);
            }
            else
            {
               class_14.log("Missing mandatory library: " + _loc3_);
            }
         }
         _downloadShiftTimer.start();
      }
      
      private function purgeInitDownloadBuffer(param1:Event) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_2007)
         {
            loadFigureSetData(_loc2_[0],_loc2_[1]);
         }
         var_2007 = [];
      }
      
      private function generateMap(param1:XML) : void
      {
         var _loc2_:AvatarAssetDownloadLibrary = null;
         var _loc3_:String = null;
         var _loc6_:* = null;
         for each(var _loc5_ in param1.lib)
         {
            _loc2_ = new AvatarAssetDownloadLibrary(_loc5_.@id,_loc5_.@revision,var_4095,_assets,var_3986);
            _loc2_.addEventListener("complete",libraryComplete);
            var_1792[_loc2_.libraryName] = _loc2_;
            for each(var _loc4_ in _loc5_.part)
            {
               _loc3_ = _loc4_.@type + ":" + _loc4_.@id;
               if((_loc6_ = var_2847[_loc3_]) == null)
               {
                  _loc6_ = [];
               }
               _loc6_.push(_loc2_);
               var_2847[_loc3_] = _loc6_;
            }
         }
      }
      
      public function isReady(param1:class_3182) : Boolean
      {
         if(!var_3676 || !var_1469.renderManager.isReady)
         {
            return false;
         }
         var _loc2_:Array = getLibsToDownload(param1);
         return _loc2_.length == 0;
      }
      
      public function loadFigureSetData(param1:class_3182, param2:class_1870) : void
      {
         var _loc5_:* = null;
         if(!var_3676 || !var_1469.renderManager.isReady)
         {
            var_2007.push([param1,param2]);
            return;
         }
         var _loc6_:String = param1.getFigureString();
         var _loc4_:Array;
         if((_loc4_ = getLibsToDownload(param1)).length > 0)
         {
            if(param2 && !param2.disposed)
            {
               if((_loc5_ = _listeners[_loc6_]) == null)
               {
                  _loc5_ = [];
               }
               _loc5_.push(param2);
               _listeners[_loc6_] = _loc5_;
            }
            var_2596[_loc6_] = _loc4_;
            for each(var _loc3_ in _loc4_)
            {
               addToQueue(_loc3_);
            }
            _downloadShiftTimer.start();
         }
         else if(param2 != null && !param2.disposed)
         {
            param2.avatarImageReady(_loc6_);
         }
      }
      
      private function libraryComplete(param1:Event) : void
      {
         var _loc10_:String = null;
         var _loc4_:Array = null;
         var _loc12_:Boolean = false;
         var _loc5_:Array = null;
         var _loc8_:AvatarAssetDownloadLibrary = null;
         var _loc9_:int = 0;
         if(disposed)
         {
            return;
         }
         var _loc11_:* = [];
         for(_loc10_ in var_2596)
         {
            _loc12_ = true;
            _loc4_ = var_2596[_loc10_];
            for each(var _loc3_ in _loc4_)
            {
               if(!_loc3_.isReady)
               {
                  _loc12_ = false;
                  break;
               }
            }
            if(_loc12_)
            {
               _loc11_.push(_loc10_);
               _loc5_ = _listeners[_loc10_];
               for each(var _loc7_ in _loc5_)
               {
                  if(_loc7_ != null && !_loc7_.disposed)
                  {
                     _loc7_.avatarImageReady(_loc10_);
                  }
               }
               delete _listeners[_loc10_];
            }
         }
         for each(_loc10_ in _loc11_)
         {
            delete var_2596[_loc10_];
         }
         var _loc6_:String = (param1.target as AvatarAssetDownloadLibrary).libraryName;
         var _loc2_:int = var_2837.indexOf(_loc6_);
         if(_loc2_ != -1)
         {
            var_2837.splice(_loc2_,1);
            if(false)
            {
               var_437.onMandatoryLibrariesReady();
            }
         }
         _loc9_ = 0;
         while(_loc9_ < var_2497.length)
         {
            if((_loc8_ = var_2497[_loc9_]).libraryName == _loc6_)
            {
               var_2497.splice(_loc9_,1);
            }
            _loc9_++;
         }
         if(_loc11_.length > 0)
         {
            dispatchEvent(new LibraryLoadedEvent("LIBRARY_LOADED",_loc6_));
         }
         _downloadShiftTimer.start();
      }
      
      public function isMissingMandatoryLibs() : Boolean
      {
         return false;
      }
      
      private function getLibsToDownload(param1:class_3182) : Array
      {
         var _loc12_:ISetType = null;
         var _loc7_:int = 0;
         var _loc5_:class_3195 = null;
         var _loc11_:String = null;
         var _loc4_:Array = null;
         var _loc8_:* = [];
         if(!var_1469)
         {
            return _loc8_;
         }
         if(!param1)
         {
            return _loc8_;
         }
         var _loc2_:class_3143 = var_1469.figureData;
         if(!_loc2_)
         {
            return _loc8_;
         }
         var _loc10_:Array = param1.getPartTypeIds();
         for each(var _loc6_ in _loc10_)
         {
            if(_loc12_ = _loc2_.getSetType(_loc6_))
            {
               _loc7_ = param1.getPartSetId(_loc6_);
               if(_loc5_ = _loc12_.getPartSet(_loc7_))
               {
                  for each(var _loc9_ in _loc5_.parts)
                  {
                     _loc11_ = _loc9_.type + ":" + _loc9_.id;
                     if((_loc4_ = var_2847[_loc11_]) != null)
                     {
                        for each(var _loc3_ in _loc4_)
                        {
                           if(_loc3_ != null)
                           {
                              if(!_loc3_.isReady)
                              {
                                 if(_loc8_.indexOf(_loc3_) == -1)
                                 {
                                    _loc8_.push(_loc3_);
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         return _loc8_;
      }
      
      private function processPending() : void
      {
         var _loc1_:AvatarAssetDownloadLibrary = null;
         while(false)
         {
            _loc1_ = var_2537.shift();
            var_2497.push(_loc1_);
            _loc1_.startDownloading();
         }
      }
      
      private function addToQueue(param1:AvatarAssetDownloadLibrary) : void
      {
         if(!param1.isReady && var_2537.indexOf(param1) == -1 && var_2497.indexOf(param1) == -1)
         {
            var_2537.push(param1);
         }
      }
      
      private function onNextDownloadTimeout(param1:Event = null) : void
      {
         processPending();
      }
      
      public function purge() : void
      {
         for each(var _loc1_ in var_1792)
         {
            if(_loc1_.isReady && !_loc1_.isMandatory)
            {
               _loc1_.purge();
            }
         }
      }
   }
}
