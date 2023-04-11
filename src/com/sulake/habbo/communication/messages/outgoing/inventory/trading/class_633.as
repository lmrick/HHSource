package package_90
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_633 implements IMessageComposer
   {
       
      
      private var var_889:int;
      
      public function class_633(param1:int)
      {
         super();
         var_889 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_889];
      }
   }
}
