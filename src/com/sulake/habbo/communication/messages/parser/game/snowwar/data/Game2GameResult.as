package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Game2GameResult
   {
      
      public static const const_387:int = 0;
      
      public static const const_293:int = 1;
      
      public static const const_53:int = 2;
       
      
      private var var_700:Boolean;
      
      private var var_492:int;
      
      private var var_729:int;
      
      public function Game2GameResult(param1:IMessageDataWrapper)
      {
         super();
         var_700 = param1.readBoolean();
         var_492 = param1.readInteger();
         var_729 = param1.readInteger();
      }
      
      public function get isDeathMatch() : Boolean
      {
         return var_700;
      }
      
      public function get resultType() : int
      {
         return var_492;
      }
      
      public function get winnerId() : int
      {
         return var_729;
      }
   }
}
