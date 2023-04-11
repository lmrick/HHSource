package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_899 implements IMessageComposer
   {
       
      
      private var var_421:int;
      
      public function class_899(param1:int)
      {
         super();
         var_421 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_421];
      }
   }
}
