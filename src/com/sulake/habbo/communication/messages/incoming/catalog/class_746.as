package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1091;
   
   [SecureSWF(rename="true")]
   public class class_746 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_746(param1:Function)
      {
         super(param1,class_1091);
      }
      
      public function getParser() : class_1091
      {
         return this.var_15 as class_1091;
      }
      
      public function get instantlyRefreshCatalogue() : Boolean
      {
         return getParser().instantlyRefreshCatalogue;
      }
      
      public function get newFurniDataHash() : String
      {
         return getParser().newFurniDataHash;
      }
   }
}
