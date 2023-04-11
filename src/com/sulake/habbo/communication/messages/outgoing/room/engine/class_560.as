package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_560 implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_894:int = 0;
      
      public function class_560(param1:int, param2:int = 0)
      {
         super();
         var_347 = param1;
         var_894 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_347,var_894];
      }
   }
}
