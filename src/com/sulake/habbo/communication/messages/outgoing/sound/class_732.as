package package_15
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_732 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_732(param1:Array)
      {
         var_20 = [];
         super();
         var_20.push(param1.length);
         for each(var _loc2_ in param1)
         {
            var_20.push(_loc2_);
         }
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
