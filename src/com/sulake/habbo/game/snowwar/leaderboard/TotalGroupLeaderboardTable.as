package com.sulake.habbo.game.snowwar.leaderboard
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import package_157.class_1619;
   import package_35.Game2GetTotalGroupLeaderboardComposer;
   
   public class TotalGroupLeaderboardTable extends LeaderboardTable
   {
       
      
      private var _ownEntry:class_1619;
      
      public function TotalGroupLeaderboardTable(param1:SnowWarEngine)
      {
         super(param1);
         var_1561 -= 1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _ownEntry = null;
      }
      
      override public function addGroupEntries(param1:Array, param2:int, param3:int) : void
      {
         if(param3 > 0)
         {
            _ownEntry = param1.pop();
         }
         super.addGroupEntries(param1,param2,param3);
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
      
      override protected function getMessageComposer(param1:int, param2:int, param3:int) : IMessageComposer
      {
         return new Game2GetTotalGroupLeaderboardComposer(param1,param2,param3,var_1561,var_2009);
      }
   }
}
