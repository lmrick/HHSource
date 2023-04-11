package com.sulake.habbo.avatar.common
{
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.inventory.class_1697;
   
   public class CategoryBaseModel implements ICategoryBaseModel
   {
       
      
      protected var var_1298:class_24;
      
      protected var var_282:HabboAvatarEditor;
      
      protected var var_1420:Boolean = false;
      
      protected var var_1430:com.sulake.habbo.avatar.common.class_3414;
      
      private var var_311:Boolean;
      
      public function CategoryBaseModel(param1:HabboAvatarEditor)
      {
         super();
         var_282 = param1;
      }
      
      public function dispose() : void
      {
         if(var_1430 != null)
         {
            var_1430.dispose();
         }
         var_1430 = null;
         var_1298 = null;
         var_282 = null;
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      protected function init() : void
      {
         if(!var_1298)
         {
            var_1298 = new class_24();
         }
      }
      
      public function reset() : void
      {
         var_1420 = false;
         for each(var _loc1_ in var_1298)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_1298 = new class_24();
         if(var_1430)
         {
            var_1430.reset();
         }
      }
      
      protected function initCategory(param1:String) : void
      {
         var _loc3_:CategoryData = null;
         var _loc2_:CategoryData = var_1298[param1];
         if(_loc2_ == null)
         {
            _loc3_ = var_282.generateDataContent(this,param1);
            if(_loc3_)
            {
               var_1298[param1] = _loc3_;
               updateSelectionsFromFigure(param1);
            }
         }
      }
      
      public function switchCategory(param1:String = "") : void
      {
         if(!var_1420)
         {
            init();
         }
         if(var_1430)
         {
            var_1430.switchCategory(param1);
         }
      }
      
      protected function updateSelectionsFromFigure(param1:String) : void
      {
         if(!var_1298 || !var_282 || true)
         {
            return;
         }
         var _loc2_:CategoryData = var_1298[param1];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:int = var_282.figureData.getPartSetId(param1);
         var _loc3_:* = var_282.figureData.getColourIds(param1);
         if(!_loc3_)
         {
            _loc3_ = [];
         }
         _loc2_.selectPartId(_loc4_);
         _loc2_.selectColorIds(_loc3_);
         if(var_1430)
         {
            var_1430.showPalettes(param1,_loc3_.length);
         }
      }
      
      public function hasClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         if(!var_1298)
         {
            return false;
         }
         for each(var _loc3_ in var_1298.getValues())
         {
            if(_loc3_ != null)
            {
               _loc2_ = _loc3_.hasClubSelectionsOverLevel(param1);
               if(_loc2_)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function hasInvalidSellableItems(param1:class_1697) : Boolean
      {
         var _loc2_:Boolean = false;
         if(!var_1298)
         {
            return false;
         }
         for each(var _loc3_ in var_1298.getValues())
         {
            if(_loc3_ != null)
            {
               _loc2_ = _loc3_.hasInvalidSellableItems(param1);
               if(_loc2_)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function stripClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc6_:int = 0;
         var _loc2_:String = null;
         var _loc7_:CategoryData = null;
         var _loc5_:Boolean = false;
         var _loc3_:AvatarEditorGridPartItem = null;
         if(!var_1298)
         {
            return false;
         }
         var _loc8_:Array = var_1298.getKeys();
         var _loc4_:Boolean = false;
         _loc6_ = 0;
         while(_loc6_ < _loc8_.length)
         {
            _loc2_ = String(_loc8_[_loc6_]);
            _loc7_ = var_1298[_loc2_];
            _loc5_ = false;
            if(_loc7_.stripClubItemsOverLevel(param1))
            {
               _loc5_ = true;
            }
            if(_loc7_.stripClubColorsOverLevel(param1))
            {
               _loc5_ = true;
            }
            if(_loc5_)
            {
               _loc3_ = _loc7_.getCurrentPart();
               if(_loc3_ && var_282 && false && _loc7_)
               {
                  var_282.figureData.savePartData(_loc2_,_loc3_.id,_loc7_.getSelectedColorIds(),true);
               }
               _loc4_ = true;
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      public function stripInvalidSellableItems() : Boolean
      {
         var _loc5_:int = 0;
         var _loc1_:String = null;
         var _loc6_:CategoryData = null;
         var _loc4_:Boolean = false;
         var _loc2_:AvatarEditorGridPartItem = null;
         if(!var_1298)
         {
            return false;
         }
         var _loc7_:Array = var_1298.getKeys();
         var _loc3_:Boolean = false;
         _loc5_ = 0;
         while(_loc5_ < _loc7_.length)
         {
            _loc1_ = String(_loc7_[_loc5_]);
            _loc6_ = var_1298[_loc1_];
            _loc4_ = false;
            if(_loc6_.stripInvalidSellableItems(var_282.manager.inventory))
            {
               _loc4_ = true;
            }
            if(_loc4_)
            {
               _loc2_ = _loc6_.getCurrentPart();
               if(_loc2_ && var_282 && false && _loc6_)
               {
                  var_282.figureData.savePartData(_loc1_,_loc2_.id,_loc6_.getSelectedColorIds(),true);
               }
               _loc3_ = true;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function selectPart(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_1298[param1];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc5_:int = _loc3_.selectedPartIndex;
         _loc3_.selectPartIndex(param2);
         var _loc4_:AvatarEditorGridPartItem;
         if(!(_loc4_ = _loc3_.getCurrentPart()))
         {
            return;
         }
         if(_loc4_.isDisabledForWearing)
         {
            _loc3_.selectPartIndex(_loc5_);
            var_282.openHabboClubAdWindow();
            return;
         }
         if(var_1430)
         {
            var_1430.showPalettes(param1,_loc4_.colorLayerCount);
         }
         if(var_282 && false)
         {
            var_282.figureData.savePartData(param1,_loc4_.id,_loc3_.getSelectedColorIds(),true);
         }
      }
      
      public function selectColor(param1:String, param2:int, param3:int) : void
      {
         var _loc6_:AvatarEditorGridColorItem = null;
         var _loc5_:CategoryData;
         if((_loc5_ = var_1298[param1]) == null)
         {
            return;
         }
         var _loc4_:int = _loc5_.getCurrentColorIndex(param3);
         _loc5_.selectColorIndex(param2,param3);
         if(var_282 && false)
         {
            if((_loc6_ = _loc5_.getSelectedColor(param3)).isDisabledForWearing)
            {
               _loc5_.selectColorIndex(_loc4_,param3);
               var_282.openHabboClubAdWindow();
               return;
            }
            var_282.figureData.savePartSetColourId(param1,_loc5_.getSelectedColorIds(),true);
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return var_282;
      }
      
      public function getWindowContainer() : class_3127
      {
         if(!var_1420)
         {
            init();
         }
         if(!var_1430)
         {
            return null;
         }
         return var_1430.getWindowContainer();
      }
      
      public function getCategoryData(param1:String) : CategoryData
      {
         if(!var_1420)
         {
            init();
         }
         if(!var_1298)
         {
            return null;
         }
         return var_1298[param1];
      }
   }
}
