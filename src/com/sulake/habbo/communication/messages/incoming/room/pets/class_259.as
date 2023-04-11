package package_14
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_144.class_1079;
   
   [SecureSWF(rename="true")]
   public class class_259 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_259(param1:Function)
      {
         super(param1,class_1079);
      }
      
      public function getParser() : class_1079
      {
         return var_15 as class_1079;
      }
   }
}
