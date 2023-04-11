package package_1
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IPreEncryptionMessage;

   public class class_372 implements IMessageComposer, IPreEncryptionMessage
   {
       
      
      private var _publicKey:String;
      
      public function class_372(param1:String)
      {
         super();
         _publicKey = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [_publicKey];
      }
   }
}
