package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1392 implements IMessageParser
   {
      
      public static const const_163:int = 0;
      
      public static const const_183:int = 1;
       
      
      private var var_380:int;
      
      private var var_1382:int;
      
      public function class_1392()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_380 = param1.readInteger();
         this.var_1382 = param1.readInteger();
         return true;
      }
      
      public function get resultCode() : int
      {
         return var_380;
      }
      
      public function get roomLimit() : int
      {
         return var_1382;
      }
   }
}
