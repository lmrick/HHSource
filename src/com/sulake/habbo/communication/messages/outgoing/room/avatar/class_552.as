package package_34
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_552 implements IMessageComposer
   {
       
      
      private var var_1072:int;
      
      public function class_552(param1:int)
      {
         super();
         var_1072 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1072];
      }
      
      public function dispose() : void
      {
      }
   }
}
