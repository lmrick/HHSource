package com.sulake.habbo.game.snowwar.leaderboard
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import package_157.class_1619;
   import package_35.Game2GetFriendsLeaderboardComposer;
   
   public class LeaderboardTable
   {
      
      public static const SCROLL_DOWN:int = 0;
      
      public static const SCROLL_UP:int = 1;
       
      
      protected var var_1451:SnowWarEngine;
      
      protected var var_4340:Boolean;
      
      protected var var_3621:int;
      
      protected var var_336:int = -1;
      
      protected var _disposed:Boolean;
      
      protected var var_83:Array;
      
      protected var var_1509:int = -1;
      
      protected var var_453:int;
      
      protected var var_1561:int = 8;
      
      protected var var_2009:int = 50;
      
      protected var var_1704:Boolean = true;
      
      protected var var_3691:int;
      
      public function LeaderboardTable(param1:SnowWarEngine)
      {
         super();
         var_1451 = param1;
         var_3621 = var_1451.sessionDataManager.userId;
         var_1561 = var_1451.config.getInteger("games.highscores.viewSize",8);
         var_2009 = var_1451.config.getInteger("games.highscores.windowSize",50);
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         disposeTable();
         var_1451 = null;
         var_83 = null;
         _disposed = true;
      }
      
      public function disposeTable() : void
      {
         var_1509 = -1;
         var_83 = null;
         var_453 = -1;
         var_1704 = true;
      }
      
      public function addEntries(param1:Array, param2:int) : void
      {
         var_453 = param2;
         if(!var_83)
         {
            var_83 = param1;
            initializeList();
         }
         else
         {
            var_83 = param1;
            updateCurrentIndex();
         }
         var_1704 = false;
      }
      
      public function addGroupEntries(param1:Array, param2:int, param3:int) : void
      {
         var_336 = param3;
         var_453 = param2;
         if(!var_83)
         {
            var_83 = param1;
            initializeList();
         }
         else
         {
            var_83 = param1;
            updateCurrentIndex();
         }
         var_1704 = false;
      }
      
      protected function initializeList() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = false;
         var _loc2_:* = 0;
         _loc3_ = 0;
         while(_loc3_ < var_83.length)
         {
            _loc1_ = (var_83[_loc3_] as class_1619).gender == "g";
            if(!_loc1_ && (var_83[_loc3_] as class_1619).userId == var_3621)
            {
               _loc2_ = _loc3_;
               break;
            }
            if(_loc1_ && (var_83[_loc3_] as class_1619).userId == var_336)
            {
               _loc2_ = _loc3_;
               break;
            }
            _loc3_++;
         }
         if(_loc2_ >= var_1561)
         {
            var_1509 = _loc2_ - var_1561 / 2;
         }
         else
         {
            var_1509 = 0;
         }
      }
      
      private function updateCurrentIndex() : void
      {
         if(var_1509 < 0)
         {
            var_1509 += var_2009;
         }
         else
         {
            var_1509 -= var_2009;
         }
      }
      
      public function isInitialized() : Boolean
      {
         return var_83 != null;
      }
      
      public function scrollUp() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:IMessageComposer = null;
         if(var_1704)
         {
            return false;
         }
         var_1509 -= var_1561;
         if(var_1509 < 0)
         {
            if(var_83[0].rank > 1)
            {
               _loc2_ = Math.max(1,var_83[0].rank - var_2009);
               _loc1_ = getMessageComposer(var_3691,_loc2_,1);
               var_1451.communication.connection.send(_loc1_);
               var_1704 = true;
               return false;
            }
            var_1509 = 0;
         }
         return true;
      }
      
      protected function getMessageComposer(param1:int, param2:int, param3:int) : IMessageComposer
      {
         return new Game2GetFriendsLeaderboardComposer(param1,param2,param3,var_1561,var_2009);
      }
      
      public function scrollDown() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:IMessageComposer = null;
         if(var_1704)
         {
            return false;
         }
         var_1509 += var_1561;
         if(var_1509 + var_1561 >= var_83.length)
         {
            if(var_83[-1].rank < var_453)
            {
               _loc2_ = var_83[-1].rank + 1;
               _loc1_ = getMessageComposer(var_3691,_loc2_,0);
               var_1451.communication.connection.send(_loc1_);
               var_1704 = true;
               return false;
            }
         }
         return true;
      }
      
      public function revertToDefaultView(param1:int) : void
      {
         disposeTable();
         var _loc2_:IMessageComposer = getMessageComposer(param1,-1,0);
         var_1451.communication.connection.send(_loc2_);
         var_1704 = true;
         var_3691 = param1;
      }
      
      public function getVisibleEntries() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:* = [];
         if(!var_83)
         {
            return _loc1_;
         }
         var _loc3_:int = Math.min(var_83.length,var_1509 + var_1561);
         _loc2_ = var_1509;
         while(_loc2_ < _loc3_)
         {
            _loc1_.push(var_83[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function canScrollUp() : Boolean
      {
         if(var_1704 || !var_83 || false)
         {
            return false;
         }
         if(var_83[0].rank == 1 && var_1509 <= 0)
         {
            return false;
         }
         return true;
      }
      
      public function canScrollDown() : Boolean
      {
         if(var_1704 || !var_83 || false)
         {
            return false;
         }
         if(var_83[-1].rank >= var_453 && var_1509 + var_1561 >= var_83.length)
         {
            return false;
         }
         return true;
      }
      
      public function get viewSize() : int
      {
         return var_1561;
      }
      
      public function get favouriteGroupId() : int
      {
         return var_336;
      }
   }
}
