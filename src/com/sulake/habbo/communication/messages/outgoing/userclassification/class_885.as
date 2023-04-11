package package_87
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_885 implements IMessageComposer
   {
       
      
      private var var_406:String;
      
      public function class_885(param1:String)
      {
         super();
         var_406 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_406];
      }
      
      public function dispose() : void
      {
         var_406 = null;
      }
   }
}
