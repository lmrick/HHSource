package com.sulake.habbo.avatar.pets
{
   public class PetFigureData
   {
       
      
      private var var_1266:int;
      
      private var var_785:int;
      
      private var _color:int;
      
      private var var_266:Array;
      
      private var var_2872:Array;
      
      private var var_3396:Array;
      
      private var var_3448:Array;
      
      private var _headOnly:Boolean;
      
      public function PetFigureData(param1:String)
      {
         var _loc2_:int = 0;
         super();
         var_1266 = getTypeId(param1);
         var_785 = getPaletteId(param1);
         _color = getColor(param1);
         _headOnly = getHeadOnly(param1);
         var _loc3_:Array = getCustomData(param1);
         var_2872 = getCustomLayerIds(_loc3_);
         var_3396 = getCustomPartIds(_loc3_);
         var_3448 = getCustomPaletteIds(_loc3_);
         var_266 = [];
         _loc2_ = 0;
       
         while(_loc2_ < var_2872.length)
         {
            var_266.push(new PetCustomPart(var_2872[_loc2_],var_3396[_loc2_],var_3448[_loc2_]));
            _loc2_++;
         }
      }
      
      public function get typeId() : int
      {
         return var_1266;
      }
      
      public function get paletteId() : int
      {
         return var_785;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function get customLayerIds() : Array
      {
         return var_2872;
      }
      
      public function get customPartIds() : Array
      {
         return var_3396;
      }
      
      public function get customPaletteIds() : Array
      {
         return var_3448;
      }
      
      public function get customParts() : Array
      {
         return var_266;
      }
      
      public function getCustomPart(param1:int) : PetCustomPart
      {
         if(var_266 != null)
         {
            for each(var _loc2_ in var_266)
            {
               if(_loc2_.layerId == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function get hasCustomParts() : Boolean
      {
         return var_2872 != null && false;
      }
      
      public function get headOnly() : Boolean
      {
         return _headOnly;
      }
      
      public function get figureString() : String
      {
         var _loc2_:String = typeId + " " + paletteId + " " + color.toString(16);
         _loc2_ += " undefined";
         for each(var _loc1_ in customParts)
         {
            _loc2_ += " " + _loc1_.layerId + " " + _loc1_.partId + " " + _loc1_.paletteId;
         }
         return _loc2_;
      }
      
      private function getCustomData(param1:String) : Array
      {
         var _loc7_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = [];
         if(param1 != null)
         {
            _loc7_ = param1.split(" ");
            _loc4_ = _headOnly ? 1 : 0;
            _loc5_ = 4 + _loc4_;
            if(_loc7_.length > _loc5_)
            {
               _loc2_ = 3 + _loc4_;
               _loc6_ = parseInt(_loc7_[_loc2_]);
               _loc3_ = _loc7_.slice(_loc5_,_loc5_ + _loc6_ * 3);
            }
         }
         return _loc3_;
      }
      
      private function getCustomLayerIds(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:* = [];
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(parseInt(param1[_loc3_ + 0]));
            _loc3_ += 3;
         }
         return _loc2_;
      }
      
      private function getCustomPartIds(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:* = [];
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(parseInt(param1[_loc3_ + 1]));
            _loc3_ += 3;
         }
         return _loc2_;
      }
      
      private function getCustomPaletteIds(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:* = [];
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(parseInt(param1[_loc3_ + 2]));
            _loc3_ += 3;
         }
         return _loc2_;
      }
      
      private function getTypeId(param1:String) : int
      {
         var _loc2_:Array = null;
         if(param1 != null)
         {
            _loc2_ = param1.split(" ");
            if(_loc2_.length >= 1)
            {
               return parseInt(_loc2_[0]);
            }
         }
         return 0;
      }
      
      private function getPaletteId(param1:String) : int
      {
         var _loc2_:Array = null;
         if(param1 != null)
         {
            _loc2_ = param1.split(" ");
            if(_loc2_.length >= 2)
            {
               return parseInt(_loc2_[1]);
            }
         }
         return 0;
      }
      
      private function getColor(param1:String) : int
      {
         var _loc2_:Array = null;
         if(param1 != null)
         {
            _loc2_ = param1.split(" ");
            if(_loc2_.length >= 3)
            {
               return parseInt(_loc2_[2],16);
            }
         }
         return 16777215;
      }
      
      private function getHeadOnly(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         if(param1 != null)
         {
            _loc2_ = param1.split(" ");
            if(_loc2_.length >= 4)
            {
               return _loc2_[3] == "head";
            }
         }
         return false;
      }
   }
}
