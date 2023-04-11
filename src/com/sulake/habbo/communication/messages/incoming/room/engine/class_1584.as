package package_17
{
   import com.sulake.room.utils.Vector3d;
   
   [SecureSWF(rename="true")]
   public class class_1584
   {
      
      public static const const_270:String = "mv";
      
      public static const const_216:String = "sld";
       
      
      private var var_247:int = 0;
      
      private var var_537:Vector3d;
      
      private var var_319:Vector3d;
      
      private var var_523:String;
      
      private var var_25:Boolean = false;
      
      public function class_1584(param1:int, param2:Vector3d, param3:Vector3d, param4:String = null)
      {
         super();
         var_247 = param1;
         var_537 = param2;
         var_319 = param3;
         var_523 = param4;
      }
      
      public function setReadOnly() : void
      {
         var_25 = true;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get loc() : Vector3d
      {
         return var_537;
      }
      
      public function set loc(param1:Vector3d) : void
      {
         if(!var_25)
         {
            var_537 = param1;
         }
      }
      
      public function get target() : Vector3d
      {
         return var_319;
      }
      
      public function set target(param1:Vector3d) : void
      {
         if(!var_25)
         {
            var_319 = param1;
         }
      }
      
      public function get moveType() : String
      {
         return var_523;
      }
      
      public function set moveType(param1:String) : void
      {
         if(!var_25)
         {
            var_523 = param1;
         }
      }
   }
}
