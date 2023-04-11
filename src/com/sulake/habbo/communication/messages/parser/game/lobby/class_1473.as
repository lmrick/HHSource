package package_173
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1473 implements IMessageParser
   {
       
      
      private var var_414:String;
      
      private var var_331:String;
      
      public function class_1473()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_414 = "";
         var_331 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_414 = param1.readString();
         var_331 = param1.readString();
         return true;
      }
      
      public function get stuffCode() : String
      {
         return var_414;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
   }
}
