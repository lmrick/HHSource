package package_76
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_300 implements IMessageComposer
   {
       
      
      private var var_421:int;
      
      public function class_300(param1:int)
      {
         super();
         var_421 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_421];
      }
      
      public function dispose() : void
      {
      }
   }
}
