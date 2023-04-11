package package_57
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_355 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_355(param1:int, param2:Array, param3:String, param4:Array, param5:int)
      {
         var_20 = [];
         super();
         var_20.push(param1);
         var_20.push(param2.length);
         for each(var _loc7_ in param2)
         {
            var_20.push(_loc7_);
         }
         var_20.push(param3);
         var_20.push(param4.length);
         for each(var _loc6_ in param4)
         {
            var_20.push(_loc6_);
         }
         var_20.push(param5);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_20;
      }
      
      public function dispose() : void
      {
         this.var_20 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
