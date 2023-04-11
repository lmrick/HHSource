package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1204 implements IMessageParser
   {
       
      
      private var var_575:int;
      
      public function class_1204()
      {
         super();
      }
      
      public function get issueId() : int
      {
         return var_575;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_575 = parseInt(param1.readString());
         return true;
      }
   }
}
