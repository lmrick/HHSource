package com.sulake.core.utils
{
   public class Resources
   {
      
      private static var var_553:com.sulake.core.utils.class_24 = new com.sulake.core.utils.class_24();
       
      
      public function Resources()
      {
         super();
      }
      
      public static function method_20(param1:String) : Object
      {
         return var_553[param1];
      }
      
      public static function assign(param1:String, param2:Object) : Object
      {
         return var_553[param1] = param2;
      }
      
      public static function remove(param1:String) : Object
      {
         return var_553.remove(param1);
      }
   }
}
