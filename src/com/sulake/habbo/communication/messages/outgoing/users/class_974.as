package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_974 implements IMessageComposer
   {
       
      
      private var var_445:int;
      
      public function class_974(param1:int)
      {
         super();
         var_445 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_445];
      }
      
      public function dispose() : void
      {
      }
   }
}
