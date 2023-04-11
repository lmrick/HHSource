package package_154
{
   import com.sulake.room.utils.Vector3d;
   
   [SecureSWF(rename="true")]
   public class class_1648
   {
       
      
      private var var_802:int;
      
      private var var_680:Vector3d;
      
      private var var_319:Vector3d;
      
      private var var_523:String;
      
      public function class_1648(param1:int, param2:Vector3d, param3:Vector3d, param4:String)
      {
         super();
         var_802 = param1;
         var_680 = param2;
         var_319 = param3;
         var_523 = param4;
      }
      
      public function get userIndex() : int
      {
         return var_802;
      }
      
      public function get source() : Vector3d
      {
         return var_680;
      }
      
      public function get target() : Vector3d
      {
         return var_319;
      }
      
      public function get moveType() : String
      {
         return var_523;
      }
   }
}
