package package_90
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_394 implements IMessageComposer
   {
       
      
      private var var_1255:int;
      
      public function class_394(param1:int)
      {
         super();
         var_1255 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1255];
      }
   }
}
