package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1116 implements IMessageParser
   {
       
      
      private var var_506:package_155.class_1642;
      
      public function class_1116()
      {
         super();
      }
      
      public function get forumData() : package_155.class_1642
      {
         return var_506;
      }
      
      public function flush() : Boolean
      {
         var_506 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_506 = package_155.class_1642.readFromMessage(param1);
         return true;
      }
   }
}
