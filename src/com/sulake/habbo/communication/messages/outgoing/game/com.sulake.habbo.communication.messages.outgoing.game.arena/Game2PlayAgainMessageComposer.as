package package_47
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class Game2PlayAgainMessageComposer implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function Game2PlayAgainMessageComposer()
      {
         var_45 = [];
         super();
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = [];
      }
   }
}
