package package_33
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_167 implements IMessageComposer, class_13
   {
       
      
      private var var_152:Array;
      
      public function class_167()
      {
         var_152 = [];
         super();
      }
      
      public function getMessageArray() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:* = [];
         if(this.var_152.length == 0)
         {
            _loc1_.push(true);
            _loc1_.push(0);
         }
         else
         {
            _loc1_.push(false);
            _loc1_.push(this.var_152.length);
            _loc2_ = 0;
            while(_loc2_ < this.var_152.length)
            {
               _loc1_.push(this.var_152[_loc2_]);
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      public function addDeclinedRequest(param1:int) : void
      {
         this.var_152.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_152 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
