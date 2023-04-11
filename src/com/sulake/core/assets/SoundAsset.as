package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _content:Sound = null;
      
      private var var_370:com.sulake.core.assets.AssetTypeDeclaration;
      
      private var var_90:String;
      
      public function SoundAsset(param1:com.sulake.core.assets.AssetTypeDeclaration, param2:String = null)
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
         return _content as Object;
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
         if(param1 is Sound)
         {
            if(_content)
            {
               _content.close();
            }
            _content = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(_content)
            {
               _content.close();
            }
            _content = new (param1 as Class)() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(_content)
            {
               _content.close();
            }
            _content = SoundAsset(param1)._content;
            return;
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            _content = SoundAsset(param1)._content;
         }
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
