package package_33
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_841 implements IMessageComposer
   {
       
      
      private var _username:String;
      
      public function class_841(param1:String)
      {
         super();
         _username = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [_username];
      }
      
      public function dispose() : void
      {
         _username = null;
      }
   }
}
