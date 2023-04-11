package package_137
{
   import com.sulake.core.runtime.class_13;
   import flash.utils.getTimer;
   
   [SecureSWF(rename="true")]
   public class class_1612 implements class_13
   {
      
      public static const STATE_OPEN:int = 1;
      
      public static const const_269:int = 2;
      
      public static const const_369:int = 3;
       
      
      private var var_575:int;
      
      private var var_159:int;
      
      private var var_415:int;
      
      private var var_843:int;
      
      private var var_605:Number;
      
      private var _priority:int;
      
      private var var_697:int;
      
      private var var_1153:int;
      
      private var var_770:String;
      
      private var var_1145:int;
      
      private var _reportedUserName:String;
      
      private var var_1020:int;
      
      private var var_795:String;
      
      private var var_357:String;
      
      private var var_1003:int;
      
      private var var_244:Array;
      
      private var var_311:Boolean = false;
      
      private var var_1166:Number;
      
      public function class_1612(param1:int, param2:int, param3:int, param4:int, param5:Number, param6:int, param7:int, param8:int, param9:String, param10:int, param11:String, param12:int, param13:String, param14:String, param15:int, param16:Array)
      {
         super();
         var_575 = param1;
         var_159 = param2;
         var_415 = param3;
         var_843 = param4;
         var_605 = param5;
         _priority = param6;
         var_697 = param7;
         var_1153 = param8;
         var_770 = param9;
         var_1145 = param10;
         _reportedUserName = param11;
         var_1020 = param12;
         var_795 = param13;
         var_357 = param14;
         var_1003 = param15;
         var_244 = param16;
         var_1166 = getTimer();
      }
      
      public function get issueId() : int
      {
         return var_575;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get categoryId() : int
      {
         return var_415;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_843;
      }
      
      public function get issueAgeInMilliseconds() : Number
      {
         return var_605;
      }
      
      public function get priority() : int
      {
         return _priority;
      }
      
      public function get groupingId() : int
      {
         return var_697;
      }
      
      public function get reporterUserId() : int
      {
         return var_1153;
      }
      
      public function get reporterUserName() : String
      {
         return var_770;
      }
      
      public function get reportedUserId() : int
      {
         return var_1145;
      }
      
      public function get reportedUserName() : String
      {
         return _reportedUserName;
      }
      
      public function get pickerUserId() : int
      {
         return var_1020;
      }
      
      public function get pickerUserName() : String
      {
         return var_795;
      }
      
      public function get message() : String
      {
         return var_357;
      }
      
      public function get chatRecordId() : int
      {
         return var_1003;
      }
      
      public function get patterns() : Array
      {
         return var_244;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         for each(var _loc1_ in var_244)
         {
            _loc1_.dispose();
         }
         var_244 = [];
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc5_:int;
         var _loc7_:int;
         var _loc6_:int = (_loc5_ = (_loc7_ = (var_605 + param1 - var_1166) / 1000) / 60) % 60;
         var _loc4_:int = _loc5_ / 60;
         var _loc2_:String = (_loc6_ < 10 ? "0" : "") + _loc6_;
         var _loc3_:String = (_loc4_ < 10 ? "0" : "") + _loc4_;
         return _loc3_ + ":" + _loc2_;
      }
   }
}
