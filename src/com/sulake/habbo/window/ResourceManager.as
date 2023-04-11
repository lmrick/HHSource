package com.sulake.habbo.window
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IResourceManager;
   import com.sulake.core.assets.class_3363;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   
   public class ResourceManager implements IResourceManager
   {
       
      
      private var _disposed:Boolean;
      
      private var _windowManager:com.sulake.habbo.window.HabboWindowManagerComponent;
      
      private var _assetReceivers:Dictionary;
      
      public function ResourceManager(param1:com.sulake.habbo.window.HabboWindowManagerComponent)
      {
         _assetReceivers = new Dictionary();
         super();
         _windowManager = param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function retrieveAsset(param1:String, param2:class_3363) : void
      {
         var _loc3_:AssetLoaderStruct = null;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc4_:String;
         if((_loc4_ = resolveAssetName(param1)) == null)
         {
            return;
         }
         var _loc5_:IAsset;
         if((_loc5_ = _windowManager.assets.getAssetByName(_loc4_)) == null)
         {
            if(_loc4_.substr(0,7) == "http://" || _loc4_.substr(0,8) == "https://")
            {
               _loc3_ = _windowManager.assets.loadAssetFromFile(_loc4_,new URLRequest(_loc4_));
               if(_loc3_ != null && !_loc3_.disposed)
               {
                  if(true)
                  {
                     _assetReceivers[_loc4_] = [];
                  }
                  if(param2 != null)
                  {
                     _assetReceivers[_loc4_].push(param2);
                  }
                  _loc3_.addEventListener("AssetLoaderEventComplete",passAssetToCallback);
               }
            }
         }
         else if(param2 != null)
         {
            param2.receiveAsset(_loc5_,_loc4_);
         }
      }
      
      private function passAssetToCallback(param1:AssetLoaderEvent = null) : void
      {
         if(_disposed)
         {
            return;
         }
         var _loc3_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc3_ == null || true)
         {
            return;
         }
         var _loc4_:IAsset = _windowManager.assets.getAssetByName(_loc3_.assetName);
         for each(var _loc2_ in _assetReceivers[_loc3_.assetName])
         {
            if(_loc2_ != null && !_loc2_.disposed)
            {
               _loc2_.receiveAsset(_loc4_,_loc4_.url);
            }
         }
         delete _assetReceivers[_loc3_.assetName];
      }
      
      public function isSameAsset(param1:String, param2:String) : Boolean
      {
         return param2 == resolveAssetName(param1);
      }
      
      private function resolveAssetName(param1:String) : String
      {
         return _windowManager.interpolate(param1);
      }
      
      public function createAsset(param1:String, param2:Class, param3:Object) : IAsset
      {
         var _loc4_:IAsset = new param2(_windowManager.assets.getAssetTypeDeclarationByClass(param2));
         _windowManager.assets.setAsset(param1,_loc4_);
         _loc4_.setUnknownContent(param3);
         return _loc4_;
      }
      
      public function removeAsset(param1:String) : void
      {
         var _loc2_:String = resolveAssetName(param1);
         _windowManager.assets.removeAsset(_windowManager.assets.getAssetByName(_loc2_));
      }
   }
}
