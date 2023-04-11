package com.sulake.core.window.components
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.utils.IMargins;
   
   public interface IFrameWindow extends class_3151
   {
       
      
      function get title() : ILabelWindow;
      
      function get header() : class_3269;
      
      function get content() : class_3151;
      
      function get margins() : IMargins;
      
      function get scaler() : IScalerWindow;
      
      function resizeToFitContent() : void;
      
      function set helpButtonAction(param1:Function) : void;
      
      function get helpPage() : String;
      
      function set helpPage(param1:String) : void;
   }
}
