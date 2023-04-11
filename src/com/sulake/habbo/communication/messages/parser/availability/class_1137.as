package package_161
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1137 implements IMessageParser
   {
       
      
      private var var_832:Boolean;
      
      private var var_947:int;
      
      private var _duration:int = 15;
      
      public function class_1137()
      {
         super();
      }
      
      public function get isInMaintenance() : Boolean
      {
         return var_832;
      }
      
      public function get minutesUntilMaintenance() : int
      {
         return var_947;
      }
      
      public function get duration() : int
      {
         return _duration;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_832 = param1.readBoolean();
         var_947 = param1.readInteger();
         if(param1.bytesAvailable)
         {
            _duration = param1.readInteger();
         }
         return true;
      }
   }
}
