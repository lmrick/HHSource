package package_56
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_158.class_1414;
   
   [SecureSWF(rename="true")]
   public class class_867 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_867(param1:Function)
      {
         super(param1,class_1414);
      }
      
      public function getParser() : class_1414
      {
         return var_15 as class_1414;
      }
   }
}
