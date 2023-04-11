package package_142
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_18.class_1586;
   
   [SecureSWF(rename="true")]
   public class class_1433 implements IMessageParser
   {
       
      
      private var _liftedRooms:Vector.<class_1586>;
      
      public function class_1433()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _liftedRooms = new Vector.<class_1586>();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _liftedRooms.push(new class_1586(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get liftedRooms() : Vector.<class_1586>
      {
         return _liftedRooms;
      }
   }
}
