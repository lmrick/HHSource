package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1207 implements IMessageParser
   {
      
      public static const const_204:int = 0;
      
      public static const const_319:int = 1;
      
      public static const const_390:int = 2;
      
      public static const const_331:int = 3;
      
      public static const const_197:int = 4;
       
      
      private var var_413:int;
      
      public function class_1207()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_413 = param1.readInteger();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_413;
      }
   }
}
