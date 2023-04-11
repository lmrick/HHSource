package package_136
{
   [SecureSWF(rename="true")]
   public class class_1618
   {
       
      
      private var var_1085:String;
      
      private var var_462:String;
      
      private var _description:String;
      
      public function class_1618(param1:String, param2:String, param3:String)
      {
         super();
         var_1085 = param1;
         var_462 = param2;
         _description = param3;
      }
      
      public function get playlistId() : String
      {
         return var_1085;
      }
      
      public function get title() : String
      {
         return var_462;
      }
      
      public function get description() : String
      {
         return _description;
      }
   }
}
