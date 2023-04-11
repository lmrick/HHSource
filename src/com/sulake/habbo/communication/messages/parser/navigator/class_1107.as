package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1107 implements IMessageParser
   {
       
      
      private var var_496:String;
      
      private var var_687:int;
      
      public function class_1107()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_496 = param1.readString();
         var_687 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_496 = null;
         return true;
      }
      
      public function get globalId() : String
      {
         return var_496;
      }
      
      public function get convertedId() : int
      {
         return var_687;
      }
   }
}
