package com.sulake.habbo.avatar.enum
{
   public class AvatarEditorInstanceId
   {
      
      public static const const_867:uint = 0;
      
      public static const const_710:uint = 1;
      
      public static const BOT_EDITOR:uint = 2;
      
      public static const DEV_TOOL_EDITOR:uint = 3;
       
      
      public function AvatarEditorInstanceId()
      {
         super();
      }
      
      public static function isDevelopmentEditor(param1:int) : Boolean
      {
         return param1 == 2 || param1 == 2 || param1 == 3;
      }
   }
}
