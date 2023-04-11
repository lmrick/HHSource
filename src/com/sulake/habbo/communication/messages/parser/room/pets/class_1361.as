package package_134
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1361 implements IMessageParser
   {
       
      
      private var var_732:int;
      
      private var var_865:int;
      
      public function class_1361()
      {
         super();
      }
      
      public function get requiredDays() : int
      {
         return var_732;
      }
      
      public function get avatarAgeInDays() : int
      {
         return var_865;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_732 = param1.readInteger();
         var_865 = param1.readInteger();
         return true;
      }
   }
}
