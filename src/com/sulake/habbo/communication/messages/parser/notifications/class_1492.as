package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1492 implements IMessageParser
   {
       
      
      private var _items:class_24;
      
      public function class_1492()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(_items)
         {
            _items.dispose();
            _items = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         _items = new class_24();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readInteger();
            _loc6_ = [];
            _loc7_ = param1.readInteger();
            _loc4_ = 0;
            while(_loc4_ < _loc7_)
            {
               _loc6_.push(param1.readInteger());
               _loc4_++;
            }
            _items.add(_loc5_,_loc6_);
            _loc3_++;
         }
         return true;
      }
      
      public function getCategories() : Array
      {
         return _items.getKeys();
      }
      
      public function getItemsByCategory(param1:int) : Array
      {
         return _items.getValue(param1);
      }
   }
}
