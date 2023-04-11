package com.sulake.habbo.freeflowchat.viewer.visualization.style
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.freeflowchat.style.class_3278;
   import com.sulake.habbo.freeflowchat.style.class_3383;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public class ChatStyleLibrary implements class_13, class_3278
   {
       
      
      private const DEFAULT_STYLE:int = 0;
      
      private var _assets:class_21;
      
      private var _styles:class_24;
      
      public function ChatStyleLibrary(param1:class_21)
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:* = false;
         var _loc7_:* = false;
         var _loc9_:* = false;
         var _loc3_:* = false;
         var _loc10_:* = false;
         var _loc6_:ChatStyle = null;
         _styles = new class_24();
         super();
         _assets = param1;
         var _loc8_:XML = XML(_assets.getAssetByName("chatstyles_xml").content);
         for each(var _loc11_ in _loc8_.child("style"))
         {
            _loc4_ = int(_loc11_.@id[0]);
            _loc5_ = _loc11_.@assetId[0];
            _loc2_ = _loc11_.@systemStyle[0] == "true";
            _loc7_ = _loc11_.@hcOnly[0] == "true";
            _loc9_ = _loc11_.@staffOverrideable[0] == "true";
            _loc3_ = _loc11_.@allowHTML[0] == "true";
            _loc10_ = _loc11_.@ambassadorOnly[0] == "true";
            try
            {
               _loc6_ = initializeStyleFromAssets(_loc5_,_loc2_,_loc7_,_loc9_,_loc3_,_loc10_);
               _styles.add(_loc4_,_loc6_);
            }
            catch(e:Error)
            {
               class_14.log("Error initializing chat style: " + _loc4_ + ", error message: " + e.message);
            }
         }
      }
      
      public function dispose() : void
      {
         _styles.dispose();
         _styles = null;
         _assets = null;
      }
      
      public function get disposed() : Boolean
      {
         return _assets == null;
      }
      
      private function initializeStyleFromAssets(param1:String, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean) : ChatStyle
      {
         var _loc15_:BitmapData = null;
         var _loc29_:String = String(_assets.getAssetByName("style_" + param1 + "_regpoints").content);
         var _loc30_:BitmapData = _assets.getAssetByName("style_" + param1 + "_chat_bubble_base").content as BitmapData;
         var _loc21_:Rectangle = new Rectangle(getConfigPoint(_loc29_,"9sliceXY").x,getConfigPoint(_loc29_,"9sliceXY").y,getConfigPoint(_loc29_,"9sliceWH").x,getConfigPoint(_loc29_,"9sliceWH").y);
         var _loc16_:Point = hasConfig(_loc29_,"faceXY") ? getConfigPoint(_loc29_,"faceXY") : null;
         var _loc25_:int = 0;
         if(!(hasConfig(_loc29_,"anonymous") ? getConfigBoolean(_loc29_,"anonymous") : false))
         {
            _loc15_ = _assets.getAssetByName("style_" + param1 + "_chat_bubble_pointer").content as BitmapData;
            _loc25_ = int(getConfigCSV(_loc29_,"pointerY")[0]);
         }
         var _loc7_:BitmapData = !!_assets.hasAsset("style_" + param1 + "_icon") ? _assets.getAssetByName("style_" + param1 + "_icon").content as BitmapData : null;
         var _loc14_:Rectangle = getConfigRect(_loc29_,"textFieldMargins");
         var _loc24_:BitmapData = _assets.getAssetByName("style_" + param1 + "_selector_preview").content as BitmapData;
         var _loc8_:BitmapData = null;
         if(_assets.hasAsset("style_" + param1 + "_chat_bubble_color"))
         {
            _loc8_ = _assets.getAssetByName("style_" + param1 + "_chat_bubble_color").content as BitmapData;
         }
         var _loc28_:Point = hasConfig(_loc29_,"colorXY") ? getConfigPoint(_loc29_,"colorXY") : null;
         var _loc12_:Rectangle = hasConfig(_loc29_,"overlapRect") ? getConfigRect(_loc29_,"overlapRect") : null;
         var _loc20_:uint = uint(hasConfig(_loc29_,"textColorRGB") ? uint(getConfigCSV(_loc29_,"textColorRGB")[0]) : 0);
         var _loc10_:String = String(hasConfig(_loc29_,"fontFace") ? getConfigCSV(_loc29_,"fontFace")[0] : "Volter");
         var _loc26_:int = int(hasConfig(_loc29_,"fontSize") ? int(getConfigCSV(_loc29_,"fontSize")[0]) : 9);
         var _loc22_:TextFormat = new TextFormat(_loc10_,_loc26_,_loc20_);
         var _loc18_:uint = hasConfig(_loc29_,"linkColorRGB") ? uint(getConfigCSV(_loc29_,"linkColorRGB")[0]) : _loc20_;
         var _loc27_:uint = hasConfig(_loc29_,"linkHoverColorRGB") ? uint(getConfigCSV(_loc29_,"linkHoverColorRGB")[0]) : _loc20_;
         var _loc19_:uint = hasConfig(_loc29_,"linkActiveColorRGB") ? uint(getConfigCSV(_loc29_,"linkActiveColorRGB")[0]) : _loc20_;
         var _loc9_:StyleSheet = new StyleSheet();
         var _loc11_:*;
         (_loc11_ = {}).textDecoration = "underline";
         _loc11_.color = toHexString(_loc18_);
         _loc9_.setStyle("a:link",_loc11_);
         var _loc17_:*;
         (_loc17_ = {}).color = toHexString(_loc19_);
         _loc9_.setStyle("a:active",_loc17_);
         var _loc13_:*;
         (_loc13_ = {}).color = toHexString(_loc27_);
         _loc9_.setStyle("a:hover",_loc13_);
         return new ChatStyle(_loc30_,_loc21_,_loc15_,_loc25_,_loc14_,_loc22_,false,_loc16_,_loc7_,_loc24_,param2,param3,param4,param6,_loc8_,_loc28_,_loc12_,param5,_loc9_);
      }
      
      private function toHexString(param1:uint) : String
      {
         var _loc2_:String = param1.toString(16);
         while(_loc2_.length < 6)
         {
            _loc2_ = "0" + _loc2_;
         }
         return "#" + _loc2_;
      }
      
      private function hasConfig(param1:String, param2:String) : Boolean
      {
         return param1.indexOf(param2) != -1;
      }
      
      private function getConfigCSV(param1:String, param2:String) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = false;
         var _loc7_:String = null;
         var _loc4_:int;
         if((_loc4_ = param1.indexOf(param2)) != -1)
         {
            _loc5_ = param1.indexOf("=",_loc4_);
            if((_loc6_ = param1.indexOf("\r\n",_loc5_)) == -1)
            {
               _loc6_ = param1.indexOf("\n",_loc5_);
            }
            if(_loc6_ == -1)
            {
               _loc6_ = param1.length;
            }
            _loc3_ = param1.charAt(_loc5_ + 1) == " ";
            return (_loc7_ = param1.substr(_loc5_ + (_loc3_ ? 2 : 1),_loc6_ - _loc5_ - (_loc3_ ? 2 : 1))).split(",");
         }
         return null;
      }
      
      private function getConfigPoint(param1:String, param2:String) : Point
      {
         return new Point(int(getConfigCSV(param1,param2)[0]),int(getConfigCSV(param1,param2)[1]));
      }
      
      private function getConfigRect(param1:String, param2:String) : Rectangle
      {
         return new Rectangle(int(getConfigCSV(param1,param2)[0]),int(getConfigCSV(param1,param2)[1]),int(getConfigCSV(param1,param2)[2]),int(getConfigCSV(param1,param2)[3]));
      }
      
      private function getConfigBoolean(param1:String, param2:String) : Boolean
      {
         return getConfigCSV(param1,param2)[0] == "true";
      }
      
      public function getStyleIds() : Array
      {
         return _styles.getKeys();
      }
      
      public function getStyle(param1:int) : class_3383
      {
         if(_styles.hasKey(param1))
         {
            return _styles.getValue(param1);
         }
         return _styles.getValue(0);
      }
   }
}
