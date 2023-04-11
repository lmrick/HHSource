package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1165 implements IMessageParser
   {
       
      
      private var var_339:int;
      
      private var var_929:int;
      
      public function class_1165()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_339 = param1.readInteger();
         var_929 = param1.readInteger();
         return true;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get furniCount() : int
      {
         return var_929;
      }
   }
}
