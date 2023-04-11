package package_5
{
   [SecureSWF(rename="true")]
   public class class_1570
   {
       
      
      private var var_354:int;
      
      private var _roomName:String;
      
      private var var_812:Boolean = false;
      
      public function class_1570(param1:int, param2:String, param3:Boolean)
      {
         super();
         var_354 = param1;
         _roomName = param2;
         var_812 = param3;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get roomName() : String
      {
         return _roomName;
      }
      
      public function get hasControllers() : Boolean
      {
         return var_812;
      }
   }
}
