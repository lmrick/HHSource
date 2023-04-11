package package_59
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_999 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_999(param1:Array, param2:Boolean, param3:int, param4:String)
      {
         var _loc5_:int = 0;
         var_20 = [];
         super();
         this.var_20.push(param1.length);
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            this.var_20.push(param1[_loc5_]);
            _loc5_++;
         }
         this.var_20.push(param2);
         this.var_20.push(param3);
         this.var_20.push(param4);
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
