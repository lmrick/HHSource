package package_6
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_133.class_1098;
   
   public class class_133 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_133(param1:Function)
      {
         super(param1,class_1098);
      }
      
      public function get encryptedPrime() : String
      {
         return (this.var_15 as class_1098).encryptedPrime;
      }
      
      public function get encryptedGenerator() : String
      {
         return (this.var_15 as class_1098).encryptedGenerator;
      }
   }
}
