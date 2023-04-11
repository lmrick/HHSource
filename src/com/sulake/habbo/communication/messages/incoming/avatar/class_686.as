package package_44
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_151.class_1094;
   
   [SecureSWF(rename="true")]
   public class class_686 extends MessageEvent implements IMessageEvent
   {
      
      public static var var_1402:int = 0;
      
      public static var var_1411:int = 1;
      
      public static var var_1408:int = 2;
      
      public static var var_1415:int = 3;
      
      public static var var_1410:int = 4;
      
      public static var var_1405:int = 5;
       
      
      public function class_686(param1:Function)
      {
         super(param1,class_1094);
      }
      
      public function getParser() : class_1094
      {
         return var_15 as class_1094;
      }
   }
}
