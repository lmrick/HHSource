package package_153
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1456 implements IMessageParser
   {
       
      
      private var var_1193:String;
      
      private var var_1200:Boolean;
      
      public function class_1456()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1193 = param1.readString();
         var_1200 = param1.readBoolean();
         return true;
      }
      
      public function get requestCode() : String
      {
         return var_1193;
      }
      
      public function get fulfilled() : Boolean
      {
         return var_1200;
      }
   }
}
