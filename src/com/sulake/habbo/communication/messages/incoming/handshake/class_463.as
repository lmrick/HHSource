package package_6
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_133.class_1284;
   
   public class class_463 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_463(param1:Function)
      {
         super(param1,class_1284);
      }
      
      public function getParser() : class_1284
      {
         return this.var_15 as class_1284;
      }
   }
}
