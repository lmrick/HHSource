package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.window.utils.class_3257;
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements class_3257
   {
      
      public static const SCALE_TYPE_FIXED:uint = 0;
      
      public static const SCALE_TYPE_MOVE:uint = 1;
      
      public static const SCALE_TYPE_STRECH:uint = 2;
      
      public static const SCALE_TYPE_TILED:uint = 4;
      
      public static const SCALE_TYPE_CENTER:uint = 8;
       
      
      private var var_247:uint;
      
      private var _name:String;
      
      public var color:uint;
      
      public var blend:uint;
      
      public var scaleH:uint;
      
      public var scaleV:uint;
      
      public var region:Rectangle;
      
      public var colorize:Boolean;
      
      public function SkinLayoutEntity(param1:uint, param2:String)
      {
         super();
         var_247 = param1;
         _name = param2;
      }
      
      public function get id() : uint
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get tags() : Array
      {
         return null;
      }
      
      public function dispose() : void
      {
         region = null;
      }
   }
}
