package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1343 implements IMessageParser
   {
       
      
      private var var_170:int;
      
      private var _name:String;
      
      public function class_1343()
      {
         super();
         var_170 = -1;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_170 = param1.readInteger();
         _name = param1.readString();
         return true;
      }
      
      public function get result() : int
      {
         return var_170;
      }
      
      public function get name() : String
      {
         return _name;
      }
   }
}
