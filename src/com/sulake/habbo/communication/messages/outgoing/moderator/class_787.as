package package_59
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_787 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_787(param1:int, param2:Array, param3:int)
      {
         var _loc4_:int = 0;
         var_20 = [];
         super();
         this.var_20.push(param1);
         this.var_20.push(param2.length);
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            this.var_20.push(param2[_loc4_]);
            _loc4_++;
         }
         this.var_20.push(param3);
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
