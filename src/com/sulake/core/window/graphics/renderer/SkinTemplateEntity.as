package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinTemplateEntity implements ISkinTemplateEntity
   {
       
      
      protected var var_247:uint;
      
      protected var _name:String;
      
      protected var var_271:String;
      
      protected var var_2895:Rectangle;
      
      public function SkinTemplateEntity(param1:String, param2:String, param3:uint, param4:Rectangle)
      {
         super();
         var_247 = param3;
         _name = param1;
         var_271 = param2;
         var_2895 = param4;
      }
      
      public function get id() : uint
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get region() : Rectangle
      {
         return var_2895;
      }
   }
}
