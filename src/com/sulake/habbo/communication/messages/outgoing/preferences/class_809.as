package package_19
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_809 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_809(param1:Boolean)
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
         return var_20 == null;
      }
   }
}
