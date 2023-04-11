package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1313 implements IMessageParser
   {
       
      
      private var var_247:int;
      
      private var _status:int;
      
      public function class_1313()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get status() : int
      {
         return _status;
      }
      
      public function flush() : Boolean
      {
         var_247 = -1;
         _status = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_247 = param1.readInteger();
         _status = param1.readInteger();
         return true;
      }
   }
}
