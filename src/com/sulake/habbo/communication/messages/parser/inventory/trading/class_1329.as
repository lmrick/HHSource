package package_125
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1329 implements IMessageParser
   {
      
      public static const const_370:int = 7;
      
      public static const const_247:int = 8;
       
      
      private var var_305:int;
      
      private var _otherUserName:String;
      
      public function class_1329()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_305 = param1.readInteger();
         _otherUserName = param1.readString();
         return true;
      }
      
      public function get reason() : int
      {
         return var_305;
      }
      
      public function get otherUserName() : String
      {
         return _otherUserName;
      }
   }
}
