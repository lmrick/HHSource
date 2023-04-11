package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_562 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_562(param1:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
   }
}
