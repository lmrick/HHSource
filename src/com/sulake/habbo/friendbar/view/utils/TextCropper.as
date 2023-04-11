package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.components.ITextWindow;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class TextCropper implements class_13
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1468:TextField;
      
      private var var_2672:TextFormat;
      
      private var var_4313:String = "...";
      
      private var var_4327:int = 20;
      
      public function TextCropper()
      {
         super();
         var_1468 = new TextField();
         var_1468.autoSize = "left";
         var_1468.antiAliasType = "advanced";
         var_1468.gridFitType = "pixel";
         var_2672 = var_1468.defaultTextFormat;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_1468 = null;
            _disposed = true;
         }
      }
      
      public function crop(param1:ITextWindow) : void
      {
         var _loc2_:int = 0;
         var_2672.font = param1.fontFace;
         var_2672.size = param1.fontSize;
         var_2672.bold = param1.bold;
         var_2672.italic = param1.italic;
         var_1468.setTextFormat(var_2672);
         var_1468.text = param1.getLineText(0);
         var _loc3_:int = 0;
         if(_loc3_ > param1.width)
         {
            _loc2_ = var_1468.getCharIndexAtPoint(param1.width - var_4327,0);
            param1.text = param1.text.slice(0,_loc2_) + var_4313;
         }
      }
   }
}
