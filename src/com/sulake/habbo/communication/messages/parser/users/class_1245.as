package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1245 implements IMessageParser
   {
       
      
      private var var_170:int;
      
      private var _nameValidationInfo:String;
      
      public function class_1245()
      {
         super();
      }
      
      public function get result() : int
      {
         return var_170;
      }
      
      public function get nameValidationInfo() : String
      {
         return _nameValidationInfo;
      }
      
      public function flush() : Boolean
      {
         var_170 = -1;
         _nameValidationInfo = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_170 = param1.readInteger();
         _nameValidationInfo = param1.readString();
         return true;
      }
   }
}
