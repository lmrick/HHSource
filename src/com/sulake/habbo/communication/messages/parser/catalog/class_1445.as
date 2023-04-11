package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1445 implements IMessageParser
   {
       
      
      private var var_579:Boolean;
      
      private var var_678:String;
      
      private var var_900:String;
      
      private var var_1188:int;
      
      public function class_1445()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_579 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_678 = param1.readString();
         if(var_678 != "")
         {
            var_579 = true;
         }
         var_900 = param1.readString();
         var_1188 = param1.readInteger();
         return true;
      }
      
      public function get available() : Boolean
      {
         return var_579;
      }
      
      public function get pricePointUrl() : String
      {
         return var_678;
      }
      
      public function get market() : String
      {
         return var_900;
      }
      
      public function get lengthInDays() : int
      {
         return var_1188;
      }
   }
}
