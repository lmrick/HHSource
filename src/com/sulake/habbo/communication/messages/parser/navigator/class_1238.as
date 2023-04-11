package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1238 implements IMessageParser
   {
       
      
      private var _userName:String;
      
      public function class_1238()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _userName = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         _userName = null;
         return true;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
