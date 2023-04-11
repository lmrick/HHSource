package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.furniture.class_3148;
   
   public class FurniProductContainer extends ProductContainer
   {
       
      
      private var var_1807:class_3148;
      
      public function FurniProductContainer(param1:class_3159, param2:Vector.<class_3169>, param3:HabboCatalog, param4:class_3148)
      {
         super(param1,param2,param3);
         var_1807 = param4;
      }
      
      override public function initProductIcon(param1:IRoomEngine, param2:IStuffData = null) : void
      {
         var _loc3_:class_3266 = null;
         switch(var_1807.type)
         {
            case "s":
               _loc3_ = catalog.roomEngine.getFurnitureIcon(var_1807.id,this);
               break;
            case "i":
               _loc3_ = catalog.roomEngine.getWallItemIcon(var_1807.id,this);
         }
         if(_loc3_)
         {
            setIconImage(_loc3_.data,true);
         }
      }
      
      override public function activate() : void
      {
         super.activate();
         if(true)
         {
            catalog.sendGetProductOffer(var_1807.rentOfferId);
         }
         else
         {
            catalog.sendGetProductOffer(var_1807.purchaseOfferId);
         }
      }
      
      override public function get isLazy() : Boolean
      {
         return true;
      }
   }
}
