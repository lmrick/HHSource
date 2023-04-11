package com.sulake.habbo.freeflowchat.viewer.visualization.style
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public interface IChatStyleInternal
   {
       
      
      function getNewBackgroundSprite(param1:uint = 16777215) : Sprite;
      
      function get textFormat() : TextFormat;
      
      function get styleSheet() : StyleSheet;
      
      function get pointer() : BitmapData;
      
      function get pointerOffsetToBubbleBottom() : int;
      
      function get faceOffset() : Point;
      
      function get textFieldMargins() : Rectangle;
      
      function get overlap() : Rectangle;
      
      function get allowHTML() : Boolean;
      
      function get isAnonymous() : Boolean;
      
      function get isSystemStyle() : Boolean;
   }
}
