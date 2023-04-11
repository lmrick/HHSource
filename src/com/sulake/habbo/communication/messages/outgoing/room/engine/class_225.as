package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_225 implements IMessageComposer
   {
       
      
      private var var_347:int = 0;
      
      public function class_225(param1:int)
      {
         super();
         var_347 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_347];
      }
   }
}
