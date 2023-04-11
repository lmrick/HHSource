package package_59
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_478 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_478(param1:Array, param2:int)
      {
         var _loc3_:int = 0;
         var_20 = [];
         super();
         this.var_20.push(param2);
         this.var_20.push(param1.length);
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            this.var_20.push(param1[_loc3_]);
            _loc3_++;
         }
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
