package com.sulake.core.window.components
{
   import com.sulake.core.window.class_3151;
   
   public interface IBoxSizerWindow extends class_3151
   {
       
      
      function setHorizontalPadding(param1:int) : void;
      
      function setVerticalPadding(param1:int) : void;
      
      function setSpacing(param1:int) : void;
      
      function setVertical(param1:Boolean) : void;
      
      function setAutoRearrange(param1:Boolean) : void;
      
      function getAutoRearrange() : Boolean;
   }
}
