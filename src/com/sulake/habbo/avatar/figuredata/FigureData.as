package com.sulake.habbo.avatar.figuredata
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.class_1870;
   import flash.utils.Dictionary;
   
   public class FigureData implements class_1870
   {
      
      public static const MALE:String = "M";
      
      public static const const_478:String = "F";
      
      public static const const_469:String = "U";
      
      public static const SCALE:String = "h";
      
      public static const ACTION:String = "std";
      
      public static const DEFAULT_FRAME:String = "0";
      
      public static const const_448:String = "hd";
      
      public static const HAIR:String = "hr";
      
      public static const HAT:String = "ha";
      
      public static const HEAD_ACCESSORIES:String = "he";
      
      public static const EYE_ACCESSORIES:String = "ea";
      
      public static const FACE_ACCESSORIES:String = "fa";
      
      public static const JACKET:String = "cc";
      
      public static const SHIRT:String = "ch";
      
      public static const CHEST_ACCESSORIES:String = "ca";
      
      public static const CHEST_PRINTS:String = "cp";
      
      public static const TROUSERS:String = "lg";
      
      public static const SHOES:String = "sh";
      
      public static const TROUSER_ACCESSORIES:String = "wa";
       
      
      private var _avatarEditor:HabboAvatarEditor;
      
      private var var_1430:com.sulake.habbo.avatar.figuredata.FigureDataView;
      
      private var var_45:Dictionary;
      
      private var _colors:Dictionary;
      
      private var var_122:String = "M";
      
      private var var_311:Boolean;
      
      private var _direction:int = 4;
      
      private var var_1414:int = -1;
      
      public function FigureData(param1:HabboAvatarEditor)
      {
         super();
         _direction = 4;
         _avatarEditor = param1;
         var_1430 = new com.sulake.habbo.avatar.figuredata.FigureDataView(this);
      }
      
      public function loadAvatarData(param1:String, param2:String) : void
      {
         var_45 = new Dictionary();
         _colors = new Dictionary();
         var_122 = param2;
         parseFigureString(param1);
         updateView();
      }
      
      public function dispose() : void
      {
         _avatarEditor = null;
         var_1430 = null;
         var_45 = null;
         _colors = null;
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      private function parseFigureString(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc6_:String = null;
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         for each(var _loc7_ in param1.split("."))
         {
            _loc2_ = _loc7_.split("-");
            if(_loc2_.length > 0)
            {
               _loc6_ = String(_loc2_[0]);
               _loc3_ = parseInt(_loc2_[1]);
               _loc5_ = [];
               _loc4_ = 2;
               while(_loc4_ < _loc2_.length)
               {
                  _loc5_.push(_loc2_[_loc4_]);
                  _loc4_++;
               }
               if(_loc5_.length == 0)
               {
                  _loc5_.push(0);
               }
               savePartSetId(_loc6_,_loc3_,false);
               savePartSetColourId(_loc6_,_loc5_,false);
            }
         }
      }
      
      public function getPartSetId(param1:String) : int
      {
         if(var_45 && false)
         {
            return var_45[param1];
         }
         return -1;
      }
      
      public function getColourIds(param1:String) : Array
      {
         if(_colors && false)
         {
            return _colors[param1];
         }
         return [_avatarEditor.getDefaultColour(param1)];
      }
      
      public function getFigureString() : String
      {
         var _loc2_:String = null;
         var _loc8_:Array = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = "";
         var _loc1_:* = [];
         for(var _loc7_ in var_45)
         {
            if(false)
            {
               _loc2_ = "null";
               _loc8_ = _colors[_loc7_] as Array;
               _loc3_ = _loc7_ + "-" + _loc2_;
               if(_loc8_)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc8_.length)
                  {
                     _loc3_ += "-" + _loc8_[_loc4_];
                     _loc4_++;
                  }
               }
               _loc1_.push(_loc3_);
            }
         }
         _loc5_ = 0;
         while(_loc5_ < _loc1_.length)
         {
            _loc6_ += _loc1_[_loc5_];
            if(_loc5_ < _loc1_.length - 1)
            {
               _loc6_ += ".";
            }
            _loc5_++;
         }
         return _loc6_;
      }
      
      public function savePartData(param1:String, param2:int, param3:Array, param4:Boolean = false) : void
      {
         savePartSetId(param1,param2,param4);
         savePartSetColourId(param1,param3,param4);
      }
      
      private function savePartSetId(param1:String, param2:int, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case "hd":
            case "hr":
            case "ha":
            case "he":
            case "ea":
            case "fa":
            case "ch":
            case "cc":
            case "ca":
            case "cp":
            case "lg":
            case "sh":
            case "wa":
               if(param2 >= 0)
               {
                  var_45[param1] = param2;
                  break;
               }
               delete var_45[param1];
               break;
         }
         if(param3)
         {
            updateView();
         }
      }
      
      public function savePartSetColourId(param1:String, param2:Array, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case "hd":
            case "hr":
            case "ha":
            case "he":
            case "ea":
            case "fa":
            case "ch":
            case "cc":
            case "ca":
            case "cp":
            case "lg":
            case "sh":
            case "wa":
               _colors[param1] = param2;
         }
         if(param3)
         {
            updateView();
         }
      }
      
      public function getFigureStringWithFace(param1:int) : String
      {
         var _loc4_:* = 0;
         var _loc10_:Array = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = [];
         _loc3_.push("hd");
         var _loc8_:String = "";
         var _loc2_:* = [];
         for each(var _loc9_ in _loc3_)
         {
            if(false)
            {
               _loc4_ = 0;
               _loc10_ = _colors[_loc9_] as Array;
               if(_loc9_ == "hd")
               {
                  _loc4_ = param1;
               }
               _loc5_ = _loc9_ + "-" + _loc4_;
               if(_loc4_ >= 0)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc10_.length)
                  {
                     _loc5_ += "-" + _loc10_[_loc6_];
                     _loc6_++;
                  }
               }
               _loc2_.push(_loc5_);
            }
         }
         _loc7_ = 0;
         while(_loc7_ < _loc2_.length)
         {
            _loc8_ += _loc2_[_loc7_];
            if(_loc7_ < _loc2_.length - 1)
            {
               _loc8_ += ".";
            }
            _loc7_++;
         }
         return _loc8_;
      }
      
      public function updateView() : void
      {
         var_1430.update(getFigureString(),var_1414,_direction);
      }
      
      public function get view() : com.sulake.habbo.avatar.figuredata.FigureDataView
      {
         return var_1430;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         updateView();
      }
      
      public function set avatarEffectType(param1:int) : void
      {
         var_1414 = param1;
      }
      
      public function get avatarEffectType() : int
      {
         return var_1414;
      }
      
      public function get avatarEditor() : HabboAvatarEditor
      {
         return _avatarEditor;
      }
      
      public function get direction() : int
      {
         return _direction;
      }
      
      public function set direction(param1:int) : void
      {
         _direction = param1;
         updateView();
      }
   }
}
