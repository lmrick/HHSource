package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1291;
   
   [SecureSWF(rename="true")]
   public class class_1285 implements IMessageParser
   {
       
      
      private var var_464:class_1291;
      
      private var var_1317:Boolean;
      
      private var var_497:String;
      
      public function class_1285()
      {
         super();
      }
      
      public function get root() : class_1291
      {
         return var_464;
      }
      
      public function get newAdditionsAvailable() : Boolean
      {
         return var_1317;
      }
      
      public function get catalogType() : String
      {
         return var_497;
      }
      
      public function flush() : Boolean
      {
         var_464 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_464 = new class_1291(param1);
         var_1317 = param1.readBoolean();
         var_497 = param1.readString();
         return true;
      }
   }
}
