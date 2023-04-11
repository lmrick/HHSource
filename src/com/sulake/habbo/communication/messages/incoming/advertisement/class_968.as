package package_84
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_124.class_1393;
   
   public class class_968 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_968(param1:Function)
      {
         super(param1,class_1393);
      }
      
      public function getParser() : class_1393
      {
         return this.var_15 as class_1393;
      }
   }
}
