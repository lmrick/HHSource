package package_71
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class Game2ThrowSnowballAtPositionMessageComposer implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function Game2ThrowSnowballAtPositionMessageComposer(param1:int, param2:int, param3:int, param4:int, param5:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
         var_45.push(param3);
         var_45.push(param4);
         var_45.push(param5);
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
