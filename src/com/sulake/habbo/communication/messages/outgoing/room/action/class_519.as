package package_62
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_519 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_519(param1:Array)
      {
         var _loc2_:int = 0;
         var_20 = [];
         super();
         this.var_20.push(param1.length);
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            this.var_20.push(param1[_loc2_]);
            _loc2_++;
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
