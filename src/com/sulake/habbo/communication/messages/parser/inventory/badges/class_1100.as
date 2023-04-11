package package_153
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1100 implements IMessageParser
   {
       
      
      private var var_484:int;
      
      private var var_331:String;
      
      public function class_1100()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_484 = param1.readInteger();
         var_331 = param1.readString();
         return true;
      }
      
      public function get badgeId() : int
      {
         return var_484;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
   }
}
