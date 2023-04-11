package package_170
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1251 implements IMessageParser
   {
       
      
      private var var_413:int;
      
      private var var_346:int;
      
      private var var_578:String;
      
      public function class_1251()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_346 = param1.readInteger();
         var_413 = param1.readInteger();
         var_578 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_413 = 0;
         var_346 = 0;
         var_578 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_413;
      }
      
      public function get messageId() : int
      {
         return var_346;
      }
      
      public function get timestamp() : String
      {
         return var_578;
      }
   }
}
