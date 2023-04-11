package package_6
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_133.class_1469;

   public class class_218 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_218(param1:Function)
      {
         super(param1,class_1469);
      }
      
      private function getParser() : class_1469
      {
         return this.var_15 as class_1469;
      }
      
      public function get machineID() : String
      {
         return getParser().machineID;
      }
   }
}
