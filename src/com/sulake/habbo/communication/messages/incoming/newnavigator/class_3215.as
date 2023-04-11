package package_18
{
   import package_11.class_1569;
   
   [SecureSWF(rename="true")]
   public class class_3215
   {
       
      
      private var var_446:String;
      
      private var var_500:String;
      
      private var var_3460:package_18.class_1548;
      
      public function class_3215(param1:package_18.class_1548)
      {
         super();
         var_446 = param1.searchCodeOriginal;
         var_500 = param1.filteringData;
         var_3460 = param1;
      }
      
      public function get searchCodeOriginal() : String
      {
         return var_446;
      }
      
      public function get filteringData() : String
      {
         return var_500;
      }
      
      public function get resultSet() : package_18.class_1548
      {
         return var_3460;
      }
      
      public function findGuestRoom(param1:int) : class_1569
      {
         if(var_3460 != null)
         {
            return var_3460.findGuestRoom(param1);
         }
         return null;
      }
   }
}
