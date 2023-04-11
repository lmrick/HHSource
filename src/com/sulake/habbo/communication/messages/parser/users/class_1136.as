package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1136 implements IMessageParser
   {
      
      public static const const_13:int = 4;
       
      
      private var var_305:int;
      
      public function class_1136()
      {
         super();
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
      
      public function get reason() : int
      {
         return var_305;
      }
   }
}
