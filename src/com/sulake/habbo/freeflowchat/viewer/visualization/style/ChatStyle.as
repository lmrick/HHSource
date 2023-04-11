package com.sulake.habbo.freeflowchat.viewer.visualization.style
{
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.freeflowchat.style.class_3383;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public class ChatStyle implements class_3383, class_3352
   {
       
      
      private var _background:BitmapData;
      
      private var _scale9Grid:Rectangle;
      
      private var var_1786:BitmapData;
      
      private var _pointerY:int;
      
      private var var_3901:Rectangle;
      
      private var var_2672:TextFormat;
      
      private var var_2001:BitmapData;
      
      private var _iconOffset:Point;
      
      private var var_4163:BitmapData;
      
      private var _color:BitmapData;
      
      private var _colorOffset:Point;
      
      private var _overlap:Rectangle;
      
      private var var_3738:Boolean;
      
      private var var_3904:Boolean;
      
      private var var_4120:Boolean;
      
      private var var_4028:Boolean;
      
      private var _isAnonymous:Boolean;
      
      private var _allowHTML:Boolean;
      
      private var var_4137:StyleSheet;
      
      public function ChatStyle(param1:BitmapData, param2:Rectangle, param3:BitmapData, param4:int, param5:Rectangle, param6:TextFormat, param7:Boolean, param8:Point, param9:BitmapData, param10:BitmapData, param11:Boolean, param12:Boolean, param13:Boolean, param14:Boolean, param15:BitmapData = null, param16:Point = null, param17:Rectangle = null, param18:Boolean = false, param19:StyleSheet = null)
      {
         super();
         _background = param1;
         _scale9Grid = param2;
         var_1786 = param3;
         _pointerY = param4;
         var_3901 = param5;
         var_2672 = param6;
         _isAnonymous = param7;
         _iconOffset = param8;
         var_2001 = param9;
         var_4163 = param10;
         var_3738 = param11;
         var_3904 = param12;
         var_4120 = param14;
         var_4028 = param13;
         _color = param15;
         _colorOffset = param16;
         _overlap = param17;
         _allowHTML = param18;
         var_4137 = param19;
      }
      
      public function getNewBackgroundSprite(param1:uint = 16777215) : Sprite
      {
         var _loc4_:BitmapData = null;
         var _loc2_:* = 0;
         var _loc5_:* = 0;
         var _loc3_:* = 0;
         if(_color != null)
         {
            (_loc4_ = new BitmapData(_background.width,_background.height,_background.transparent,0)).copyPixels(_background,_background.rect,new Point(0,0));
            _loc2_ = uint(param1 >> 16 & 255);
            _loc5_ = uint(param1 >> 8 & 255);
            _loc3_ = uint(param1 >> 0 & 255);
            _loc4_.draw(_color,null,new ColorTransform(_loc2_ / 255,_loc5_ / 255,_loc3_ / 255),"darken");
         }
         else
         {
            _loc4_ = _background;
         }
         return HabboFreeFlowChat.create9SliceSprite(_scale9Grid,_loc4_);
      }
      
      public function get textFormat() : TextFormat
      {
         return var_2672;
      }
      
      public function get styleSheet() : StyleSheet
      {
         return var_4137;
      }
      
      public function get pointer() : BitmapData
      {
         return var_1786;
      }
      
      public function get pointerOffsetToBubbleBottom() : int
      {
         return 0 - _pointerY;
      }
      
      public function get isAnonymous() : Boolean
      {
         return _isAnonymous;
      }
      
      public function get faceOffset() : Point
      {
         return _iconOffset;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_2001;
      }
      
      public function get textFieldMargins() : Rectangle
      {
         return var_3901;
      }
      
      public function get overlap() : Rectangle
      {
         return _overlap;
      }
      
      public function get selectorPreview() : BitmapData
      {
         return var_4163;
      }
      
      public function get isSystemStyle() : Boolean
      {
         return var_3738;
      }
      
      public function get isHcOnly() : Boolean
      {
         return var_3904;
      }
      
      public function get isAmbassadorOnly() : Boolean
      {
         return var_4120;
      }
      
      public function get isStaffOverrideable() : Boolean
      {
         return var_4028;
      }
      
      public function get allowHTML() : Boolean
      {
         return _allowHTML;
      }
   }
}
