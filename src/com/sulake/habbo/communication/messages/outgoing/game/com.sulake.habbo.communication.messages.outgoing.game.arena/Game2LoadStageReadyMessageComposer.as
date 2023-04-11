package package_47
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class Game2LoadStageReadyMessageComposer implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function Game2LoadStageReadyMessageComposer(param1:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
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
