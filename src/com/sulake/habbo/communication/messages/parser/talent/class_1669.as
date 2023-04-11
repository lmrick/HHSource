package package_149
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.habbo.utils.class_403;
   
   [SecureSWF(rename="true")]
   public class class_1669
   {
       
      
      private var var_262:int;
      
      private var var_159:int;
      
      private var var_197:Vector.<package_149.class_1657>;
      
      private var var_315:Vector.<package_149.class_1643>;
      
      private var var_304:Vector.<package_149.class_1591>;
      
      public function class_1669()
      {
         var_197 = new Vector.<package_149.class_1657>();
         var_315 = new Vector.<package_149.class_1643>();
         var_304 = new Vector.<package_149.class_1591>();
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var_262 = param1.readInteger();
         var_159 = param1.readInteger();
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_197.push(new package_149.class_1657(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_315.push(new package_149.class_1643(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_304.push(new package_149.class_1591(param1));
            _loc3_++;
         }
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function set level(param1:int) : void
      {
         var_262 = param1;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function set state(param1:int) : void
      {
         var_159 = param1;
      }
      
      public function get tasks() : Vector.<package_149.class_1657>
      {
         return var_197;
      }
      
      public function get rewardPerks() : Vector.<package_149.class_1643>
      {
         return var_315;
      }
      
      public function get rewardProducts() : Vector.<package_149.class_1591>
      {
         return var_304;
      }
      
      public function get rewardCount() : int
      {
         return NaN;
      }
      
      public function get levelProgress() : Number
      {
         var _loc2_:Number = Infinity;
         var _loc3_:Number = 0;
         for each(var _loc1_ in var_197)
         {
            if(_loc1_.state == 2)
            {
               _loc3_ += _loc2_;
            }
         }
         return class_403.clamp(_loc3_);
      }
      
      public function findTaskByAchievementId(param1:int) : package_149.class_1657
      {
         for each(var _loc2_ in var_197)
         {
            if(_loc2_.achievementId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
