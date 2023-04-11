package com.sulake.habbo.game.snowwar.events
{
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   import com.sulake.habbo.game.snowwar.gameobjects.SnowBallGameObject;
   
   public class CreateSnowballEvent extends class_3346
   {
       
      
      private var _snowBallGameObject:SnowBallGameObject;
      
      private var var_2480:HumanGameObject;
      
      private var var_839:int;
      
      private var var_739:int;
      
      private var var_810:int;
      
      public function CreateSnowballEvent(param1:int, param2:HumanGameObject, param3:int, param4:int, param5:int)
      {
         super();
         this._snowBallGameObject = new SnowBallGameObject(param1);
         this.var_2480 = param2;
         this.var_839 = param3;
         this.var_739 = param4;
         this.var_810 = param5;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _snowBallGameObject = null;
         var_2480 = null;
      }
      
      public function set snowBallGameObject(param1:SnowBallGameObject) : void
      {
         this._snowBallGameObject = param1;
      }
      
      override public function apply(param1:class_3327) : void
      {
         param1.addGameObject(_snowBallGameObject.gameObjectId,_snowBallGameObject);
         _snowBallGameObject.isActive = true;
         var _loc2_:int = var_2480.currentLocation.x;
         var _loc3_:int = var_2480.currentLocation.y;
         _snowBallGameObject.initialize(_loc2_,_loc3_,3000,var_810,var_839,var_739,var_2480);
      }
   }
}
