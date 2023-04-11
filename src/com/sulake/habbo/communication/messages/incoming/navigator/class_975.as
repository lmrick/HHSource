package package_11
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_132.class_1441;
   
   [SecureSWF(rename="true")]
   public class class_975 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_975(param1:Function)
      {
         super(param1,class_1441);
      }
      
      public function getParser() : class_1441
      {
         return var_15 as class_1441;
      }
   }
}
