package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_183.class_1589;
   
   [SecureSWF(rename="true")]
   public class class_1230 implements IMessageParser
   {
      
      public static const const_255:int = 0;
      
      public static const const_215:int = 1;
      
      public static const const_267:int = 2;
      
      public static const const_327:int = 3;
       
      
      private var var_476:int;
      
      private var var_457:class_1589;
      
      public function class_1230()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_457 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_476 = param1.readInteger();
         if(var_476 == 1)
         {
            var_457 = new class_1589(param1);
         }
         return true;
      }
      
      public function get statusCode() : int
      {
         return var_476;
      }
      
      public function get pendingTicket() : class_1589
      {
         return var_457;
      }
      
      public function get localizationCode() : String
      {
         switch(var_476 - 2)
         {
            case 0:
               return "blocked";
            case 1:
               return "tooquick";
            default:
               return "";
         }
      }
   }
}
