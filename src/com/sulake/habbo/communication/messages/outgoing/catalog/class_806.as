package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_806 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_806(param1:int, param2:int, param3:String, param4:String)
      {
         var_45 = [];
         super();
         var_45 = [param1,param2,param3,param4];
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
