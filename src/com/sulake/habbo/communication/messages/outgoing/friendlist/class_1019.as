package package_33
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1019 implements IMessageComposer, class_13
   {
       
      
      private var var_212:Array;
      
      private var _msg:String;
      
      public function class_1019(param1:String)
      {
         var_212 = [];
         super();
         this._msg = param1;
      }
      
      public function getMessageArray() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:* = [];
         _loc1_.push(this.var_212.length);
         _loc2_ = 0;
         while(_loc2_ < this.var_212.length)
         {
            _loc1_.push(this.var_212[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this._msg);
         return _loc1_;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_212.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_212 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
