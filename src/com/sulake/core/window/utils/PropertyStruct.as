package com.sulake.core.window.utils
{
   import com.sulake.core.utils.class_24;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_481:String = "hex";
      
      public static const INT:String = "int";
      
      public static const const_486:String = "uint";
      
      public static const NUMBER:String = "Number";
      
      public static const BOOLEAN:String = "Boolean";
      
      public static const STRING:String = "String";
      
      public static const const_488:String = "Point";
      
      public static const RECTANGLE:String = "Rectangle";
      
      public static const ARRAY:String = "Array";
      
      public static const MAP:String = "Map";
       
      
      private var _key:String;
      
      private var var_195:Object;
      
      private var var_271:String;
      
      private var var_3366:Boolean;
      
      private var var_4263:Boolean;
      
      private var var_3020:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean = false, param5:Array = null)
      {
         super();
         _key = param1;
         var_195 = param2;
         var_271 = param3;
         var_3366 = param4;
         var_4263 = param3 == "Map" || param3 == "Array" || param3 == "Point" || param3 == "Rectangle";
         var_3020 = param5;
      }
      
      public function get key() : String
      {
         return _key;
      }
      
      public function get value() : Object
      {
         return var_195;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get valid() : Boolean
      {
         return var_3366;
      }
      
      public function get range() : Array
      {
         return var_3020;
      }
      
      public function withNameSpace(param1:String) : PropertyStruct
      {
         return new PropertyStruct(param1 + ":" + _key,var_195,var_271,var_3366,var_3020);
      }
      
      public function withoutNameSpace() : PropertyStruct
      {
         return new PropertyStruct(_key.replace(/.*:/,""),var_195,var_271,var_3366,var_3020);
      }
      
      public function withValue(param1:Object) : PropertyStruct
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:* = true;
         loop1:
         switch(var_271)
         {
            case "uint":
            case "hex":
               _loc5_ = uint(var_195) != uint(param1);
               break;
            case "int":
               _loc5_ = int(var_195) != int(param1);
               break;
            case "Number":
               _loc5_ = Number(var_195) != Number(param1);
               break;
            case "Boolean":
               _loc5_ = Boolean(var_195) != Boolean(param1);
               break;
            case "String":
               _loc5_ = String(var_195) != String(param1);
               break;
            case "Array":
               _loc2_ = var_195 as Array;
               _loc3_ = param1 as Array;
               if(_loc2_ != null && _loc3_ != null && _loc2_.length == _loc3_.length)
               {
                  _loc5_ = false;
                  _loc4_ = 0;
                  while(true)
                  {
                     if(_loc4_ >= _loc3_.length)
                     {
                        break loop1;
                     }
                     if(_loc2_[_loc4_] != _loc3_[_loc4_])
                     {
                        _loc5_ = true;
                        break loop1;
                     }
                     _loc4_++;
                  }
               }
         }
         if(_loc5_)
         {
            return new PropertyStruct(_key,param1,type,true,var_3020);
         }
         return this;
      }
      
      public function toString() : String
      {
         switch(var_271)
         {
            case "hex":
               return "0x" + uint(var_195).toString(16);
            case "Boolean":
               return Boolean(var_195) == true ? "true" : "false";
            case "Point":
               return "Point(" + Point(var_195).x + ", " + Point(var_195).y + ")";
            case "Rectangle":
               return "Rectangle(" + Rectangle(var_195).x + ", " + Rectangle(var_195).y + ", " + Rectangle(var_195).width + ", " + Rectangle(var_195).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc4_:int = 0;
         var _loc3_:String = null;
         var _loc5_:class_24 = null;
         var _loc2_:Array = null;
         var _loc6_:Point = null;
         var _loc1_:Rectangle = null;
         switch(var_271)
         {
            case "Map":
               _loc5_ = var_195 as class_24;
               _loc3_ = "<var key=\"" + _key + "\">\r<value>\r<" + var_271 + ">\r";
               _loc4_ = 0;
               while(_loc4_ < _loc5_.length)
               {
                  _loc3_ += "<var key=\"" + _loc5_.getKey(_loc4_) + "\" value=\"" + _loc5_.getWithIndex(_loc4_) + "\" type=\"" + getQualifiedClassName(_loc5_.getWithIndex(_loc4_)) + "\" />\r";
                  _loc4_++;
               }
               _loc3_ += "</" + var_271 + ">\r</value>\r</var>";
               break;
            case "Array":
               _loc2_ = var_195 as Array;
               _loc3_ = "<var key=\"" + _key + "\">\r<value>\r<" + var_271 + ">\r";
               _loc4_ = 0;
               while(_loc4_ < _loc2_.length)
               {
                  _loc3_ += "<var key=\"" + String(_loc4_) + "\" value=\"" + _loc2_[_loc4_] + "\" type=\"" + getQualifiedClassName(_loc2_[_loc4_]) + "\" />\r";
                  _loc4_++;
               }
               _loc3_ += "</" + var_271 + ">\r</value>\r</var>";
               break;
            case "Point":
               _loc6_ = var_195 as Point;
               _loc3_ = "<var key=\"" + _key + "\">\r<value>\r<" + var_271 + ">\r";
               _loc3_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + "int" + "\" />\r";
               _loc3_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + "int" + "\" />\r";
               _loc3_ += "</" + var_271 + ">\r</value>\r</var>";
               break;
            case "Rectangle":
               _loc1_ = var_195 as Rectangle;
               _loc3_ = "<var key=\"" + _key + "\">\r<value>\r<" + var_271 + ">\r";
               _loc3_ += "<var key=\"x\" value=\"" + _loc1_.x + "\" type=\"" + "int" + "\" />\r";
               _loc3_ += "<var key=\"y\" value=\"" + _loc1_.y + "\" type=\"" + "int" + "\" />\r";
               _loc3_ += "<var key=\"width\" value=\"" + _loc1_.width + "\" type=\"" + "int" + "\" />\r";
               _loc3_ += "<var key=\"height\" value=\"" + _loc1_.height + "\" type=\"" + "int" + "\" />\r";
               _loc3_ += "</" + var_271 + ">\r</value>\r</var>";
               break;
            case "hex":
               _loc3_ = "<var key=\"" + _key + "\" value=\"" + "0x" + uint(var_195).toString(16) + "\" type=\"" + var_271 + "\" />";
               break;
            default:
               _loc3_ = "<var key=\"" + _key + "\" value=\"" + var_195 + "\" type=\"" + var_271 + "\" />";
         }
         return _loc3_;
      }
   }
}
