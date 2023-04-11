package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1408 implements IMessageParser
   {
       
      
      private var var_1323:int;
      
      private var var_330:String;
      
      private var var_1364:int;
      
      private var var_1271:String;
      
      public function class_1408()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1323 = param1.readInteger();
         this.var_330 = param1.readString();
         this.var_1364 = param1.readInteger();
         if(param1.bytesAvailable)
         {
            this.var_1271 = param1.readString();
         }
         return true;
      }
      
      public function get senderId() : int
      {
         return this.var_1323;
      }
      
      public function get messageText() : String
      {
         return this.var_330;
      }
      
      public function get secondsSinceSent() : int
      {
         return var_1364;
      }
      
      public function get extraData() : String
      {
         return var_1271;
      }
   }
}
