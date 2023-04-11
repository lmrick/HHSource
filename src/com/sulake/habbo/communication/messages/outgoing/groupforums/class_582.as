package package_20
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_582 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_582()
      {
         var_20 = [0];
         super();
      }
      
      public function add(param1:int, param2:int, param3:Boolean) : void
      {
         var_20.push(param1,param2,param3);
         var_20[0]++;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_20;
      }
      
      public function get size() : int
      {
         return var_20[0];
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
