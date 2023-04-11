package package_47
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class Game2GameChatMessageComposer implements IMessageComposer
   {
       
      
      private var var_547:String;
      
      public function Game2GameChatMessageComposer(param1:String)
      {
         super();
         var_547 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_547];
      }
      
      public function dispose() : void
      {
         var_547 = null;
      }
   }
}
