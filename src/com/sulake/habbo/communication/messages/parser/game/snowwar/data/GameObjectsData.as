package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import package_185.SnowWarGameObjectData;
   
   public class GameObjectsData
   {
       
      
      private var var_652:Array;
      
      public function GameObjectsData(param1:IMessageDataWrapper)
      {
         var_652 = [];
         super();
         parse(param1);
      }
      
      public function get gameObjects() : Array
      {
         return var_652;
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:SnowWarGameObjectData = null;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readInteger();
            _loc4_ = param1.readInteger();
            (_loc6_ = SnowWarGameObjectData.create(_loc5_,_loc4_)).parse(param1);
            var_652.push(_loc6_);
            _loc3_++;
         }
      }
   }
}
