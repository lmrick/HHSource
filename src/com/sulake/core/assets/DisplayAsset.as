package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_90:String;
      
      protected var _content:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var _declaration:com.sulake.core.assets.AssetTypeDeclaration;
      
      public function DisplayAsset(param1:com.sulake.core.assets.AssetTypeDeclaration, param2:String = null)
      {
         super();
         _declaration = param1;
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
         return _declaration;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(false)
            {
               if(_content.loaderInfo.loader != null)
               {
                  _content.loaderInfo.loader.unload();
               }
            }
            _content = null;
            _declaration = null;
            _disposed = true;
            var_90 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            _content = param1 as DisplayObject;
            if(_content != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            _content = DisplayAsset(param1)._content;
            _declaration = DisplayAsset(param1)._declaration;
            if(_content == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            _content = DisplayAsset(param1)._content;
            _declaration = DisplayAsset(param1)._declaration;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
