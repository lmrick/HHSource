package package_46
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_200 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_200(param1:int, param2:Array)
      {
         var_20 = [];
         super();
         var_20.push(param1);
         var_20.push(param2.length);
         var_20 = var_20.concat(param2);
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
      }
      
      public function dispose() : void
      {
         var_20 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
