package package_127
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.object.data.class_1588;
   import package_154.class_1538;
   import package_65.class_1590;
   
   [SecureSWF(rename="true")]
   public class class_1235 implements IMessageParser
   {
       
      
      private const const_290:int = 500;
      
      private var _offers:Array;
      
      private var var_1253:int;
      
      public function class_1235()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _offers = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc11_:int = 0;
         var _loc13_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc9_:IStuffData = null;
         var _loc10_:int = 0;
         var _loc7_:int = 0;
         var _loc12_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:class_1590 = null;
         _offers = [];
         var _loc5_:String = "";
         var_1253 = param1.readInteger();
         var _loc8_:int = param1.readInteger();
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc11_ = param1.readInteger();
            _loc13_ = param1.readInteger();
            _loc2_ = param1.readInteger();
            if(_loc2_ == 1)
            {
               _loc4_ = param1.readInteger();
               _loc9_ = class_1538.parseStuffData(param1);
            }
            else if(_loc2_ == 2)
            {
               _loc4_ = param1.readInteger();
               _loc5_ = param1.readString();
            }
            else if(_loc2_ == 3)
            {
               _loc4_ = param1.readInteger();
               (_loc9_ = class_1588.getStuffDataWrapperForType(0)).uniqueSerialNumber = param1.readInteger();
               _loc9_.uniqueSeriesSize = param1.readInteger();
               _loc2_ = 1;
            }
            _loc10_ = param1.readInteger();
            _loc7_ = param1.readInteger();
            _loc12_ = param1.readInteger();
            _loc3_ = new class_1590(_loc11_,_loc4_,_loc2_,_loc5_,_loc9_,_loc10_,_loc13_,_loc7_,_loc12_);
            if(_loc6_ < 500)
            {
               _offers.push(_loc3_);
            }
            _loc6_++;
         }
         return true;
      }
      
      public function get offers() : Array
      {
         return _offers;
      }
      
      public function get creditsWaiting() : int
      {
         return var_1253;
      }
   }
}
