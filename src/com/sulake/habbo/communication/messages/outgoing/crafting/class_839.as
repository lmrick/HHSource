package package_81
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_839 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_839(param1:int, param2:Vector.<int>)
      {
         var _loc3_:int = 0;
         var_20 = [];
         super();
         var_20.push(param1);
         var_20.push(param2.length);
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            var_20.push(param2[_loc3_]);
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
