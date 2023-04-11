package package_96
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_398 implements IMessageComposer
   {
       
      
      private var var_341:int;
      
      private var var_763:int;
      
      public function class_398(param1:int, param2:int)
      {
         super();
         var_341 = param1;
         var_763 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_341,var_763];
      }
   }
}
