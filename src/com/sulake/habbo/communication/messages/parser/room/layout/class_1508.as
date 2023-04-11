package package_152
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1508 implements IMessageParser
   {
       
      
      private var var_29:int;
      
      private var var_28:int;
      
      private var var_386:uint;
      
      public function class_1508()
      {
         super();
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_28;
      }
      
      public function get dir() : uint
      {
         return var_386;
      }
      
      public function flush() : Boolean
      {
         var_29 = 0;
         var_28 = 0;
         var_386 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_29 = param1.readInteger();
         var_28 = param1.readInteger();
         var_386 = param1.readInteger();
         return true;
      }
   }
}
