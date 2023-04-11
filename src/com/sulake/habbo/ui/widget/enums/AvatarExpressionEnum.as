package com.sulake.habbo.ui.widget.enums
{
   public class AvatarExpressionEnum
   {
      
      public static const NONE:com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum = new com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum(0);
      
      public static const WAVE:com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum = new com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum(1);
      
      public static const BLOW:com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum = new com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum(2);
      
      public static const LAUGH:com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum = new com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum(3);
      
      public static const CRY:com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum = new com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum(4);
      
      public static const const_419:com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum = new com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum(5);
      
      public static const JUMP:com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum = new com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum(6);
      
      public static const RESPECT:com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum = new com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum(7);
       
      
      private var var_3268:int = 0;
      
      public function AvatarExpressionEnum(param1:int)
      {
         super();
         var_3268 = param1;
      }
      
      public function get ordinal() : int
      {
         return var_3268;
      }
      
      public function equals(param1:com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum) : Boolean
      {
         return param1 && param1.var_3268 == var_3268;
      }
   }
}
