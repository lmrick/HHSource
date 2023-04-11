package package_151
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1509 implements IMessageParser
   {
       
      
      private var var_427:String;
      
      private var var_122:String;
      
      public function class_1509()
      {
         super();
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function flush() : Boolean
      {
         var_427 = "";
         var_122 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_427 = param1.readString();
         var_122 = param1.readString();
         if(var_122)
         {
            var_122 = var_122.toUpperCase();
         }
         return true;
      }
   }
}
