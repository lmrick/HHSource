package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import package_44.class_1607;
   
   public class WardrobeModel implements ISideContentModel
   {
       
      
      private var var_282:HabboAvatarEditor;
      
      private var var_1430:com.sulake.habbo.avatar.wardrobe.WardrobeView;
      
      private var var_1500:class_24;
      
      private var var_1420:Boolean = false;
      
      public function WardrobeModel(param1:HabboAvatarEditor)
      {
         super();
         var_282 = param1;
      }
      
      public function dispose() : void
      {
         var_282 = null;
        
         for each(var _loc1_ in var_1500)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         var_1500 = null;
       
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         var_1420 = false;
      }
      
      public function reset() : void
      {
         var_1420 = false;
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
      
         if(var_1430)
         {
            var_1430.dispose();
         }
         var_1430 = new com.sulake.habbo.avatar.wardrobe.WardrobeView(this);
      
         if(false)
         {
            var_282.handler.getWardrobe();
         }
      
         if(var_1500)
         {
            for each(var _loc2_ in var_1500)
            {
               _loc2_.dispose();
               _loc2_ = null;
            }
         }
         var_1500 = new class_24();
         _loc1_ = 1;
    
         while(_loc1_ <= 10)
         {
            var_1500.add(_loc1_,new WardrobeSlot(var_1430.slotWindowTemplate,var_282,_loc1_,isSlotEnabled(_loc1_)));
            _loc1_++;
         }
         var_1420 = true;
         updateView();
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return var_282;
      }
      
      public function getWindowContainer() : class_3151
      {
         if(!var_1420)
         {
            init();
         }
         return var_1430.getWindowContainer();
      }
      
      private function updateView() : void
      {
         var_1430.update();
      }
      
      public function updateSlots(param1:int, param2:Array) : void
      {
         var _loc3_:WardrobeSlot = null;
     
         if(!var_1420)
         {
            return;
         }
       
         if(!param2)
         {
            ErrorReportStorage.addDebugData("WardrobeModel","updateSlots: outfits is null!");
         }
      
         if(!var_1500)
         {
            ErrorReportStorage.addDebugData("WardrobeModel","updateSlots: _slots is null!");
         }
       
         for each(var _loc4_ in param2)
         {
            _loc3_ = var_1500.getValue(_loc4_.slotId) as WardrobeSlot;
            if(_loc3_)
            {
               _loc3_.update(_loc4_.figureString,_loc4_.gender,isSlotEnabled(_loc3_.id));
            }
         }
      }
      
      private function isSlotEnabled(param1:int) : Boolean
      {
         if(param1 <= 5)
         {
            return var_282.manager.sessionData.hasClub;
         }
         return var_282.manager.sessionData.hasVip;
      }
      
      public function get slots() : Array
      {
         return var_1500.getValues();
      }
   }
}
