package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_568 implements IMessageComposer
   {
       
      
      private var var_343:String;
      
      public function class_568(param1:String)
      {
         super();
         var_343 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_343];
      }
      
      public function dispose() : void
      {
         var_343 = null;
      }
   }
}
