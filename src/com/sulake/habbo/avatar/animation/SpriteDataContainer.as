package com.sulake.habbo.avatar.animation
{
   public class SpriteDataContainer implements ISpriteDataContainer
   {
       
      
      private var _animation:com.sulake.habbo.avatar.animation.IAnimation;
      
      private var var_247:String;
      
      private var var_3717:int;
      
      private var var_4077:String;
      
      private var var_4216:Boolean;
      
      private var var_3932:Boolean;
      
      private var var_3203:Array;
      
      private var var_3193:Array;
      
      private var var_3280:Array;
      
      public function SpriteDataContainer(param1:com.sulake.habbo.avatar.animation.IAnimation, param2:XML)
      {
         var _loc4_:int = 0;
         super();
         _animation = param1;
         var_247 = String(param2.@id);
         var_3717 = parseInt(param2.@ink);
         var_4077 = String(param2.@member);
         var_3932 = Boolean(parseInt(param2.@staticY));
         var_4216 = Boolean(parseInt(param2.@directions));
         var_3203 = [];
         var_3193 = [];
         var_3280 = [];
         for each(var _loc3_ in param2.direction)
         {
            _loc4_ = parseInt(_loc3_.@id);
            var_3203[_loc4_] = parseInt(_loc3_.@dx);
            var_3193[_loc4_] = parseInt(_loc3_.@dy);
            var_3280[_loc4_] = parseInt(_loc3_.@dz);
         }
      }
      
      public function getDirectionOffsetX(param1:int) : int
      {
         if(param1 < var_3203.length)
         {
            return var_3203[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetY(param1:int) : int
      {
         if(param1 < var_3193.length)
         {
            return var_3193[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetZ(param1:int) : int
      {
         if(param1 < var_3280.length)
         {
            return var_3280[param1];
         }
         return 0;
      }
      
      public function get animation() : com.sulake.habbo.avatar.animation.IAnimation
      {
         return _animation;
      }
      
      public function get id() : String
      {
         return var_247;
      }
      
      public function get ink() : int
      {
         return var_3717;
      }
      
      public function get member() : String
      {
         return var_4077;
      }
      
      public function get hasDirections() : Boolean
      {
         return var_4216;
      }
      
      public function get hasStaticY() : Boolean
      {
         return var_3932;
      }
   }
}
