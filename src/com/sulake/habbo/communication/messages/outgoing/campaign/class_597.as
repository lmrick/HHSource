package package_89
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_597 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_597(param1:String, param2:int)
      {
         var_20 = [];
         super();
         var_20.push(param1);
         var_20.push(param2);
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
