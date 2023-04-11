package com.sulake.habbo.avatar.structure
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.class_79;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class AvatarStructureDownload extends EventDispatcherWrapper
   {
      
      public static const STRUCTURE_DONE:String = "AVATAR_STRUCTURE_DONE";
       
      
      private var var_4179:com.sulake.habbo.avatar.structure.IStructureData;
      
      public function AvatarStructureDownload(param1:class_21, param2:String, param3:com.sulake.habbo.avatar.structure.IStructureData)
      {
         super();
         var_4179 = param3;
         if(param1.hasAsset(param2))
         {
            class_14.log("[AvatarStructureDownload] reload data for url: " + param2);
         }
         var _loc4_:URLRequest = new URLRequest(param2);
         var _loc5_:AssetLoaderStruct;
         (_loc5_ = param1.loadAssetFromFile(param2,_loc4_,"text/plain")).addEventListener("AssetLoaderEventComplete",onDataComplete);
         _loc5_.addEventListener("AssetLoaderEventError",onDataFailed);
      }
      
      private function onDataComplete(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc4_:XML = null;
         var _loc3_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc3_ == null || _loc3_.assetLoader == null)
         {
            return;
         }
         try
         {
            _loc2_ = _loc3_.assetLoader.content as String;
            if(_loc2_ == null || _loc2_.length == 0)
            {
               class_79.error("Could not load avatar structure, got empty data from URL " + _loc3_.assetLoader.url + " data length = " + _loc2_.length + ".",false,1);
            }
            _loc4_ = {_loc2_};
         }
         catch(e:Error)
         {
            class_14.log("[AvatarStructureDownload] Error: undefined");
            return;
         }
         if(_loc4_ == null)
         {
            class_14.log("[AvatarStructureDownload] XML error: " + _loc3_ + " not valid XML");
            return;
         }
         var_4179.appendXML(_loc4_);
         dispatchEvent(new Event("AVATAR_STRUCTURE_DONE"));
      }
      
      private function onDataFailed(param1:Event) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:String = "";
         if(_loc2_ != null && _loc2_.assetLoader != null)
         {
            _loc3_ = String(_loc2_.assetLoader.url);
         }
         HabboWebTools.logEventLog("figurepartlist download error " + _loc3_);
         class_79.error("Could not load avatar structure. Failed to get data from URL " + _loc3_,true,1);
      }
   }
}
