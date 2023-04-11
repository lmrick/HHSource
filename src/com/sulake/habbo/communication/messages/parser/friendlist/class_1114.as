package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1114 implements IMessageParser
   {
       
      
      private var var_1323:int;
      
      private var var_330:String;
      
      public function class_1114()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1323 = param1.readInteger();
         this.var_330 = param1.readString();
         return true;
      }
      
      public function get senderId() : int
      {
         return this.var_1323;
      }
      
      public function get messageText() : String
      {
         return this.var_330;
      }
   }
}
