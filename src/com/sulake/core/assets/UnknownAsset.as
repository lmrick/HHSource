package com.sulake.core.assets
{
   import flash.utils.getQualifiedClassName;
   
   public class UnknownAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _content:Object = null;
      
      private var var_370:com.sulake.core.assets.AssetTypeDeclaration;
      
      private var var_90:String;
      
      public function UnknownAsset(param1:com.sulake.core.assets.AssetTypeDeclaration, param2:String = null)
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
            _content = null;
            var_370 = null;
            var_90 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         _content = param1;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         _content = param1.content as Object;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + ": " + _content;
      }
   }
}
