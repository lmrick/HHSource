package package_129
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1307 implements IMessageParser
   {
       
      
      private var var_1150:String;
      
      private var var_827:int;
      
      public function class_1307()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1150 = param1.readString();
         var_827 = param1.readInteger();
         return true;
      }
      
      public function get timeStr() : String
      {
         return var_1150;
      }
      
      public function get secondsUntil() : int
      {
         return var_827;
      }
   }
}
