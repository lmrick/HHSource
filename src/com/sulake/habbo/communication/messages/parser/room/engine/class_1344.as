package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   import package_17.class_1652;
   
   [SecureSWF(rename="true")]
   public class class_1344 implements IMessageParser
   {
       
      
      private var var_129:Array;
      
      public function class_1344()
      {
         var_129 = [];
         super();
      }
      
      public function flush() : Boolean
      {
         var_129 = [];
         return true;
      }
      
      public function getObjectCount() : int
      {
         return var_129.length;
      }
      
      public function getObject(param1:int) : class_1652
      {
         if(param1 < 0 || param1 >= getObjectCount())
         {
            return null;
         }
         var _loc2_:class_1652 = var_129[param1] as class_1652;
         if(_loc2_ != null)
         {
            _loc2_.setReadOnly();
         }
         return _loc2_;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:String = null;
         var _loc8_:class_1652 = null;
         if(param1 == null)
         {
            return false;
         }
         var_129 = [];
         var _loc5_:class_24 = new class_24();
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = param1.readInteger();
            _loc2_ = param1.readString();
            _loc5_.add(_loc6_,_loc2_);
            _loc4_++;
         }
         var _loc7_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc7_)
         {
            if((_loc8_ = class_1538.parseObjectData(param1)) != null)
            {
               _loc8_.ownerName = _loc5_.getValue(_loc8_.ownerId);
               var_129.push(_loc8_);
            }
            _loc4_++;
         }
         return true;
      }
   }
}
