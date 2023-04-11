package package_160
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1173 implements IMessageParser
   {
       
      
      private var _flatId:int = 0;
      
      private var var_1362:int = 0;
      
      public function class_1173()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this._flatId = param1.readInteger();
         this.var_1362 = param1.readInteger();
         return true;
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get roomControllerLevel() : int
      {
         return var_1362;
      }
   }
}
