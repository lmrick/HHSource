package package_134
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1366 implements IMessageParser
   {
       
      
      private var var_783:int;
      
      private var var_421:int;
      
      private var var_262:int;
      
      public function class_1366()
      {
         super();
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_783 = param1.readInteger();
         var_421 = param1.readInteger();
         var_262 = param1.readInteger();
         return true;
      }
   }
}
