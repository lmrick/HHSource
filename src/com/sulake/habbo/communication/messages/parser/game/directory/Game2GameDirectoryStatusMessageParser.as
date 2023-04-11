package package_140
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class Game2GameDirectoryStatusMessageParser implements IMessageParser
   {
      
      public static const const_110:int = 0;
      
      public static const const_42:int = 1;
      
      public static const const_116:int = 2;
      
      public static const const_129:int = 3;
       
      
      private var _status:int;
      
      private var var_1007:int;
      
      private var var_816:int;
      
      private var var_607:int;
      
      public function Game2GameDirectoryStatusMessageParser()
      {
         super();
      }
      
      public function get status() : int
      {
         return _status;
      }
      
      public function get blockLength() : int
      {
         return var_1007;
      }
      
      public function get gamesPlayed() : int
      {
         return var_816;
      }
      
      public function get freeGamesLeft() : int
      {
         return var_607;
      }
      
      public function get hasUnlimitedGames() : Boolean
      {
         return var_607 == -1;
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _status = param1.readInteger();
         var_1007 = param1.readInteger();
         var_816 = param1.readInteger();
         var_607 = param1.readInteger();
         return true;
      }
   }
}
