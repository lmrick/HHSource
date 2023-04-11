package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1332 implements IMessageParser
   {
       
      
      private var var_470:int = -1;
      
      private var var_1094:String;
      
      private var var_357:String;
      
      public function class_1332()
      {
         super();
      }
      
      public function get typeCode() : int
      {
         return var_470;
      }
      
      public function get avatarId() : String
      {
         return var_1094;
      }
      
      public function get message() : String
      {
         return var_357;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1094 = param1.readString();
         var_470 = param1.readInteger();
         var_357 = param1.readString();
         return true;
      }
   }
}
