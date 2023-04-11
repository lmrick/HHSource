package com.sulake.habbo.inventory.items
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.object.data.class_1609;
   import flash.display.BitmapData;
   
   public class CreditTradingItem extends GroupItem
   {
      
      private static const THUMB_WINDOW_LAYOUT:String = "inventory_thumb_credits_xml";
       
      
      private var var_3895:int;
      
      private var _assets:class_21;
      
      public function CreditTradingItem(param1:FurniModel, param2:class_21, param3:IRoomEngine, param4:int)
      {
         var _loc5_:BitmapData = null;
         var_3895 = param4;
         _assets = param2;
         _loc5_ = getItemIcon();
         super(param1,type,category,param3,new class_1609(),extra,_loc5_,false,"center");
      }
      
      override public function dispose() : void
      {
         _assets = null;
         super.dispose();
      }
      
      public function getItemIcon() : BitmapData
      {
         if(!_assets)
         {
            return null;
         }
         var _loc1_:IAsset = _assets.getAssetByName("inventory_furni_icon_credits");
         return _loc1_ != null ? (_loc1_.content as BitmapData).clone() : null;
      }
      
      public function getItemTooltipText() : String
      {
         return "${purse_coins}";
      }
      
      public function getTotalCreditValue() : int
      {
         return var_3895;
      }
      
      override public function get isGroupable() : Boolean
      {
         return true;
      }
      
      override public function getTotalCount() : int
      {
         return getTotalCreditValue();
      }
      
      override public function getUnlockedCount() : int
      {
         return getTotalCreditValue();
      }
      
      override protected function createWindow() : void
      {
         _window = var_1443.createItemWindow("inventory_thumb_credits_xml");
      }
      
      override public function getMinimumItemsToShowCounter() : int
      {
         return 1;
      }
   }
}
