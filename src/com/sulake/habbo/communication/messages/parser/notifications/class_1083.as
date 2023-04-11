package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1083 implements IMessageParser
   {
       
      
      private var var_348:String;
      
      private var var_385:int;
      
      private var _name:String;
      
      private var _description:String;
      
      public function class_1083()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_348 = null;
         var_385 = 0;
         _name = null;
         _description = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_348 = param1.readString();
         var_385 = param1.readInteger();
         _name = param1.readString();
         _description = param1.readString();
         return true;
      }
      
      public function get contentType() : String
      {
         return var_348;
      }
      
      public function get classId() : int
      {
         return var_385;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return _description;
      }
   }
}
