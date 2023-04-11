package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1268 implements IMessageParser
   {
      
      public static const const_138:int = 0;
       
      
      private var var_170:int;
      
      public function class_1268()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_170 = param1.readInteger();
         return true;
      }
      
      public function get result() : int
      {
         return var_170;
      }
   }
}
