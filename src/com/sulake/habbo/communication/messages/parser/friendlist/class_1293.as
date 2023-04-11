package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1293 implements IMessageParser
   {
       
      
      private var var_413:int;
      
      private var var_339:int;
      
      private var var_357:String;
      
      public function class_1293()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_413 = param1.readInteger();
         this.var_339 = param1.readInteger();
         this.var_357 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_413;
      }
      
      public function get userId() : int
      {
         return this.var_339;
      }
      
      public function get message() : String
      {
         return this.var_357;
      }
   }
}
