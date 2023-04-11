package package_6
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_133.class_1368;

   public class class_123 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_123(param1:Function)
      {
         super(param1,class_1368);
      }
      
      public function get noobnessLevel() : int
      {
         return (this.var_15 as class_1368).noobnessLevel;
      }
   }
}
