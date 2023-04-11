package package_100
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_122.class_1217;
   
   [SecureSWF(rename="true")]
   public class class_944 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_944(param1:Function)
      {
         super(param1,class_1217);
      }
      
      public function getParser() : class_1217
      {
         return var_15 as class_1217;
      }
   }
}
