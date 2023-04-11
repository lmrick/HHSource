package com.sulake.core.window.iterators
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ItemListController;
   import com.sulake.core.window.utils.IIterator;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public class ItemListIterator extends Proxy implements IIterator
   {
       
      
      private var var_1835:ItemListController;
      
      public function ItemListIterator(param1:ItemListController)
      {
         super();
         var_1835 = param1;
      }
      
      public function get length() : uint
      {
         return var_1835.numListItems;
      }
      
      public function indexOf(param1:*) : int
      {
         return var_1835.getListItemIndex(param1);
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         return var_1835.getListItemAt(param1);
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         var _loc3_:class_3127 = null;
         _loc3_ = param2 as class_3127;
         var _loc4_:int;
         if((_loc4_ = var_1835.getListItemIndex(_loc3_)) == param1)
         {
            return;
         }
         if(_loc4_ > -1)
         {
            var_1835.removeListItem(_loc3_);
         }
         var_1835.addListItemAt(_loc3_,param1);
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         return param1 < var_1835.numListItems ? param1 + 1 : 0;
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return var_1835.getListItemAt(uint(param1) - 1);
      }
   }
}
