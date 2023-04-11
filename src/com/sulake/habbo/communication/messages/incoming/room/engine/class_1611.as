package package_17
{
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.object.data.class_1610;
   
   [SecureSWF(rename="true")]
   public class class_1611
   {
       
      
      private var var_247:int = 0;
      
      private var var_159:int = 0;
      
      private var var_45:IStuffData;
      
      public function class_1611(param1:int, param2:int, param3:IStuffData)
      {
         var_45 = new class_1610();
         super();
         var_247 = param1;
         var_159 = param2;
         var_45 = param3;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get data() : IStuffData
      {
         return var_45;
      }
   }
}
