package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1077 implements IMessageParser
   {
       
      
      private var var_159:int;
      
      private var var_392:int;
      
      private var var_493:int;
      
      public function class_1077()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_159 = -1;
         var_392 = -1;
         var_493 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_159 = param1.readInteger();
         var_392 = param1.readInteger();
         var_493 = param1.readInteger();
         return true;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get userCount() : int
      {
         return var_392;
      }
      
      public function get userCountGoal() : int
      {
         return var_493;
      }
   }
}
