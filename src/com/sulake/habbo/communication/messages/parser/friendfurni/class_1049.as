package package_122
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1049 implements IMessageParser
   {
       
      
      private var _stuffId:int;
      
      private var var_360:Boolean;
      
      public function class_1049()
      {
         super();
      }
      
      public function get stuffId() : int
      {
         return _stuffId;
      }
      
      public function get isOwner() : Boolean
      {
         return var_360;
      }
      
      public function flush() : Boolean
      {
         _stuffId = -1;
         var_360 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _stuffId = param1.readInteger();
         var_360 = param1.readBoolean();
         return true;
      }
   }
}
