package package_34
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_701 implements IMessageComposer
   {
       
      
      private var var_339:int;
      
      public function class_701(param1:int)
      {
         super();
         var_339 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_339];
      }
   }
}
