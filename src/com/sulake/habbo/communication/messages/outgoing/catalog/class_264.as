package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_264 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_264(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int)
      {
         var_45 = [];
         super();
         var_45 = [param1,param2,param3,param4,param5,param6];
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
   }
}
