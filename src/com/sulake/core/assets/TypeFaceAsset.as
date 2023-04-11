package com.sulake.core.assets
{
   import com.sulake.core.utils.class_278;
   import flash.text.Font;
   
   public class TypeFaceAsset implements IAsset
   {
       
      
      protected var var_370:com.sulake.core.assets.AssetTypeDeclaration;
      
      protected var _content:Font;
      
      protected var _disposed:Boolean = false;
      
      public function TypeFaceAsset(param1:com.sulake.core.assets.AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_370 = param1;
      }
      
      public function get url() : String
      {
         return null;
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
            var_370 = null;
            _content = null;
            _disposed = true;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         try
         {
            if(param1 is Class)
            {
               _content = Font(class_278.registerFont(param1 as Class));
            }
         }
         catch(e:Error)
         {
            throw new Error("Failed to register font from resource: " + param1);
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is TypeFaceAsset)
         {
            _content = TypeFaceAsset(param1)._content;
            return;
         }
         throw new Error("Provided asset should be of type FontAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
