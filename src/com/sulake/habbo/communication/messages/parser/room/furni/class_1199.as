package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1199 implements IMessageParser
   {
       
      
      private var var_399:int;
      
      private var _location:String;
      
      public function class_1199()
      {
         super();
      }
      
      public function get itemId() : int
      {
         return var_399;
      }
      
      public function get location() : String
      {
         return _location;
      }
      
      public function flush() : Boolean
      {
         var_399 = -1;
         _location = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_399 = param1.readInteger();
         _location = param1.readString();
         return true;
      }
   }
}
