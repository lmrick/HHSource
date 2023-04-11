package package_158
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1414 implements IMessageParser
   {
       
      
      private var var_247:int = -1;
      
      private var var_271:String = "";
      
      private var _headline:String = "";
      
      private var var_536:String = "";
      
      public function class_1414()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get headline() : String
      {
         return _headline;
      }
      
      public function get summary() : String
      {
         return var_536;
      }
      
      public function flush() : Boolean
      {
         var_247 = -1;
         var_271 = "";
         var_536 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_247 = param1.readInteger();
         var_271 = param1.readString();
         _headline = param1.readString();
         var_536 = param1.readString();
         return true;
      }
   }
}
