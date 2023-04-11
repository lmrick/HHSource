package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.object.data.class_1588;
   import package_17.class_1652;
   
   [SecureSWF(rename="true")]
   public class class_1538
   {
       
      
      public function class_1538()
      {
         super();
      }
      
      public static function parseObjectData(param1:IMessageDataWrapper) : class_1652
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = param1.readInteger();
         var _loc5_:class_1652 = new class_1652(_loc2_);
         var _loc3_:int = param1.readInteger();
         _loc5_.type = _loc3_;
         _loc5_.x = param1.readInteger();
         _loc5_.y = param1.readInteger();
         _loc5_.dir = param1.readInteger() % 8 * 45;
         _loc5_.z = Number(param1.readString());
         _loc5_.sizeZ = Number(param1.readString());
         _loc5_.extra = param1.readInteger();
         _loc5_.data = parseStuffData(param1);
         var _loc4_:Number = parseFloat(_loc5_.data.getLegacyString());
         if(!isNaN(_loc4_))
         {
            _loc5_.state = int(_loc5_.data.getLegacyString());
         }
         _loc5_.expiryTime = param1.readInteger();
         _loc5_.usagePolicy = param1.readInteger();
         _loc5_.ownerId = param1.readInteger();
         if(_loc3_ < 0)
         {
            _loc5_.staticClass = param1.readString();
         }
         return _loc5_;
      }
      
      public static function parseStuffData(param1:IMessageDataWrapper) : IStuffData
      {
         var _loc3_:int = param1.readInteger();
         var _loc2_:IStuffData = class_1588.getStuffDataWrapperForType(_loc3_);
         _loc2_.initializeFromIncomingMessage(param1);
         return _loc2_;
      }
   }
}
