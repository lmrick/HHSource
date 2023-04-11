package package_84
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_124.class_1051;
   
   public class class_337 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_337(param1:Function)
      {
         super(param1,class_1051);
      }
      
      public function getParser() : class_1051
      {
         return this.var_15 as class_1051;
      }
   }
}
