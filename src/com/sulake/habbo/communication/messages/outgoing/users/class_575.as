package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_575 implements IMessageComposer
   {
       
      
      private var var_1068:String;
      
      public function class_575(param1:String)
      {
         super();
         var_1068 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1068];
      }
   }
}
