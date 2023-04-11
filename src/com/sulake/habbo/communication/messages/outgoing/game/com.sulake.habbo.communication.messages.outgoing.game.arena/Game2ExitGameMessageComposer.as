package package_47
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class Game2ExitGameMessageComposer implements IMessageComposer
   {
       
      
      private var var_733:Boolean;
      
      public function Game2ExitGameMessageComposer(param1:Boolean = true)
      {
         super();
         var_733 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_733];
      }
      
      public function dispose() : void
      {
      }
   }
}
