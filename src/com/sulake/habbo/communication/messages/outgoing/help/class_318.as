package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_318 implements IMessageComposer, class_13
   {
       
      
      private var var_45:Array;
      
      private var _disposed:Boolean = false;
      
      public function class_318(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean)
      {
         var_45 = [];
         super();
         var_45 = [param1,param2,param3,param4];
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
