package com.sulake.core.assets
{
   import flash.system.System;
   import flash.utils.ByteArray;
   
   public class XmlAsset implements ILazyAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_17:Object;
      
      private var _content:XML;
      
      private var var_370:com.sulake.core.assets.AssetTypeDeclaration;
      
      private var var_90:String;
      
      public function XmlAsset(param1:com.sulake.core.assets.AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_370 = param1;
         var_90 = param2;
      }
      
      public function get url() : String
      {
         return var_90;
      }
      
      public function get content() : Object
      {
         if(!_content)
         {
            prepareLazyContent();
         }
         return _content;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get declaration() : com.sulake.core.assets.AssetTypeDeclaration
      {
         return var_370;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            System.disposeXML(_content);
            _content = null;
            var_17 = null;
            var_370 = null;
            var_90 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         _content = null;
         var_17 = param1;
      }
      
      public function prepareLazyContent() : void
      {
         var _loc1_:ByteArray = null;
         if(var_17 is Class)
         {
            _loc1_ = new (var_17 as Class)() as ByteArray;
            _content = {_loc1_.readUTFBytes(_loc1_.length)};
            return;
         }
         if(var_17 is ByteArray)
         {
            _loc1_ = var_17 as ByteArray;
            _content = {_loc1_.readUTFBytes(_loc1_.length)};
            return;
         }
         if(var_17 is String)
         {
            _content = {var_17 as String};
            return;
         }
         if(var_17 is XML)
         {
            _content = var_17 as XML;
            return;
         }
         if(var_17 is XmlAsset)
         {
            _content = XmlAsset(var_17)._content;
            return;
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is XmlAsset)
         {
            _content = XmlAsset(param1)._content;
            return;
         }
         throw Error("Provided asset is not of type XmlAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function toString() : String
      {
         var _loc1_:String = "XmlAsset";
         _loc1_ += " _url:" + var_90;
         _loc1_ += " _content:" + _content;
         return _loc1_ + (" _unknown:" + var_17);
      }
   }
}
