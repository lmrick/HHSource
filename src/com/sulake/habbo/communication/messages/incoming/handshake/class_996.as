package package_6
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_133.class_1255;

   public class class_996 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_996(param1:Function)
      {
         super(param1,class_1255);
      }
      
      public function get encryptedPublicKey() : String
      {
         return (this.var_15 as class_1255).encryptedPublicKey;
      }
      
      public function get serverClientEncryption() : Boolean
      {
         return (this.var_15 as class_1255).serverClientEncryption;
      }
   }
}
