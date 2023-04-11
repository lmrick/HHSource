package com.sulake.habbo.game.snowwar.arena
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.class_3328;
   
   public class SynchronizedGameArena implements class_13
   {
       
      
      private var var_1451:SnowWarEngine;
      
      private var var_1836:Array;
      
      protected var var_1331:int;
      
      private var var_1730:int;
      
      private var var_4321:int = 1;
      
      private var var_3221:com.sulake.habbo.game.snowwar.arena.class_3327;
      
      private var _extension:com.sulake.habbo.game.snowwar.arena.IGameArenaExtension;
      
      private var _checkSums:class_24;
      
      private var var_311:Boolean = false;
      
      private var var_3220:Boolean = false;
      
      private var _numberOfTeams:int;
      
      private var var_1335:Array;
      
      public function SynchronizedGameArena()
      {
         super();
      }
      
      public function dispose() : void
      {
         var_311 = true;
         var_1451 = null;
         var_1836 = null;
         var_3221 = null;
         if(_extension != null)
         {
            _extension.dispose();
            _extension = null;
         }
         _checkSums = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function initialize(param1:SnowWarEngine, param2:int) : void
      {
         var_1451 = param1;
         var_3221 = new class_3328();
         _checkSums = new class_24();
         var_1836 = [];
         _numberOfTeams = param2;
         var_1331 = 0;
         var_1730 = 0;
         var_1836[var_1331] = initEmptyEventQueue();
         _checkSums = new class_24();
         resetTeamScores();
      }
      
      public function get gameEngine() : SnowWarEngine
      {
         return var_1451;
      }
      
      public function pulse() : void
      {
         gamePulse();
      }
      
      public function gamePulse() : void
      {
         var _loc1_:Array = null;
         var _loc4_:ISynchronizedGameEvent = null;
         if(false)
         {
            HabboGamesCom.log("Turn " + var_1331 + " subturn " + (var_1730 + 1) + "/" + getNumberOfSubTurns());
         }
         var _loc3_:com.sulake.habbo.game.snowwar.arena.class_3327 = com.sulake.habbo.game.snowwar.arena.class_3327(getCurrentStage());
         var _loc2_:Array = var_1836[var_1331];
         if(_loc2_)
         {
            _loc1_ = _loc2_[var_1730];
            while(_loc1_.length > 0)
            {
               _loc4_ = _loc1_.shift() as ISynchronizedGameEvent;
               if(false)
               {
                  HabboGamesCom.log("GameInstance::gameTurn: applying event " + _loc4_ + " turn " + var_1331 + " subturn " + (var_1730 + 1) + "/" + getNumberOfSubTurns());
               }
               _loc4_.apply(_loc3_);
            }
         }
         if(!var_3220)
         {
            _loc3_.subturn();
         }
         if(var_1730 >= getNumberOfSubTurns() - 1)
         {
            if(var_1331 % var_4321 == 0)
            {
               _checkSums[var_1331] = getCurrentStage().calculateChecksum(var_1331);
            }
            var_1331++;
            var_3220 = false;
            if(false)
            {
               HabboGamesCom.log("Turn:" + var_1331);
            }
         }
         var_1730++;
         if(var_1730 >= getNumberOfSubTurns())
         {
            var_1730 = 0;
         }
      }
      
      public function addGameEvent(param1:int, param2:int, param3:ISynchronizedGameEvent) : void
      {
         var _loc4_:Array;
         if((_loc4_ = var_1836[param1]) == null)
         {
            _loc4_ = initEmptyEventQueue();
            var_1836[param1] = _loc4_;
         }
         _loc4_[param2].push(param3);
         if(false)
         {
            HabboGamesCom.log("Add game event: " + param3 + " (subturn/turn): " + param2 + "/" + param1);
         }
      }
      
      public function debugEventQueue() : void
      {
         var _loc5_:int = 0;
         var _loc1_:Array = null;
         var _loc6_:int = 0;
         var _loc4_:Array = null;
         var _loc2_:String = "";
         _loc5_ = 0;
         while(_loc5_ < var_1836.length)
         {
            _loc1_ = var_1836[_loc5_];
            if(_loc1_ != null)
            {
               _loc6_ = 0;
               while(_loc6_ < getNumberOfSubTurns())
               {
                  if((_loc4_ = _loc1_[_loc6_]).length != 0)
                  {
                     _loc2_ += _loc5_ + " (" + _loc6_ + ") : ";
                     for each(var _loc3_ in _loc4_)
                     {
                        _loc2_ += _loc3_;
                     }
                     _loc2_ += "\n";
                  }
                  _loc6_++;
               }
            }
            _loc5_++;
         }
         HabboGamesCom.log(_loc2_);
      }
      
      public function getNumberOfSubTurns() : int
      {
         return this.getExtension().getNumberOfSubTurns();
      }
      
      public function getTurnNumber() : int
      {
         return var_1331;
      }
      
      public function get subturn() : int
      {
         return var_1730;
      }
      
      public function getCurrentStage() : com.sulake.habbo.game.snowwar.arena.class_3327
      {
         return var_3221;
      }
      
      public function getExtension() : com.sulake.habbo.game.snowwar.arena.IGameArenaExtension
      {
         return _extension;
      }
      
      public function setExtension(param1:com.sulake.habbo.game.snowwar.arena.IGameArenaExtension) : void
      {
         _extension = param1;
         param1.gameArena = this;
      }
      
      public function getCheckSum(param1:int) : int
      {
         return _checkSums[param1];
      }
      
      public function seekToTurn(param1:int, param2:int) : void
      {
         var_1331 = param1;
         var_1730 = 0;
         _checkSums[param1] = param2;
         var_1836 = [];
         var_1836[var_1331] = initEmptyEventQueue();
         var_3220 = true;
      }
      
      private function initEmptyEventQueue() : Array
      {
         var _loc1_:int = 0;
         var _loc2_:* = [];
         _loc1_ = 0;
         while(_loc1_ < getNumberOfSubTurns())
         {
            _loc2_[_loc1_] = [];
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function get numberOfTeams() : int
      {
         return _numberOfTeams;
      }
      
      private function resetTeamScores() : void
      {
         var _loc1_:int = 0;
         var_1335 = [];
         _loc1_ = 0;
         while(_loc1_ < _numberOfTeams)
         {
            var_1335[_loc1_] = 0;
            _loc1_++;
         }
      }
      
      public function addTeamScore(param1:int, param2:int) : void
      {
         if(param1 > 0 && param1 <= _numberOfTeams)
         {
            var _loc3_:* = param1 - 1;
            var _loc4_:* = var_1335[_loc3_] + param2;
            var_1335[_loc3_] = _loc4_;
         }
      }
      
      public function getTeamScores() : Array
      {
         return var_1335;
      }
   }
}
