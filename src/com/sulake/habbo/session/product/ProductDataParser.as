package com.sulake.habbo.session.product
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.class_79;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class ProductDataParser extends EventDispatcherWrapper
   {
      
      public static const READY:String = "PDP_product_data_ready";
       
      
      private var var_235:Dictionary;
      
      private var var_2704:AssetLibrary;
      
      public function ProductDataParser(param1:String, param2:Dictionary, param3:String = null, param4:String = null)
      {
         super();
         var_235 = param2;
         var_2704 = new AssetLibrary("ProductDataParserAssetLib");
         var _loc5_:AssetLoaderStruct;
         (_loc5_ = var_2704.loadAssetFromFile("productdata",new URLRequest(param1),"text/plain")).addEventListener("AssetLoaderEventComplete",parseProductsData);
         _loc5_.addEventListener("AssetLoaderEventError",productsDataError);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(var_2704)
         {
            var_2704.dispose();
            var_2704 = null;
         }
         var_235 = null;
      }
      
      private function parseProductsData(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:ByteArray = null;
         var _loc4_:AssetLoaderStruct;
         if((_loc4_ = param1.target as AssetLoaderStruct) == null)
         {
            return;
         }
         if(_loc4_.assetLoader == null || _loc4_.assetLoader.content == null)
         {
            return;
         }
         if(_loc4_.assetLoader.content is ByteArray)
         {
            _loc3_ = _loc4_.assetLoader.content as ByteArray;
            _loc3_.position = 0;
            _loc2_ = _loc3_.readUTFBytes(_loc3_.length);
         }
         else
         {
            _loc2_ = _loc4_.assetLoader.content as String;
         }
         if(_loc2_.charAt(0) == "<")
         {
            parseXmlFormat(_loc2_);
         }
         else
         {
            parseLingoFormat(_loc2_);
         }
      }
      
      private function parseXmlFormat(param1:String) : void
      {
         var _loc4_:XML = null;
         var _loc2_:String = null;
         try
         {
            _loc4_ = {param1};
         }
         catch(e:Error)
         {
            class_79.error("XML Product data was malformed: " + param1,true,7);
         }
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:XMLList = _loc4_.product;
         for each(var _loc3_ in _loc5_)
         {
            _loc2_ = _loc3_.@code;
            var_235[_loc2_] = new ProductData(_loc2_,_loc3_.name);
         }
         dispatchEvent(new Event("PDP_product_data_ready"));
      }
      
      private function parseLingoFormat(param1:String) : void
      {
         var _loc5_:Array = null;
         var _loc12_:Array = null;
         var _loc10_:String = null;
         var _loc6_:String = null;
         var _loc2_:ProductData = null;
         var _loc3_:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/gm;
         var _loc4_:RegExp = /\[+?((.)*?)\]/g;
         param1 = param1.replace(/"{1,}/gm,"");
         var _loc9_:Array = param1.split(_loc3_);
         var _loc11_:int = 0;
         for each(var _loc8_ in _loc9_)
         {
            _loc5_ = _loc8_.match(_loc4_);
            for each(var _loc7_ in _loc5_)
            {
               _loc10_ = (_loc12_ = (_loc7_ = (_loc7_ = String(_loc7_.replace(/\[{1,}/gm,""))).replace(/\]{1,}/gm,"")).split(",")).shift();
               _loc6_ = _loc12_.shift();
               _loc2_ = new ProductData(_loc10_,_loc6_);
               var_235[_loc10_] = _loc2_;
            }
            _loc11_++;
         }
         dispatchEvent(new Event("PDP_product_data_ready"));
      }
      
      private function productsDataError(param1:AssetLoaderEvent) : void
      {
         HabboWebTools.logEventLog("productdata download error " + param1.status);
         class_79.error("Could not download productdata",true,7);
      }
   }
}
