package com.sulake.habbo.game.snowwar.leaderboard
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import package_157.class_1619;
   import package_35.Game2GetTotalLeaderboardComposer;
   
   public class TotalLeaderboardTable extends LeaderboardTable
   {
       
      
      private var _ownEntry:class_1619;
      
      public function TotalLeaderboardTable(param1:SnowWarEngine)
      {
         super(param1);
         var_1561 -= 1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _ownEntry = null;
      }
      
      override public function addEntries(param1:Array, param2:int) : void
      {
         _ownEntry = param1.pop();
         super.addEntries(param1,param2);
      }
      
      override protected function getMessageComposer(param1:int, param2:int, param3:int) : IMessageComposer
      {
         return new Game2GetTotalLeaderboardComposer(param1,param2,param3,var_1561,var_2009);
      }
      
      override public function getVisibleEntries() : Array
      {
         var _loc1_:Array = super.getVisibleEntries();
         if(_ownEntry)
         {
            _loc1_.push(_ownEntry);
         }
         return _loc1_;
      }
      
      override protected function initializeList() : void
      {
         var_1509 = 0;
      }
   }
}
