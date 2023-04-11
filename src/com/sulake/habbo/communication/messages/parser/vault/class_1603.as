package package_167
{
   [SecureSWF(rename="true")]
   public class class_1603
   {
       
      
      private var var_790:int;
      
      private var var_791:int;
      
      private var _amount:int;
      
      private var var_343:String;
      
      public function class_1603(param1:int, param2:int, param3:int, param4:String)
      {
         super();
         var_790 = param1;
         var_791 = param2;
         _amount = param3;
         var_343 = param4;
      }
      
      public function get rewardCategory() : int
      {
         return var_790;
      }
      
      public function get rewardType() : int
      {
         return var_791;
      }
      
      public function get amount() : int
      {
         return _amount;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
   }
}
