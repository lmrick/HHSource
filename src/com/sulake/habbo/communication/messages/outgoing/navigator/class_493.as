package package_2
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_493 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_493(param1:String, param2:String, param3:String, param4:int, param5:int, param6:int)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
         this.var_20.push(param2);
         this.var_20.push(param3);
         this.var_20.push(param4);
         this.var_20.push(param5);
         this.var_20.push(param6);
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
