package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_295 implements IMessageComposer
   {
       
      
      private var var_415:int;
      
      public function class_295(param1:int)
      {
         super();
         var_415 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_415];
      }
      
      public function dispose() : void
      {
      }
   }
}
