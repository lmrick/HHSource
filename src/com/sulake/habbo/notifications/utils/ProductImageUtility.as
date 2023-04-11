package com.sulake.habbo.notifications.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.class_20;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import flash.display.BitmapData;
   
   public class ProductImageUtility implements class_3158
   {
       
      
      private var _roomEngine:IRoomEngine;
      
      private var _inventory:class_1697;
      
      public function ProductImageUtility(param1:IRoomEngine, param2:class_1697)
      {
         super();
         _roomEngine = param1;
         _inventory = param2;
      }
      
      public function dispose() : void
      {
         _roomEngine = null;
         _inventory = null;
      }
      
      public function getProductImage(param1:String, param2:int, param3:String) : BitmapData
      {
         var _loc7_:BitmapDataAsset = null;
         var _loc4_:* = null;
         var _loc6_:BitmapData = null;
         var _loc5_:int = 0;
         switch(param1)
         {
            case "s":
               _loc4_ = _roomEngine.getFurnitureIcon(param2,this);
               break;
            case "i":
               if((_loc5_ = tempCategoryMapping("I",param2)) == 1)
               {
                  _loc4_ = _roomEngine.getWallItemIcon(param2,this,param3);
                  break;
               }
               switch(_loc5_ - 2)
               {
                  case 0:
                     if((_loc7_ = (_inventory as class_20).assets.getAssetByName("icon_wallpaper_png") as BitmapDataAsset) != null)
                     {
                        _loc6_ = (_loc7_.content as BitmapData).clone();
                        break;
                     }
                     break;
                  case 1:
                     if((_loc7_ = (_inventory as class_20).assets.getAssetByName("icon_floor_png") as BitmapDataAsset) != null)
                     {
                        _loc6_ = (_loc7_.content as BitmapData).clone();
                        break;
                     }
                     break;
                  case 2:
                     if((_loc7_ = (_inventory as class_20).assets.getAssetByName("icon_landscape_png") as BitmapDataAsset) != null)
                     {
                        _loc6_ = (_loc7_.content as BitmapData).clone();
                        break;
                     }
               }
               _loc4_ = null;
               break;
            case "e":
               if((_loc7_ = (_inventory as class_20).assets.getAssetByName("fx_icon_" + param2 + "_png") as BitmapDataAsset) != null)
               {
                  _loc6_ = (_loc7_.content as BitmapData).clone();
                  break;
               }
               break;
            default:
               class_14.log("[HabboNotifications] Can not yet handle this type of product: ");
         }
         if(_loc4_ != null)
         {
            _loc6_ = _loc4_.data;
         }
         return _loc6_;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function tempCategoryMapping(param1:String, param2:int) : int
      {
         if(param1 == "S")
         {
            return 1;
         }
         if(param1 == "I")
         {
            if(param2 == 3001)
            {
               return 2;
            }
            if(param2 == 3002)
            {
               return 3;
            }
            if(param2 == 4057)
            {
               return 4;
            }
            return 1;
         }
         return 1;
      }
   }
}
