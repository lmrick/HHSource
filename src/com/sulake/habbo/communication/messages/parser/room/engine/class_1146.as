package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.room.IStuffData;
   import package_17.class_1611;
   
   [SecureSWF(rename="true")]
   public class class_1146 implements IMessageParser
   {
       
      
      private var var_129:Array;
      
      public function class_1146()
      {
         var_129 = [];
         super();
      }
      
      public function get objectCount() : int
      {
         return var_129.length;
      }
      
      public function getObjectData(param1:int) : class_1611
      {
         if(param1 < 0 || param1 >= objectCount)
         {
            return null;
         }
         return var_129[param1];
      }
      
      public function flush() : Boolean
      {
         var_129 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:IStuffData = null;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readInteger();
            _loc2_ = class_1538.parseStuffData(param1);
            _loc6_ = 0;
            _loc7_ = parseFloat(_loc2_.getLegacyString());
            if(!isNaN(_loc7_))
            {
               _loc6_ = int(_loc2_.getLegacyString());
            }
            var_129.push(new class_1611(_loc5_,_loc6_,_loc2_));
            _loc4_++;
         }
         return true;
      }
   }
}
