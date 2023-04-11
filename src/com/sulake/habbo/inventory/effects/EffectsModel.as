package com.sulake.habbo.inventory.effects
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.class_3141;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import package_48.class_202;
   import package_48.class_947;
   
   public class EffectsModel implements IInventoryModel
   {
      
      public static const FILTER_NONE:int = -1;
      
      public static const FILTER_INCLUDE_INACTIVE:int = 0;
      
      public static const FILTER_INCLUDE_ACTIVE:int = 1;
       
      
      private var var_282:HabboInventory;
      
      private var var_1430:com.sulake.habbo.inventory.effects.EffectsView;
      
      private var var_274:Array;
      
      private var _assets:class_21;
      
      private var _communication:class_25;
      
      private var var_2955:com.sulake.habbo.inventory.effects.EffectListProxy;
      
      private var var_2919:com.sulake.habbo.inventory.effects.EffectListProxy;
      
      private var _disposed:Boolean = false;
      
      private var var_2074:int = -1;
      
      public function EffectsModel(param1:HabboInventory, param2:class_1684, param3:class_25, param4:class_21, param5:class_18)
      {
         super();
         var_282 = param1;
         var_274 = [];
         _assets = param4;
         _communication = param3;
         var_2955 = new com.sulake.habbo.inventory.effects.EffectListProxy(this,1);
         var_2919 = new com.sulake.habbo.inventory.effects.EffectListProxy(this,0);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get lastActivatedEffect() : int
      {
         return var_2074;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_282 = null;
            if(var_1430 != null)
            {
               var_1430.dispose();
            }
            if(var_2955 != null)
            {
               var_2955.dispose();
               var_2955 = null;
            }
            if(var_2919 != null)
            {
               var_2919.dispose();
               var_2919 = null;
            }
            _disposed = true;
         }
      }
      
      public function requestInitialization() : void
      {
      }
      
      public function categorySwitch(param1:String) : void
      {
      }
      
      public function addEffect(param1:Effect, param2:Boolean = true) : void
      {
         var _loc4_:BitmapDataAsset = null;
         var _loc3_:Effect = getEffect(param1.type);
         if(_loc3_ != null)
         {
            _loc3_.amountInInventory++;
         }
         else
         {
            if((_loc4_ = BitmapDataAsset(_assets.getAssetByName("fx_icon_" + param1.type + "_png"))) != null)
            {
               param1.iconImage = BitmapData(_loc4_.content);
            }
            var_274.push(param1);
         }
         if(param2)
         {
            refreshViews();
         }
      }
      
      private function getEffect(param1:int) : Effect
      {
         var _loc3_:int = 0;
         var _loc2_:Effect = null;
         _loc3_ = 0;
         while(_loc3_ < var_274.length)
         {
            _loc2_ = var_274[_loc3_];
            if(_loc2_.type == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function removeEffect(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Effect = null;
         _loc3_ = 0;
         while(_loc3_ < var_274.length)
         {
            _loc2_ = var_274[_loc3_];
            if(_loc2_.type == param1)
            {
               var_274.splice(_loc3_,1);
               refreshViews();
               return;
            }
            _loc3_++;
         }
      }
      
      public function refreshViews() : void
      {
         if(var_1430)
         {
            var_1430.updateListViews();
            var_1430.updateActionView();
         }
      }
      
      public function requestEffectActivated(param1:int) : void
      {
         var_282.communication.connection.send(new class_202(param1));
      }
      
      public function setEffectActivated(param1:int) : void
      {
         var _loc2_:Effect = getEffect(param1);
         if(_loc2_ != null)
         {
            stopUsingAllEffects(false,false);
            _loc2_.isActive = true;
            _loc2_.isInUse = true;
            refreshViews();
         }
      }
      
      public function useEffect(param1:int) : void
      {
         stopUsingAllEffects(false,false,true);
         var _loc2_:Effect = getEffect(param1);
         if(_loc2_ == null)
         {
            return;
         }
         if(!_loc2_.isActive)
         {
            requestEffectActivated(_loc2_.type);
         }
         if(_loc2_.isInUse == false)
         {
            _loc2_.isInUse = true;
            var_282.communication.connection.send(new class_947(param1));
            var_2074 = param1;
            refreshViews();
         }
      }
      
      public function stopUsingEffect(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:Effect = getEffect(param1);
         if(_loc3_ != null)
         {
            if(_loc3_.isInUse == true)
            {
               _loc3_.isInUse = false;
               if(param2)
               {
                  var_282.communication.connection.send(new class_947(-1));
                  var_2074 = -1;
               }
               refreshViews();
            }
         }
      }
      
      public function stopUsingAllEffects(param1:Boolean = true, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc4_:Effect = null;
         _loc5_ = 0;
         while(_loc5_ < var_274.length)
         {
            (_loc4_ = var_274[_loc5_]).isInUse = false;
            _loc5_++;
         }
         if(param1)
         {
            var_282.communication.connection.send(new class_947(-1));
         }
         if(param2)
         {
            refreshViews();
         }
         if(param3)
         {
            var_2074 = -1;
         }
      }
      
      public function toggleEffectSelected(param1:int) : void
      {
         var _loc2_:Effect = getEffect(param1);
         if(_loc2_ != null)
         {
            if(_loc2_.isSelected)
            {
               setEffectDeselected(param1);
            }
            else
            {
               setEffectSelected(param1);
            }
            refreshViews();
         }
      }
      
      public function getEffectInterface(param1:int) : class_3141
      {
         return getEffect(param1) as class_3141;
      }
      
      public function setEffectSelected(param1:int) : void
      {
         var _loc2_:Effect = getEffect(param1);
         if(_loc2_ != null)
         {
            setAllEffectsDeselected(false);
            _loc2_.isSelected = true;
            refreshViews();
         }
      }
      
      public function setEffectDeselected(param1:int) : void
      {
         var _loc2_:Effect = getEffect(param1);
         if(_loc2_ != null)
         {
            _loc2_.isSelected = false;
            refreshViews();
         }
      }
      
      private function setAllEffectsDeselected(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Effect = null;
         _loc3_ = 0;
         while(_loc3_ < var_274.length)
         {
            _loc2_ = var_274[_loc3_];
            _loc2_.isSelected = false;
            _loc3_++;
         }
         if(param1)
         {
            refreshViews();
         }
      }
      
      public function getSelectedEffect(param1:int = -1) : Effect
      {
         var _loc4_:int = 0;
         var _loc3_:Effect = null;
         var _loc2_:Array = getEffects(param1);
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc4_];
            if(_loc3_.isSelected)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getEffects(param1:int = -1) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:Effect = null;
         var _loc2_:* = [];
         _loc4_ = 0;
         while(_loc4_ < var_274.length)
         {
            _loc3_ = var_274[_loc4_];
            if(_loc3_.isActive && param1 == 1 || !_loc3_.isActive && param1 == 0 || param1 == -1)
            {
               _loc2_.push(_loc3_);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function setEffectExpired(param1:int) : void
      {
         var_2074 = -1;
         var _loc2_:Effect = getEffect(param1);
         if(_loc2_ != null)
         {
            if(_loc2_.amountInInventory > 1)
            {
               _loc2_.setOneEffectExpired();
               refreshViews();
            }
            else
            {
               removeEffect(_loc2_.type);
            }
         }
      }
      
      public function getItemInIndex(param1:int, param2:int = -1) : Effect
      {
         var _loc3_:Array = getEffects(param2);
         if(param1 < 0 || param1 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param1];
      }
      
      public function getWindowContainer() : class_3151
      {
         return !!var_1430 ? var_1430.getWindowContainer() : null;
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function reactivateLastEffect() : void
      {
         if(var_2074 != -1)
         {
            useEffect(var_2074);
         }
      }
      
      public function updateView() : void
      {
         if(var_1430)
         {
            var_1430.updateListViews();
            var_1430.updateActionView();
         }
      }
      
      public function selectItemById(param1:String) : void
      {
         setEffectSelected(int(param1));
      }
   }
}
