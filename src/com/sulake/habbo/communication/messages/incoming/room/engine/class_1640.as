package package_17
{
   [SecureSWF(rename="true")]
   public class class_1640
   {
       
      
      private var var_247:int = 0;
      
      private var var_29:Number = 0;
      
      private var var_28:Number = 0;
      
      private var var_30:Number = 0;
      
      private var var_1137:Number = 0;
      
      private var var_839:Number = 0;
      
      private var var_739:Number = 0;
      
      private var var_1122:Number = 0;
      
      private var var_386:int = 0;
      
      private var var_1158:int = 0;
      
      private var var_474:Array;
      
      private var var_1277:Boolean = false;
      
      private var var_1246:Boolean = false;
      
      private var _skipPositionUpdate:Boolean = false;
      
      public function class_1640(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Boolean, param13:Array, param14:Boolean)
      {
         var_474 = [];
         super();
         var_247 = param1;
         var_29 = param2;
         var_28 = param3;
         var_30 = param4;
         var_1137 = param5;
         var_386 = param6;
         var_1158 = param7;
         var_839 = param8;
         var_739 = param9;
         var_1122 = param10;
         var_1277 = param11;
         var_1246 = param12;
         var_474 = param13;
         _skipPositionUpdate = param14;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get x() : Number
      {
         return var_29;
      }
      
      public function get y() : Number
      {
         return var_28;
      }
      
      public function get z() : Number
      {
         return var_30;
      }
      
      public function get localZ() : Number
      {
         return var_1137;
      }
      
      public function get targetX() : Number
      {
         return var_839;
      }
      
      public function get targetY() : Number
      {
         return var_739;
      }
      
      public function get targetZ() : Number
      {
         return var_1122;
      }
      
      public function get dir() : int
      {
         return var_386;
      }
      
      public function get dirHead() : int
      {
         return var_1158;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1277;
      }
      
      public function get canStandUp() : Boolean
      {
         return var_1246;
      }
      
      public function get actions() : Array
      {
         return var_474.slice();
      }
      
      public function get skipPositionUpdate() : Boolean
      {
         return _skipPositionUpdate;
      }
   }
}
