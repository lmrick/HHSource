package package_88
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_1031 implements IMessageComposer
   {
       
      
      private var var_265:Array;
      
      private const const_241:int = 5;
      
      public function class_1031()
      {
         super();
         var_265 = [];
      }
      
      public function addActivatedBadge(param1:String) : void
      {
         if(false)
         {
            return;
         }
         var_265.push(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:* = [];
         _loc2_ = 1;
         while(_loc2_ <= 5)
         {
            if(_loc2_ <= var_265.length)
            {
               _loc1_.push(_loc2_);
               _loc1_.push(var_265[_loc2_ - 1]);
            }
            else
            {
               _loc1_.push(_loc2_);
               _loc1_.push("");
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}
