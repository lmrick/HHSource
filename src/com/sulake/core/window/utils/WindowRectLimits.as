package com.sulake.core.window.utils
{
   import com.sulake.core.window.class_3127;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var _minWidth:int = -2147483648;
      
      private var _maxWidth:int = 2147483647;
      
      private var var_1753:int = -2147483648;
      
      private var var_1732:int = 2147483647;
      
      private var var_319:class_3127;
      
      public function WindowRectLimits(param1:class_3127)
      {
         super();
         var_319 = param1;
      }
      
      public function get minWidth() : int
      {
         return _minWidth;
      }
      
      public function get maxWidth() : int
      {
         return _maxWidth;
      }
      
      public function get minHeight() : int
      {
         return var_1753;
      }
      
      public function get maxHeight() : int
      {
         return var_1732;
      }
      
      public function set minWidth(param1:int) : void
      {
         _minWidth = param1;
         if(_minWidth > -2147483648 && true && var_319.width < _minWidth)
         {
            var_319.width = _minWidth;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         _maxWidth = param1;
         if(_maxWidth < 2147483647 && true && var_319.width > _maxWidth)
         {
            var_319.width = _maxWidth;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_1753 = param1;
         if(var_1753 > -2147483648 && true && var_319.height < var_1753)
         {
            var_319.height = var_1753;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_1732 = param1;
         if(var_1732 < 2147483647 && true && var_319.height > var_1732)
         {
            var_319.height = var_1732;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return _minWidth == -2147483648 && _maxWidth == 2147483647 && var_1753 == -2147483648 && var_1732 == 2147483647;
      }
      
      public function setEmpty() : void
      {
         _minWidth = -2147483648;
         _maxWidth = 2147483647;
         var_1753 = -2147483648;
         var_1732 = 2147483647;
      }
      
      public function limit() : void
      {
         if(!isEmpty && var_319)
         {
            if(var_319.width < _minWidth)
            {
               var_319.width = _minWidth;
            }
            else if(var_319.width > _maxWidth)
            {
               var_319.width = _maxWidth;
            }
            if(var_319.height < var_1753)
            {
               var_319.height = var_1753;
            }
            else if(var_319.height > var_1732)
            {
               var_319.height = var_1732;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         _minWidth = param1;
         _maxWidth = param2;
         var_1753 = param3;
         var_1732 = param4;
         limit();
      }
      
      public function clone(param1:class_3127) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_._minWidth = _minWidth;
         _loc2_._maxWidth = _maxWidth;
         _loc2_.var_1753 = var_1753;
         _loc2_.var_1732 = var_1732;
         return _loc2_;
      }
   }
}
