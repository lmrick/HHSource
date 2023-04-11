package package_17
{
   [SecureSWF(rename="true")]
   public class class_1601
   {
       
      
      private var var_593:String;
      
      private var var_649:String;
      
      public function class_1601(param1:String, param2:String)
      {
         super();
         var_593 = param1;
         var_649 = param2;
      }
      
      public function get actionType() : String
      {
         return var_593;
      }
      
      public function get actionParameter() : String
      {
         return var_649;
      }
      
      public function toString() : String
      {
         return var_593 + ":" + var_649;
      }
   }
}
