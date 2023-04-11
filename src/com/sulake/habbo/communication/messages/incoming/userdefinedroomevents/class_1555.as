package package_79
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1555 extends class_1554
   {
       
      
      private var var_271:int;
      
      public function class_1555(param1:IMessageDataWrapper)
      {
         super(param1);
         var_271 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      override public function get code() : int
      {
         return var_271;
      }
   }
}
