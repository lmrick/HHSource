package com.sulake.habbo.groups.badge
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IResourceManager;
   import com.sulake.core.assets.class_3363;
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.groups.HabboGroupsManager;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import package_5.class_1577;
   import package_5.class_1580;
   
   public class BadgeEditorPartItem implements class_13, class_3363
   {
      
      public static var BASE_PART:int = 0;
      
      public static var LAYER_PART:int = 1;
      
      public static var IMAGE_WIDTH:Number = 39;
      
      public static var IMAGE_HEIGHT:Number = 39;
      
      public static var CELL_WIDTH:Number = 13;
      
      public static var CELL_HEIGHT:Number = 13;
       
      
      private var var_437:HabboGroupsManager;
      
      private var var_1618:com.sulake.habbo.groups.badge.BadgeSelectPartCtrl;
      
      private var var_3434:int;
      
      private var var_271:int;
      
      private var var_3647:String;
      
      private var _disposed:Boolean;
      
      private var _fileName:String;
      
      private var _maskFileName:String;
      
      private var var_973:BitmapData;
      
      private var var_1650:BitmapData;
      
      private var _composite:BitmapData;
      
      private var var_1913:ColorTransform;
      
      private var var_3504:Boolean = false;
      
      private var _isLoaded:Boolean = false;
      
      private var var_3292:Boolean = false;
      
      public function BadgeEditorPartItem(param1:HabboGroupsManager, param2:com.sulake.habbo.groups.badge.BadgeSelectPartCtrl, param3:int, param4:int, param5:class_1577 = null)
      {
         var_1913 = new ColorTransform(1,1,1);
         super();
         var_3434 = param3;
         var_437 = param1;
         var_1618 = param2;
         var_271 = param4;
         var_3647 = var_437.getProperty("image.library.badgepart.url");
         _composite = new BitmapData(IMAGE_WIDTH,IMAGE_HEIGHT);
         if(param5 == null)
         {
            _isLoaded = true;
            var_3292 = true;
            var_973 = var_437.getButtonImage("badge_part_empty");
         }
         else
         {
            _fileName = param5.fileName.replace(".gif","").replace(".png","");
            _maskFileName = param5.maskFileName.replace(".gif","").replace(".png","");
            var_3504 = false;
            _composite = new BitmapData(IMAGE_WIDTH,IMAGE_HEIGHT);
            _fileName = var_3647 + "badgepart_" + _fileName + ".png";
            _maskFileName = var_3647 + "badgepart_" + _maskFileName + ".png";
            var_437.windowManager.resourceManager.retrieveAsset(_fileName,this);
            var_437.windowManager.resourceManager.retrieveAsset(_maskFileName,this);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get partIndex() : int
      {
         return var_3434;
      }
      
      public function receiveAsset(param1:IAsset, param2:String) : void
      {
         var _loc3_:IResourceManager = var_437.windowManager.resourceManager;
         if(_loc3_.isSameAsset(_fileName,param2))
         {
            var_973 = param1.content as BitmapData;
         }
         if(_loc3_.isSameAsset(_maskFileName,param2))
         {
            var_1650 = param1.content as BitmapData;
         }
         checkIsImageLoaded();
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_973)
            {
               var_973.dispose();
               var_973 = null;
            }
            if(var_1650)
            {
               var_1650.dispose();
               var_1650 = null;
            }
            if(_composite)
            {
               _composite.dispose();
               _composite = null;
            }
            _fileName = null;
            _maskFileName = null;
            var_1913 = null;
            var_1618 = null;
            var_437 = null;
            _disposed = true;
         }
      }
      
      private function checkIsImageLoaded() : void
      {
         if(var_973 == null)
         {
            return;
         }
         if(var_3504 && var_1650 == null)
         {
            return;
         }
         _isLoaded = true;
         if(var_271 == BASE_PART)
         {
            var_1618.onBaseImageLoaded(this);
         }
         else
         {
            var_1618.onLayerImageLoaded(this);
         }
      }
      
      public function getComposite(param1:BadgeLayerOptions) : BitmapData
      {
         if(!_isLoaded)
         {
            return null;
         }
         if(var_3292)
         {
            return var_973;
         }
         var _loc2_:class_1580 = var_437.guildEditorData.badgeColors[param1.colorIndex] as class_1580;
         var_1913.redMultiplier = _loc2_.red / 255;
         var_1913.greenMultiplier = _loc2_.green / 255;
         var_1913.blueMultiplier = _loc2_.blue / 255;
         var _loc3_:Point = getPosition(param1);
         _composite.dispose();
         _composite = new BitmapData(IMAGE_WIDTH,IMAGE_HEIGHT,true,0);
         _composite.copyPixels(var_973,var_973.rect,_loc3_);
         _composite.colorTransform(_composite.rect,var_1913);
         if(var_3504)
         {
            _composite.copyPixels(var_1650,var_1650.rect,_loc3_,null,null,true);
         }
         return _composite;
      }
      
      private function getPosition(param1:BadgeLayerOptions) : Point
      {
         var _loc2_:Number = CELL_WIDTH * param1.gridX + CELL_WIDTH / 2 - 0;
         var _loc3_:Number = CELL_HEIGHT * param1.gridY + CELL_HEIGHT / 2 - 0;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(_loc2_ + var_973.width > IMAGE_WIDTH)
         {
            _loc2_ = IMAGE_WIDTH - 0;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ + var_973.height > IMAGE_HEIGHT)
         {
            _loc3_ = IMAGE_HEIGHT - 0;
         }
         return new Point(Math.floor(_loc2_),Math.floor(_loc3_));
      }
   }
}
