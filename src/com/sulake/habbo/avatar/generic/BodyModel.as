package com.sulake.habbo.avatar.generic
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.class_3319;
   
   public class BodyModel extends CategoryBaseModel implements class_3319, class_1870
   {
       
      
      public function BodyModel(param1:HabboAvatarEditor)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         initCategory("hd");
         var_1420 = true;
         if(!var_1430)
         {
            var_1430 = new BodyView(this);
            if(var_1430)
            {
               var_1430.init();
            }
         }
      }
      
      override public function switchCategory(param1:String = "") : void
      {
         var_1430.switchCategory(param1);
      }
      
      override public function selectColor(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:CategoryData;
         if((_loc4_ = var_1298[param1]) == null)
         {
            return;
         }
         _loc4_.selectColorIndex(param2,param3);
         var _loc5_:AvatarEditorGridColorItem;
         if((_loc5_ = _loc4_.getSelectedColor(param3)).isDisabledForWearing)
         {
            var_282.openHabboClubAdWindow();
            return;
         }
         var_282.figureData.savePartSetColourId(param1,_loc4_.getSelectedColorIds(),true);
         updateSelectionsFromFigure("hd");
      }
      
      override protected function updateSelectionsFromFigure(param1:String) : void
      {
         var _loc2_:CategoryData = getFaceCategoryData();
         if(!_loc2_)
         {
            return;
         }
         updateIconImage(_loc2_);
      }
      
      private function getFaceCategoryData() : CategoryData
      {
         if(!var_1298)
         {
            return null;
         }
         var _loc1_:CategoryData = var_1298["hd"];
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc3_:int = var_282.figureData.getPartSetId("hd");
         var _loc2_:Array = var_282.figureData.getColourIds("hd");
         _loc1_.selectPartId(_loc3_);
         _loc1_.selectColorIds(_loc2_);
         return _loc1_;
      }
      
      private function updateIconImage(param1:CategoryData, param2:String = null) : void
      {
         var _loc5_:String = null;
         var _loc4_:class_3156 = null;
         for each(var _loc3_ in param1.parts)
         {
            if(_loc3_.partSet)
            {
               _loc5_ = var_282.figureData.getFigureStringWithFace(_loc3_.id);
               if(param2 == null || param2 == _loc5_)
               {
                  _loc4_ = var_282.manager.avatarRenderManager.createAvatarImage(_loc5_,"h",null,this);
                  _loc3_.iconImage = _loc4_.getCroppedImage("head");
                  _loc4_.dispose();
               }
            }
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:CategoryData = getFaceCategoryData();
         if(!_loc2_)
         {
            return;
         }
         updateIconImage(_loc2_,param1);
      }
   }
}
