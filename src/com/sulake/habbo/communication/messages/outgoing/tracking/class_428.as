package package_49
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_428 implements IMessageComposer
   {
       
      
      private var var_247:int = 0;
      
      public function class_428(param1:int)
      {
         super();
         var_247 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_247];
      }
      
      public function dispose() : void
      {
      }
   }
}
