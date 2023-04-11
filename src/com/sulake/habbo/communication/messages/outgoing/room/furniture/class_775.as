package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_775 implements IMessageComposer
   {
       
      
      private var var_490:int;
      
      public function class_775(param1:int)
      {
         super();
         var_490 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_490];
      }
      
      public function dispose() : void
      {
      }
   }
}
