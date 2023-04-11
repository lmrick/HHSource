package package_63
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_163.class_1458;
   
   [SecureSWF(rename="true")]
   public class class_235 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_235(param1:Function)
      {
         super(param1,class_1458);
      }
      
      public function getParser() : class_1458
      {
         return var_15 as class_1458;
      }
   }
}
