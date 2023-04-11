package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1097 implements IMessageParser
   {
       
      
      private var var_347:int = 0;
      
      private var _nameValidationStatus:int = 0;
      
      private var _nameValidationInfo:String = null;
      
      public function class_1097()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get nameValidationStatus() : int
      {
         return _nameValidationStatus;
      }
      
      public function get nameValidationInfo() : String
      {
         return _nameValidationInfo;
      }
      
      public function flush() : Boolean
      {
         var_347 = 0;
         _nameValidationStatus = 0;
         _nameValidationInfo = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_347 = param1.readInteger();
         _nameValidationStatus = param1.readInteger();
         _nameValidationInfo = param1.readString();
         return true;
      }
   }
}
