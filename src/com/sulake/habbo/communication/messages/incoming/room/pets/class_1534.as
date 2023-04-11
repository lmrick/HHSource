package package_41
{
   [SecureSWF(rename="true")]
   public class class_1534
   {
       
      
      private var _stuffId:int;
      
      private var var_385:int;
      
      private var var_343:String;
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var var_784:int;
      
      private var var_1030:Boolean;
      
      public function class_1534(param1:int, param2:int, param3:String, param4:int, param5:String, param6:int, param7:Boolean)
      {
         super();
         _stuffId = param1;
         var_385 = param2;
         var_343 = param3;
         var_339 = param4;
         _userName = param5;
         var_784 = param6;
         var_1030 = param7;
      }
      
      public function get stuffId() : int
      {
         return _stuffId;
      }
      
      public function get classId() : int
      {
         return var_385;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get rarityLevel() : int
      {
         return var_784;
      }
      
      public function get hasMutation() : Boolean
      {
         return var_1030;
      }
   }
}
