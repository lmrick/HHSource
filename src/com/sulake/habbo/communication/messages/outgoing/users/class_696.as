package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_696 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_696(param1:String)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
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