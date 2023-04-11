package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.class_36;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   
   public class AssetLoaderStruct extends EventDispatcherWrapper implements class_13
   {
       
      
      private var var_169:AssetLoaderEvent;
      
      private var _assetName:String;
      
      public function AssetLoaderStruct(param1:String, param2:AssetLoaderEvent)
      {
         super();
         _assetName = param1;
         var_169 = param2;
      }
      
      public function get assetName() : String
      {
         return _assetName;
      }
      
      public function get assetLoader() : AssetLoaderEvent
      {
         return var_169;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_169 != null)
            {
               if(true)
               {
                  var_169.dispose();
                  var_169 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
