package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.core.utils.Map;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.text.StyleSheet;
   
   public class TextStyleManager
   {
      
      public static const REGULAR:String = "regular";
      
      public static const ITALIC:String = "italic";
      
      public static const BOLD:String = "bold";
      
      private static var _styleSheetMap:Map;
      
      private static var _styleSheetNames:Array;
      
      private static var _eventDispatcher:IEventDispatcher;
      
      private static const TAG_OPEN:String = "{";
      
      private static const TAG_CLOSE:String = "}";
      
      private static const CMT_OPEN:String = "/*";
      
      private static const CMT_CLOSE:String = "*/";
      
      {
         init();
      }
      
      public function TextStyleManager()
      {
         super();
      }
      
      public static function get events() : IEventDispatcher
      {
         return _eventDispatcher;
      }
      
      private static function init() : void
      {
         var _loc1_:class_3367 = null;
         _styleSheetMap = new class_24();
         _styleSheetNames = [];
         _eventDispatcher = new EventDispatcherWrapper();
         _loc1_ = new class_3367();
         _loc1_.name = "regular";
         _loc1_.color = 0;
         _loc1_.fontSize = "9";
         _loc1_.fontFamily = "Courier";
         _loc1_.fontStyle = "normal";
         _loc1_.fontWeight = "normal";
         _styleSheetMap[_loc1_.name] = _loc1_;
         _styleSheetNames.push(_loc1_.name);
         _loc1_ = new class_3367();
         _loc1_.name = "italic";
         _loc1_.color = 0;
         _loc1_.fontSize = "9";
         _loc1_.fontFamily = "Courier";
         _loc1_.fontStyle = "italic";
         _loc1_.fontWeight = "normal";
         _styleSheetMap[_loc1_.name] = _loc1_;
         _styleSheetNames.push(_loc1_.name);
         _loc1_ = new class_3367();
         _loc1_.name = "bold";
         _loc1_.color = 0;
         _loc1_.fontSize = "9";
         _loc1_.fontFamily = "Courier";
         _loc1_.fontStyle = "normal";
         _loc1_.fontWeight = "bold";
         _styleSheetMap[_loc1_.name] = _loc1_;
         _styleSheetNames.push(_loc1_.name);
      }
      
      public static function getStyle(param1:String) : class_3367
      {
         return _styleSheetMap[param1];
      }
      
      public static function getStyleWithIndex(param1:int) : class_3367
      {
         return _styleSheetMap.getWithIndex(param1);
      }
      
      public static function setStyle(param1:String, param2:class_3367) : void
      {
         var _loc3_:* = !_styleSheetMap.hasKey(param1);
         param2.name = param1;
         _styleSheetMap[param1] = param2;
         if(_loc3_)
         {
            _styleSheetNames.push(param1);
            _eventDispatcher.dispatchEvent(new Event("added"));
         }
         else
         {
            _eventDispatcher.dispatchEvent(new Event("change"));
         }
      }
      
      public static function setStyles(param1:Array, param2:Boolean = false) : void
      {
         var _loc3_:Array = null;
         if(param2)
         {
            _loc3_ = [_styleSheetMap["regular"],_styleSheetMap["italic"],_styleSheetMap["bold"]];
            _styleSheetMap.reset();
            _styleSheetMap["regular"] = _loc3_[0];
            _styleSheetMap["italic"] = _loc3_[1];
            _styleSheetMap["bold"] = _loc3_[2];
         }
         var _loc4_:int = 0;
         for each(var _loc5_ in param1)
         {
            _styleSheetMap[_loc5_.name] = _loc5_;
            if(_styleSheetNames.indexOf(_loc5_.name) == -1)
            {
               _styleSheetNames.push(_loc5_.name);
            }
         }
         _eventDispatcher.dispatchEvent(new Event("change"));
         if(_styleSheetMap.length != _loc4_)
         {
            _eventDispatcher.dispatchEvent(new Event("added"));
         }
      }
      
      public static function findMatchingTextStyle(param1:String) : class_3367
      {
         var _loc2_:class_3367 = null;
         var _loc3_:class_3367 = parseCSS(param1)[0] as class_3367;
         if(_loc3_)
         {
            _loc2_ = _styleSheetMap[_loc3_.name];
            if(_loc2_ && _loc2_.equals(_loc3_))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function enumerateStyles() : Array
      {
         var _loc3_:int = 0;
         var _loc1_:* = [];
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(_styleSheetMap.getWithIndex(_loc3_));
            _loc3_++;
         }
         return _loc1_;
      }
      
      public static function enumerateStyleNames() : Array
      {
         return _styleSheetMap.getKeys();
      }
      
      public static function getStyleNameArrayRef() : Array
      {
         return _styleSheetNames;
      }
      
      public static function parseCSS(param1:String) : Array
      {
         var _loc7_:Object = null;
         var _loc6_:class_3367 = null;
         var _loc5_:StyleSheet;
         (_loc5_ = new StyleSheet()).parseCSS(param1);
         var _loc3_:Array = parseStyleNamesFromCSS(param1);
         var _loc2_:* = [];
         for each(var _loc4_ in _loc3_)
         {
            _loc7_ = _loc5_.getStyle(_loc4_);
            (_loc6_ = new class_3367()).name = _loc4_;
            _loc6_.color = !!_loc7_.color ? uint(String(_loc7_.color).replace("#","0x")) : null;
            _loc6_.fontFamily = !!_loc7_.fontFamily ? _loc7_.fontFamily : null;
            _loc6_.fontSize = !!_loc7_.fontSize ? parseInt(String(_loc7_.fontSize)) : null;
            _loc6_.fontStyle = !!_loc7_.fontStyle ? _loc7_.fontStyle : null;
            _loc6_.fontWeight = !!_loc7_.fontWeight ? _loc7_.fontWeight : null;
            _loc6_.kerning = !!_loc7_.kerning ? _loc7_.kerning == "true" : null;
            _loc6_.leading = !!_loc7_.leading ? parseInt(String(_loc7_.leading)) : null;
            _loc6_.letterSpacing = !!_loc7_.letterSpacing ? parseInt(_loc7_.letterSpacing.toString()) : null;
            _loc6_.textDecoration = !!_loc7_.textDecoration ? _loc7_.textDecoration : null;
            _loc6_.textIndent = !!_loc7_.textIndent ? parseInt(_loc7_.textIndent.toString()) : null;
            _loc6_.antiAliasType = !!_loc7_.antiAliasType ? _loc7_.antiAliasType : null;
            _loc6_.sharpness = !!_loc7_.sharpness ? parseInt(_loc7_.sharpness) : null;
            _loc6_.thickness = !!_loc7_.thickness ? parseInt(_loc7_.thickness) : null;
            _loc6_.etchingColor = !!_loc7_.etchingColor ? uint(String(_loc7_.etchingColor).replace("#","0x")) : null;
            _loc6_.etchingPosition = !!_loc7_.etchingPosition ? String(_loc7_.etchingPosition) : null;
            _loc2_.push(_loc6_);
         }
         return _loc2_;
      }
      
      private static function parseStyleNamesFromCSS(param1:String) : Array
      {
         var _loc2_:* = [];
         var _loc3_:* = param1;
         _loc3_ = _loc3_.split("\t").join("");
         _loc3_ = _loc3_.split("\n").join("");
         _loc3_ = _loc3_.split("\r").join("");
         var _loc4_:Array = _loc3_.split("}");
         if(countSubStrings(param1,"{") != countSubStrings(param1,"}"))
         {
            throw new Error("Mismatching amount of \"{\" versus \"}\", please check the CSS!");
         }
         for each(var _loc5_ in _loc4_)
         {
            while(_loc5_.indexOf("/*") == 0)
            {
               _loc5_ = _loc5_.substring(_loc5_.indexOf("*/") + 2,_loc5_.length);
            }
            if((_loc5_ = _loc5_.slice(0,_loc5_.indexOf("{")).split(" ").join("")).length)
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      private static function countSubStrings(param1:String, param2:String) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while((_loc4_ = param1.indexOf(param2,_loc4_)) != -1)
         {
            _loc4_++;
            _loc3_++;
         }
         return _loc3_;
      }
      
      public static function toString() : String
      {
         var _loc2_:Array = enumerateStyles();
         var _loc1_:String = "";
         for each(var _loc3_ in _loc2_)
         {
            _loc1_ += _loc3_.toString() + "\n\n";
         }
         return _loc1_;
      }
   }
}
