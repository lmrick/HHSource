package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1474 implements IMessageParser
   {
      
      public static const const_160:int = 1;
      
      public static const const_101:int = 2;
      
      public static const const_343:int = 3;
      
      public static const const_302:int = 4;
       
      
      private var var_305:int;
      
      public function class_1474()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_305;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_305 = param1.readInteger();
         return true;
      }
   }
}
