package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_371 implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_748:String;
      
      public function class_371(param1:int, param2:String)
      {
         super();
         var_347 = param1;
         var_748 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [var_347,var_748];
      }
      
      public function dispose() : void
      {
      }
   }
}
