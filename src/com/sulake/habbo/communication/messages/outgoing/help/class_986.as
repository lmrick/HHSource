package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_986 implements IMessageComposer
   {
       
      
      private var var_327:int;
      
      public function class_986(param1:int)
      {
         super();
         var_327 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_327];
      }
      
      public function dispose() : void
      {
      }
   }
}
