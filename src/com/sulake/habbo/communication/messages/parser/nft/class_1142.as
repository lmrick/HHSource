package package_163
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1142 implements IMessageParser
   {
       
      
      private var var_807:String;
      
      private var var_544:String;
      
      private var var_540:String;
      
      public function class_1142()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_544 = "";
         var_540 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_807 = param1.readString();
         var_544 = param1.readString();
         var_540 = param1.readString();
         return true;
      }
      
      public function get currentTokenId() : String
      {
         return var_807;
      }
      
      public function get fallbackFigureString() : String
      {
         return var_544;
      }
      
      public function get fallbackFigureGender() : String
      {
         return var_540;
      }
   }
}
