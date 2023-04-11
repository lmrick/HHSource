package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_350 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_350(param1:String, param2:int, param3:int, param4:int, param5:Array)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
         this.var_20.push(param2);
         this.var_20.push(param3);
         this.var_20.push(param4);
         this.var_20.push(param5.length / 2);
         this.var_20 = this.var_20.concat(param5);
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
