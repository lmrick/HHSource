package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_255 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_255(param1:String, param2:int, param3:int, param4:String, param5:int)
      {
         var_20 = [];
         super();
         this.var_20 = [param1,param2,param3,param4,param5];
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
