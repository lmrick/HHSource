package package_150
{
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1530
   {
       
      
      private var _name:String;
      
      private var var_319:int;
      
      private var var_431:class_24;
      
      public function class_1530(param1:String, param2:int)
      {
         super();
         _name = param1;
         var_319 = param2;
         var_431 = new class_24();
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get target() : int
      {
         return var_319;
      }
      
      public function get queueTypes() : Array
      {
         return var_431.getKeys();
      }
      
      public function getQueueSize(param1:String) : int
      {
         return var_431.getValue(param1);
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         var_431.add(param1,param2);
      }
   }
}
