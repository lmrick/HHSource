package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_825 implements IMessageComposer, class_13
   {
       
      
      private var var_45:Array;
      
      private var _disposed:Boolean = false;
      
      public function class_825(param1:Boolean)
      {
         var_45 = [];
         super();
         var_45.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = null;
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
   }
}
