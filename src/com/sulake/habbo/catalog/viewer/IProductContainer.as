package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   
   public interface IProductContainer extends class_13
   {
       
      
      function initProductIcon(param1:IRoomEngine, param2:IStuffData = null) : void;
      
      function activate() : void;
      
      function get products() : Vector.<class_3169>;
      
      function get firstProduct() : class_3169;
      
      function set view(param1:class_3151) : void;
      
      function get view() : class_3151;
      
      function set grid(param1:IItemGrid) : void;
      
      function setClubIconLevel(param1:int) : void;
      
      function get offer() : class_3159;
   }
}
