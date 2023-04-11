package package_44
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_151.class_1360;
   
   [SecureSWF(rename="true")]
   public class class_322 extends MessageEvent implements IMessageEvent
   {
      
      public static const const_364:int = 0;
      
      public static const const_271:int = 1;
       
      
      public function class_322(param1:Function)
      {
         super(param1,class_1360);
      }
      
      private function getParser() : class_1360
      {
         return this.var_15 as class_1360;
      }
      
      public function get outfits() : Array
      {
         return getParser().outfits;
      }
      
      public function get state() : int
      {
         return getParser().state;
      }
   }
}
