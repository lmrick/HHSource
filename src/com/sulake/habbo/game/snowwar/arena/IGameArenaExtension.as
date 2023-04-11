package com.sulake.habbo.game.snowwar.arena
{
   import com.sulake.core.runtime.class_13;
   
   public interface IGameArenaExtension extends class_13
   {
       
      
      function createGameStage() : class_3326;
      
      function set gameArena(param1:SynchronizedGameArena) : void;
      
      function pulse() : void;
      
      function getPulseInterval() : int;
      
      function getNumberOfSubTurns() : int;
   }
}
