package package_31
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1028 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_1028(param1:int)
      {
         var_20 = [];
         super();
         var_20.push(param1);
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
