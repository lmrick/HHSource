package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1079 implements IMessageParser
   {
      
      public static const const_308:int = 6;
       
      
      private var var_305:int;
      
      public function class_1079()
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
