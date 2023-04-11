package package_11
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_132.class_1238;
   
   [SecureSWF(rename="true")]
   public class class_790 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_790(param1:Function)
      {
         super(param1,class_1238);
      }
      
      public function get userName() : String
      {
         return (this.var_15 as class_1238).userName;
      }
   }
}
