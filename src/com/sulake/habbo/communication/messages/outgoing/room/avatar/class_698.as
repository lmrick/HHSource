package package_34
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_698 implements IMessageComposer
   {
       
      
      private var var_904:String;
      
      public function class_698(param1:String)
      {
         super();
         var_904 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_904];
      }
   }
}
