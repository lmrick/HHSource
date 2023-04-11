package com.sulake.core.assets
{
   import com.sulake.core.class_79;
   import com.sulake.core.runtime.class_41;
   
   public class LazyAssetProcessor implements class_41
   {
       
      
      private var var_80:Vector.<com.sulake.core.assets.ILazyAsset>;
      
      private var var_86:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      public function LazyAssetProcessor()
      {
         var_80 = new Vector.<com.sulake.core.assets.ILazyAsset>();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            class_79.instance.removeUpdateReceiver(this);
            var_80 = null;
            var_86 = false;
            _disposed = true;
         }
      }
      
      public function push(param1:com.sulake.core.assets.ILazyAsset) : void
      {
         if(param1)
         {
            var_80.push(param1);
            if(!var_86)
            {
               class_79.instance.registerUpdateReceiver(this,2);
               var_86 = true;
            }
         }
      }
      
      public function flush() : void
      {
         for each(var _loc1_ in var_80)
         {
            if(!_loc1_.disposed)
            {
               _loc1_.prepareLazyContent();
            }
         }
         var_80 = new Vector.<com.sulake.core.assets.ILazyAsset>();
         if(var_86)
         {
            class_79.instance.removeUpdateReceiver(this);
            var_86 = false;
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:com.sulake.core.assets.ILazyAsset = var_80.shift();
         if(!_loc2_)
         {
            if(var_86)
            {
               class_79.instance.removeUpdateReceiver(this);
               var_86 = false;
            }
         }
         else if(!_loc2_.disposed)
         {
            _loc2_.prepareLazyContent();
         }
      }
   }
}
