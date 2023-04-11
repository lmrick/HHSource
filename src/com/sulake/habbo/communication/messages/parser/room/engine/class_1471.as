package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   import package_17.class_1600;
   
   [SecureSWF(rename="true")]
   public class class_1471 implements IMessageParser
   {
       
      
      private var _items:Array;
      
      public function class_1471()
      {
         _items = [];
         super();
      }
      
      public function flush() : Boolean
      {
         _items = [];
         return true;
      }
      
      public function getItemCount() : int
      {
         return _items.length;
      }
      
      public function getItem(param1:int) : class_1600
      {
         if(param1 < 0 || param1 >= getItemCount())
         {
            return null;
         }
         var _loc2_:class_1600 = _items[param1] as class_1600;
         if(_loc2_ != null)
         {
            _loc2_.setReadOnly();
         }
         return _loc2_;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:String = null;
         var _loc2_:class_1600 = null;
         if(param1 == null)
         {
            return false;
         }
         _items = [];
         var _loc6_:class_24 = new class_24();
         var _loc4_:int = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = param1.readInteger();
            _loc3_ = param1.readString();
            _loc6_.add(_loc7_,_loc3_);
            _loc5_++;
         }
         var _loc8_:int = param1.readInteger();
         class_14.log("We have: " + _loc8_ + " items");
         _loc5_ = 0;
         while(_loc5_ < _loc8_)
         {
            _loc2_ = class_1638.parseItemData(param1);
            _loc2_.ownerName = _loc6_.getValue(_loc2_.ownerId);
            _items.push(_loc2_);
            _loc5_++;
         }
         return true;
      }
   }
}
