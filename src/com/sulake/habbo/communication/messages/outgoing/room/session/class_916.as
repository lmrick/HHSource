package package_22
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_916 implements IMessageComposer
   {
       
      
      private var var_357:Array;
      
      public function class_916(param1:int, param2:String = "", param3:int = -1)
      {
         super();
         var_357 = [param1,param2,param3];
      }
      
      public function dispose() : void
      {
         var_357 = null;
      }
      
      public function getMessageArray() : Array
      {
         return var_357;
      }
   }
}
