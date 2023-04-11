package package_149
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.habbo.utils.class_403;
   
   [SecureSWF(rename="true")]
   public class class_1606
   {
      
      public static const STATE_LOCKED:int = 0;
      
      public static const const_64:int = 1;
      
      public static const const_235:int = 2;
       
      
      private var _name:String;
      
      private var var_160:int;
      
      private var var_88:Vector.<package_149.class_1669>;
      
      public function class_1606()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
         var _loc4_:int = 0;
         var _loc3_:package_149.class_1669 = null;
         _name = param1.readString();
         var_88 = new Vector.<package_149.class_1669>();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = new package_149.class_1669();
            _loc3_.parse(param1);
            if(_loc3_.state == 1)
            {
               var_160 = _loc4_;
            }
            var_88.push(_loc3_);
            _loc4_++;
         }
      }
      
      public function findTaskByAchievementId(param1:int) : class_1657
      {
         var _loc3_:class_1657 = null;
         var _loc4_:* = null;
         for each(var _loc2_ in var_88)
         {
            if(_loc2_.state != 0)
            {
               _loc3_ = _loc2_.findTaskByAchievementId(param1);
               if(_loc3_ != null)
               {
                  _loc4_ = _loc3_;
               }
            }
         }
         return _loc4_;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get levels() : Vector.<package_149.class_1669>
      {
         return var_88;
      }
      
      public function get progressPerLevel() : Number
      {
         if(false)
         {
            return Infinity;
         }
         return 0;
      }
      
      public function get totalProgress() : Number
      {
         var _loc1_:Number = NaN;
         if(false)
         {
            _loc1_ = var_88[var_160].levelProgress;
            return class_403.clamp(var_160 * progressPerLevel + _loc1_ * progressPerLevel);
         }
         return 0;
      }
      
      public function get progressForCurrentLevel() : Number
      {
         if(false)
         {
            return var_160 * progressPerLevel;
         }
         return 0;
      }
      
      public function removeFirstLevel() : void
      {
         var_88.shift();
         var_160 = Math.max(0,var_160 - 1);
      }
   }
}
