package package_129
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1446 implements IMessageParser
   {
       
      
      private var var_1050:String;
      
      private var var_713:String;
      
      public function class_1446()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1050 = param1.readString();
         var_713 = param1.readString();
         return true;
      }
      
      public function get schedulingStr() : String
      {
         return var_1050;
      }
      
      public function get code() : String
      {
         return var_713;
      }
   }
}
