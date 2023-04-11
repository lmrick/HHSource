package package_175
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1382 implements IMessageParser
   {
       
      
      private var _items:class_24;
      
      public function class_1382()
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
         var _loc4_:int = 0;
         var _loc2_:class_1616 = null;
         _items = new class_24();
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = new class_1616(param1);
            _items.add(_loc2_.id,_loc2_);
            _loc4_++;
         }
         return true;
      }
      
      public function get items() : class_24
      {
         return _items;
      }
   }
}
