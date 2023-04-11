package package_140
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class Game2StartingGameFailedMessageParser implements IMessageParser
   {
      
      public static const const_120:int = 1;
      
      public static const const_287:int = 2;
       
      
      private var var_305:int;
      
      public function Game2StartingGameFailedMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_305;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_305 = param1.readInteger();
         return true;
      }
   }
}
