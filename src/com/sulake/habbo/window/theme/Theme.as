package com.sulake.habbo.window.theme
{
   import com.sulake.core.window.theme.PropertyMap;
   
   public class Theme
   {
      
      public static const NONE:String = "None";
      
      public static const ICON:String = "Icon";
      
      public static const LEGACY_BORDER:String = "Legacy border";
      
      public static const VOLTER:String = "Volter";
      
      public static const UBUNTU:String = "Ubuntu";
      
      public static const ILLUMINA_LIGHT:String = "Illumina Light";
      
      public static const ILLUMINA_DARK:String = "Illumina Dark";
       
      
      private var _name:String;
      
      private var var_3751:Boolean;
      
      private var var_3248:uint;
      
      private var var_3603:uint;
      
      private var var_3154:PropertyMap;
      
      public function Theme(param1:String, param2:Boolean, param3:uint, param4:uint, param5:PropertyMap)
      {
         super();
         _name = param1;
         var_3751 = param2;
         var_3248 = param3;
         var_3603 = param4;
         var_3154 = param5;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get isReal() : Boolean
      {
         return var_3751;
      }
      
      public function get baseStyle() : uint
      {
         return var_3248;
      }
      
      public function get styleCount() : uint
      {
         return var_3603;
      }
      
      public function get propertyDefaults() : PropertyMap
      {
         return var_3154;
      }
      
      public function coversStyle(param1:uint) : Boolean
      {
         return param1 >= var_3248 && param1 < var_3248 + var_3603;
      }
   }
}
