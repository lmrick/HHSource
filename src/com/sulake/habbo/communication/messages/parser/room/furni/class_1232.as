package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1232 implements IMessageParser
   {
       
      
      private var var_490:int;
      
      private var var_1321:String;
      
      private var var_1273:int;
      
      private var var_1099:int;
      
      private var var_159:int;
      
      public function class_1232()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_490 = param1.readInteger();
         var_1321 = param1.readString();
         var_1273 = param1.readInteger();
         var_1099 = param1.readInteger();
         var_159 = param1.readInteger();
         return true;
      }
      
      public function get furniId() : int
      {
         return var_490;
      }
      
      public function get videoId() : String
      {
         return var_1321;
      }
      
      public function get startAtSeconds() : int
      {
         return var_1273;
      }
      
      public function get endAtSeconds() : int
      {
         return var_1099;
      }
      
      public function get state() : int
      {
         return var_159;
      }
   }
}
