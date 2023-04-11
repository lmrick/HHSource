package package_49
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_203 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_203(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_20 = [param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11];
      }
      
      public function dispose() : void
      {
         var_20 = null;
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
      }
   }
}
