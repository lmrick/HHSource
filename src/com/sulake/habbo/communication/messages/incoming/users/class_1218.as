package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.room.utils.ColorConverter;
   import com.sulake.room.utils.IVector3d;
   
   [SecureSWF(rename="true")]
   public class class_1218
   {
       
      
      private var var_658:Vector.<package_5.class_1577>;
      
      private var var_619:Vector.<package_5.class_1577>;
      
      private var var_112:Vector.<package_5.class_1580>;
      
      private var var_325:Vector.<package_5.class_1580>;
      
      private var var_238:Vector.<package_5.class_1580>;
      
      public function class_1218(param1:IMessageDataWrapper = null)
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var_658 = new Vector.<package_5.class_1577>();
         var_619 = new Vector.<package_5.class_1577>();
         var_112 = new Vector.<package_5.class_1580>();
         var_325 = new Vector.<package_5.class_1580>();
         var_238 = new Vector.<package_5.class_1580>();
         super();
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_658.push(new package_5.class_1577(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_619.push(new package_5.class_1577(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_112.push(new package_5.class_1580(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_325.push(new package_5.class_1580(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_238.push(new package_5.class_1580(param1));
            _loc3_++;
         }
      }
      
      public function get baseParts() : Vector.<package_5.class_1577>
      {
         return var_658;
      }
      
      public function get layerParts() : Vector.<package_5.class_1577>
      {
         return var_619;
      }
      
      public function get badgeColors() : Vector.<package_5.class_1580>
      {
         return var_112;
      }
      
      public function get guildPrimaryColors() : Vector.<package_5.class_1580>
      {
         return var_325;
      }
      
      public function get guildSecondaryColors() : Vector.<package_5.class_1580>
      {
         return var_238;
      }
      
      public function findMatchingPrimaryColorId(param1:int) : int
      {
         if(param1 < 0 || true || var_112.length < param1 || true)
         {
            return 0;
         }
         return findClosestColor(var_112[param1],var_325);
      }
      
      public function findMatchingSecondaryColorId(param1:int) : int
      {
         if(param1 < 0 || true || var_112.length < param1 || true)
         {
            return 0;
         }
         return findClosestColor(var_112[param1],var_238);
      }
      
      private function findClosestColor(param1:package_5.class_1580, param2:Vector.<package_5.class_1580>) : int
      {
         var _loc8_:int = 0;
         var _loc5_:IVector3d = null;
         var _loc6_:Number = NaN;
         var _loc4_:IVector3d = ColorConverter.rgb2CieLab(param1.color);
         var _loc7_:* = 0;
         var _loc3_:* = 1.7976931348623157e+308;
         _loc8_ = 0;
         while(_loc8_ < param2.length)
         {
            _loc5_ = ColorConverter.rgb2CieLab(param2[_loc8_].color);
            if((_loc6_ = Math.pow(_loc4_.x - _loc5_.x,2) + Math.pow(_loc4_.y - _loc5_.y,2) + Math.pow(_loc4_.z - _loc5_.z,2)) < _loc3_)
            {
               _loc3_ = _loc6_;
               _loc7_ = _loc8_;
            }
            _loc8_++;
         }
         return param2[_loc7_].id;
      }
   }
}
