package package_6
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_133.class_1063;

   public class class_1036 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1036(param1:Function)
      {
         super(param1,class_1063);
      }
      
      public function getParser() : class_1063
      {
         return this.var_15 as class_1063;
      }
   }
}
