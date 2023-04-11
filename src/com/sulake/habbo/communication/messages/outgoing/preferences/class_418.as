package package_19
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_418 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_418(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int)
      {
         var_20 = [];
         super();
         var_20.push(param1);
         var_20.push(param2);
         var_20.push(param3);
         var_20.push(param4);
         var_20.push(param5);
         var_20.push(param6);
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
