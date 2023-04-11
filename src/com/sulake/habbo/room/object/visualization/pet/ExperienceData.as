package com.sulake.habbo.room.object.visualization.pet
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class ExperienceData
   {
       
      
      private var var_1492:BitmapData;
      
      private var var_4233:Boolean;
      
      private var var_2491:BitmapData;
      
      private var _amount:int = -1;
      
      private var _alpha:int;
      
      public function ExperienceData(param1:BitmapData, param2:Boolean = true)
      {
         super();
         var_1492 = param1;
         var_4233 = param2;
         if(var_1492 != null)
         {
            var_2491 = var_1492.clone();
         }
         setExperience(0);
      }
      
      public function dispose() : void
      {
         if(var_2491)
         {
            var_2491.dispose();
            var_2491 = null;
         }
         if(var_1492 != null)
         {
            if(var_4233)
            {
               var_1492.dispose();
            }
            var_1492 = null;
         }
      }
      
      public function get alpha() : int
      {
         return _alpha;
      }
      
      public function set alpha(param1:int) : void
      {
         _alpha = param1;
      }
      
      public function get image() : BitmapData
      {
         return var_1492;
      }
      
      public function setExperience(param1:int) : void
      {
         if(_amount == param1 || var_1492 == null)
         {
            return;
         }
         var_1492.copyPixels(var_2491,var_2491.rect,new Point(0,0));
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.font = "Volter";
         _loc2_.color = 16777215;
         _loc2_.size = 9;
         var _loc3_:TextField = new TextField();
         _loc3_.embedFonts = true;
         _loc3_.width = 30;
         _loc3_.height = 12;
         _loc3_.background = true;
         _loc3_.backgroundColor = 3871388928;
         _loc3_.defaultTextFormat = _loc2_;
         _loc3_.text = "+" + param1;
         var _loc4_:Matrix;
         (_loc4_ = new Matrix()).translate(15,19);
         var_1492.draw(_loc3_,_loc4_);
      }
   }
}
