package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_424 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_424(param1:int, param2:int)
      {
         super();
         var_20 = [param1,param2];
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
      }
      
      public function dispose() : void
      {
         var_20 = null;
      }
   }
}
