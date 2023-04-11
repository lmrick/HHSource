package package_33
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_234 implements IMessageComposer, class_13
   {
       
      
      private var var_200:Array;
      
      public function class_234()
      {
         var_200 = [];
         super();
      }
      
      public function getMessageArray() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:* = [];
         _loc1_.push(this.var_200.length);
         _loc2_ = 0;
         while(_loc2_ < this.var_200.length)
         {
            _loc1_.push(this.var_200[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function addRemovedFriend(param1:int) : void
      {
         this.var_200.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_200 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
