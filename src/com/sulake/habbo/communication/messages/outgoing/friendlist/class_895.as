package package_33
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_895 implements IMessageComposer, class_13
   {
       
      
      private var var_217:Array;
      
      public function class_895()
      {
         var_217 = [];
         super();
      }
      
      public function getMessageArray() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:* = [];
         _loc1_.push(this.var_217.length);
         _loc2_ = 0;
         while(_loc2_ < this.var_217.length)
         {
            _loc1_.push(this.var_217[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function addAcceptedRequest(param1:int) : void
      {
         this.var_217.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_217 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
