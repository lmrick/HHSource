package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1059 implements IMessageParser
   {
       
      
      private var var_961:String;
      
      private var var_1075:Boolean;
      
      private var var_682:Boolean;
      
      public function class_1059()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_961 = param1.readString();
         var_1075 = param1.readBoolean();
         var_682 = param1.readBoolean();
         return true;
      }
      
      public function get email() : String
      {
         return var_961;
      }
      
      public function get isVerified() : Boolean
      {
         return var_1075;
      }
      
      public function get allowChange() : Boolean
      {
         return var_682;
      }
   }
}
