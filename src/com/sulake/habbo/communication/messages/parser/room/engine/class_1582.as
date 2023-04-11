package package_154
{
   import com.sulake.room.utils.Vector3d;
   
   [SecureSWF(rename="true")]
   public class class_1582
   {
       
      
      private var var_490:int;
      
      private var var_680:Vector3d;
      
      private var var_319:Vector3d;
      
      public function class_1582(param1:int, param2:Vector3d, param3:Vector3d)
      {
         super();
         var_490 = param1;
         var_680 = param2;
         var_319 = param3;
      }
      
      public function get furniId() : int
      {
         return var_490;
      }
      
      public function get source() : Vector3d
      {
         return var_680;
      }
      
      public function get target() : Vector3d
      {
         return var_319;
      }
   }
}
