package package_34
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_989 implements IMessageComposer
   {
       
      
      private var var_470:int = 0;
      
      public function class_989(param1:int)
      {
         super();
         var_470 = param1;
      }
      
      public function dispose() : void
      {
         var_470 = 0;
      }
      
      public function getMessageArray() : Array
      {
         return [var_470];
      }
   }
}
