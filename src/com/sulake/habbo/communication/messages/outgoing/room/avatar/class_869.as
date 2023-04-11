package package_34
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_869 implements IMessageComposer
   {
       
      
      private var var_1302:int;
      
      public function class_869(param1:int)
      {
         super();
         var_1302 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1302];
      }
      
      public function dispose() : void
      {
      }
   }
}
