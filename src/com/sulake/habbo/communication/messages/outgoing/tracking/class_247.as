package package_49
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_247 implements IMessageComposer
   {
       
      
      private var var_1062:int;
      
      public function class_247(param1:int)
      {
         super();
         var_1062 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1062];
      }
      
      public function dispose() : void
      {
      }
   }
}
