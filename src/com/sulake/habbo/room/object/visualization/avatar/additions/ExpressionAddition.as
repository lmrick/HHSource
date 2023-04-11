package com.sulake.habbo.room.object.visualization.avatar.additions
{
   import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   
   public class ExpressionAddition implements IExpressionAddition
   {
       
      
      protected var var_247:int;
      
      protected var var_224:AvatarVisualization;
      
      private var var_271:int = -1;
      
      public function ExpressionAddition(param1:int, param2:int, param3:AvatarVisualization)
      {
         super();
         var_271 = param2;
         var_247 = param1;
         var_224 = param3;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get disposed() : Boolean
      {
         return var_224 == null;
      }
      
      public function dispose() : void
      {
         var_224 = null;
      }
      
      public function update(param1:IRoomObjectSprite, param2:Number) : void
      {
      }
      
      public function animate(param1:IRoomObjectSprite) : Boolean
      {
         return false;
      }
   }
}
