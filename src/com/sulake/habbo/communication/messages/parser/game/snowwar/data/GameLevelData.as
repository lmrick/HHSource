package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class GameLevelData
   {
       
      
      private var _width:int;
      
      private var var_47:int;
      
      private var var_132:String;
      
      private var var_660:Array;
      
      public function GameLevelData(param1:IMessageDataWrapper)
      {
         var_660 = [];
         super();
         parse(param1);
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get height() : int
      {
         return var_47;
      }
      
      public function get heightMap() : String
      {
         return var_132;
      }
      
      public function get fuseObjects() : Array
      {
         return var_660;
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
         var _loc3_:int = 0;
         var _loc4_:FuseObjectData = null;
         _width = param1.readInteger();
         var_47 = param1.readInteger();
         var_132 = param1.readString();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc4_ = new FuseObjectData()).parse(param1);
            var_660.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
