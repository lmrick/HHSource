package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1274 implements IMessageParser
   {
       
      
      private var var_421:int;
      
      private var var_339:int;
      
      private var var_1034:int;
      
      public function class_1274()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_421 = param1.readInteger();
         var_339 = param1.readInteger();
         var_1034 = param1.readInteger();
         return true;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get supplementType() : int
      {
         return var_1034;
      }
   }
}
