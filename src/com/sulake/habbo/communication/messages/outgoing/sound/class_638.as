package package_15
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_638 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_638()
      {
         var_20 = [];
         super();
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
