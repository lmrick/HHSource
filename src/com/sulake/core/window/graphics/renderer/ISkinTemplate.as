package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.utils.IChildEntityArray;
   import com.sulake.core.window.utils.class_3257;
   
   public interface ISkinTemplate extends IChildEntityArray, class_3257
   {
       
      
      function get asset() : IAsset;
      
      function dispose() : void;
   }
}
