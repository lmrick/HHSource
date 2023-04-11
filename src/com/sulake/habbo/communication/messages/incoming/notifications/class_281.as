package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import flash.utils.Dictionary;
   import package_147.class_1252;
   
   [SecureSWF(rename="true")]
   public class class_281 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_281(param1:Function)
      {
         super(param1,class_1252);
      }
      
      public function get points() : Dictionary
      {
         return (var_15 as class_1252).points;
      }
   }
}
