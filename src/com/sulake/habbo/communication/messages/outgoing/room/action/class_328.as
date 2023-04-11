package package_62
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_328 implements IMessageComposer
   {
       
      
      private var var_357:Array;
      
      public function class_328(param1:String, param2:Boolean)
      {
         super();
         var_357 = [param1,param2];
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
