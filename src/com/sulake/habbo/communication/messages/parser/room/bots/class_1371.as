package package_171
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1371 implements IMessageParser
   {
       
      
      private var var_341:int;
      
      private var var_563:int;
      
      private var var_45:String;
      
      public function class_1371()
      {
         super();
      }
      
      public function get botId() : int
      {
         return var_341;
      }
      
      public function get commandId() : int
      {
         return var_563;
      }
      
      public function get data() : String
      {
         return var_45;
      }
      
      public function flush() : Boolean
      {
         var_341 = -1;
         var_563 = -1;
         var_45 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_341 = param1.readInteger();
         var_563 = param1.readInteger();
         var_45 = param1.readString();
         return true;
      }
   }
}
