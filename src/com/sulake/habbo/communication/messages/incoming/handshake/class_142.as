package package_6
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_133.class_1347;
   
   public class class_142 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_142(param1:Function)
      {
         super(param1,class_1347);
      }
      
      public function get clubLevel() : int
      {
         return (this.var_15 as class_1347).clubLevel;
      }
      
      public function get securityLevel() : int
      {
         return (this.var_15 as class_1347).securityLevel;
      }
      
      public function get isAmbassador() : Boolean
      {
         return (this.var_15 as class_1347).isAmbassador;
      }
   }
}
