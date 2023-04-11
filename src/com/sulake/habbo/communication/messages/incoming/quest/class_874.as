package package_83
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_139.class_1070;
   
   [SecureSWF(rename="true")]
   public class class_874 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_874(param1:Function)
      {
         super(param1,class_1070);
      }
      
      public function getParser() : class_1070
      {
         return this.var_15 as class_1070;
      }
   }
}
