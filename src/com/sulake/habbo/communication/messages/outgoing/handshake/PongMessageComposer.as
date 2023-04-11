package package_1
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   
   public class PongMessageComposer implements IMessageComposer
   {
       
      
      public function PongMessageComposer()
      {
         super();
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [];
      }
   }
}
