package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_199 implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      public function class_199(param1:int)
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
