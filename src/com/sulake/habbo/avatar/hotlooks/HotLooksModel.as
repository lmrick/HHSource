package com.sulake.habbo.avatar.hotlooks
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.class_3319;
   import com.sulake.habbo.avatar.wardrobe.*;
   import flash.utils.Dictionary;
   import package_108.class_598;
   import package_120.class_1037;
   import package_120.class_1532;
   
   public class HotLooksModel extends CategoryBaseModel implements class_3319
   {
      
      public static const CATEGORY_HOT_LOOKS:String = "hot_looks";
      
      public static const CATEGORY_MY_LOOKS:String = "my_looks";
      
      private static const MAXIMUM_HOT_LOOKS:int = 20;
       
      
      private var var_670:Dictionary;
      
      private var var_2676:class_1037;
      
      public function HotLooksModel(param1:HabboAvatarEditor)
      {
         super(param1);
         var_670 = new Dictionary();
         var_670["M"] = [];
         var_670["F"] = [];
         var_670["M.index"] = 0;
         var_670["F.index"] = 0;
         requestHotLooks(param1);
      }
      
      private function requestHotLooks(param1:HabboAvatarEditor) : void
      {
         var_2676 = new class_1037(onHotLooksMessage);
         param1.manager.communication.addHabboConnectionMessageEvent(var_2676);
         param1.manager.communication.connection.send(new class_598(20));
      }
      
      private function onHotLooksMessage(param1:class_1037) : void
      {
         for each(var _loc2_ in param1.getParser().hotLooks)
         {
            (var_670[_loc2_.gender.toUpperCase()] as Array).push(new Outfit(var_282,_loc2_.figureString,_loc2_.gender));
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(var_2676)
         {
            controller.manager.communication.removeHabboConnectionMessageEvent(var_2676);
            var_2676 = null;
         }
         var_670 = null;
      }
      
      override protected function init() : void
      {
         if(!var_1430)
         {
            var_1430 = new HotLooksView(this);
         }
         var_1430.init();
         var_1420 = true;
      }
      
      public function selectHotLook(param1:int) : void
      {
         var _loc2_:Array = var_670[var_282.gender];
         var _loc3_:Outfit = _loc2_[param1];
         if(_loc3_ != null)
         {
            if(_loc3_.figure == "")
            {
               return;
            }
            var_282.loadAvatarInEditor(_loc3_.figure,_loc3_.gender,var_282.clubMemberLevel);
         }
      }
      
      public function get hotLooks() : Array
      {
         return var_670[var_282.gender];
      }
      
      override public function switchCategory(param1:String = "") : void
      {
      }
      
      override public function getCategoryData(param1:String) : CategoryData
      {
         return null;
      }
      
      override public function selectPart(param1:String, param2:int) : void
      {
      }
   }
}
