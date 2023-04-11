package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_282 implements IMessageComposer
   {
       
      
      private var var_341:int;
      
      public function class_282(param1:int)
      {
         super();
         var_341 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_341];
      }
   }
}
