package package_97
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_167.class_1373;
   
   [SecureSWF(rename="true")]
   public class class_409 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_409(param1:Function)
      {
         super(param1,class_1373);
      }
      
      public function getParser() : class_1373
      {
         return var_15 as class_1373;
      }
   }
}
