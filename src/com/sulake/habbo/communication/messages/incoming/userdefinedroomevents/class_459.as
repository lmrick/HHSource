package package_79
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_143.class_1319;
   
   [SecureSWF(rename="true")]
   public class class_459 extends MessageEvent implements IMessageEvent
   {
      
      public static const const_162:int = 6;
      
      public static const const_254:int = 7;
       
      
      public function class_459(param1:Function)
      {
         super(param1,class_1319);
      }
      
      public function getParser() : class_1319
      {
         return this.var_15 as class_1319;
      }
   }
}
