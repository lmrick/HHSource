package com.sulake.habbo.navigator.context
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.navigator.HabboNewNavigator;
   import package_142.class_1075;
   import package_18.class_1597;
   import package_18.class_1651;
   
   public class ContextContainer
   {
       
      
      private var _navigator:HabboNewNavigator;
      
      private var var_2884:class_24;
      
      private var var_644:Vector.<class_1597>;
      
      public function ContextContainer(param1:HabboNewNavigator)
      {
         var_644 = new Vector.<class_1597>();
         super();
         _navigator = param1;
      }
      
      public function hasContextFor(param1:String) : Boolean
      {
         if(!var_2884)
         {
            return false;
         }
         return var_2884.hasKey(param1);
      }
      
      public function initialize(param1:class_1075) : void
      {
         var_2884 = new class_24();
         for each(var _loc2_ in param1.topLevelContexts)
         {
            var_2884.add(_loc2_.searchCode,_loc2_.quickLinks);
         }
      }
      
      public function getTopLevelSearches() : Array
      {
         return var_2884.getKeys();
      }
      
      public function get savedSearches() : Vector.<class_1597>
      {
         return var_644;
      }
      
      public function set savedSearches(param1:Vector.<class_1597>) : void
      {
         var_644 = param1;
      }
      
      public function isReady() : Boolean
      {
         return var_2884 != null;
      }
   }
}
