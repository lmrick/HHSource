package package_62
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_499 implements IMessageComposer
   {
       
      
      private var var_339:int;
      
      private var var_354:int = 0;
      
      public function class_499(param1:int, param2:int = 0)
      {
         super();
         var_339 = param1;
         var_354 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_339,var_354];
      }
   }
}
