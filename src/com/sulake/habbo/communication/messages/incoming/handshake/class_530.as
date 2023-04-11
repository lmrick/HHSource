package package_6
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_133.class_1188;
   
   public class class_530 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_530(param1:Function)
      {
         super(param1,class_1188);
      }
      
      public function getParser() : class_1188
      {
         return this.var_15 as class_1188;
      }
   }
}
