package package_2
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_527 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_527(param1:int, param2:Boolean, param3:Boolean)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
         this.var_20.push(param2 ? 1 : 0);
         this.var_20.push(param3 ? 1 : 0);
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
