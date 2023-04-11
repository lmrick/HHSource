package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameObjectsData;
   
   [SecureSWF(rename="true")]
   public class class_1323 implements IMessageParser
   {
       
      
      private var var_652:GameObjectsData;
      
      private var var_378:int;
      
      private var var_367:String;
      
      private var var_1149:int;
      
      public function class_1323()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_378 = param1.readInteger();
         var_367 = param1.readString();
         var_1149 = param1.readInteger();
         var_652 = new GameObjectsData(param1);
         return true;
      }
      
      public function get gameObjects() : GameObjectsData
      {
         return var_652;
      }
      
      public function get gameType() : int
      {
         return var_378;
      }
      
      public function get roomType() : String
      {
         return var_367;
      }
      
      public function get countDown() : int
      {
         return var_1149;
      }
   }
}
