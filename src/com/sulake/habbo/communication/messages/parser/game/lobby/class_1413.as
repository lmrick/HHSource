package package_173
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_101.class_1613;
   
   [SecureSWF(rename="true")]
   public class class_1413 implements IMessageParser
   {
       
      
      private var _stuffId:int;
      
      private var var_246:Vector.<class_1613>;
      
      private var _endTime:int;
      
      public function class_1413()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _stuffId = -1;
         for each(var _loc1_ in var_246)
         {
            _loc1_.dispose();
         }
         var_246 = new Vector.<class_1613>(0);
         _endTime = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         _stuffId = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_246.push(new class_1613(param1));
            _loc2_++;
         }
         _endTime = param1.readInteger();
         return true;
      }
      
      public function get stuffId() : int
      {
         return _stuffId;
      }
      
      public function get achievements() : Vector.<class_1613>
      {
         return var_246;
      }
      
      public function get endTime() : int
      {
         return _endTime;
      }
   }
}
