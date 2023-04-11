package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1356 implements IMessageParser
   {
       
      
      private var _flatId:int;
      
      private var var_1381:Boolean;
      
      public function class_1356()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._flatId = param1.readInteger();
         this.var_1381 = param1.readBoolean();
         return true;
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get added() : Boolean
      {
         return var_1381;
      }
   }
}
