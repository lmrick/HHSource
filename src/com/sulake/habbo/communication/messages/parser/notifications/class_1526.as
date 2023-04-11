package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1526 implements IMessageParser
   {
       
      
      private var _amount:int = 0;
      
      private var var_856:int = 0;
      
      private var var_271:int;
      
      public function class_1526()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _amount = param1.readInteger();
         var_856 = param1.readInteger();
         var_271 = param1.readInteger();
         return true;
      }
      
      public function get amount() : int
      {
         return _amount;
      }
      
      public function get change() : int
      {
         return var_856;
      }
      
      public function get type() : int
      {
         return var_271;
      }
   }
}
