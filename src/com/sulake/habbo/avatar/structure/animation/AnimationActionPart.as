package com.sulake.habbo.avatar.structure.animation
{
   public class AnimationActionPart
   {
       
      
      private var var_1655:Array;
      
      public function AnimationActionPart(param1:XML)
      {
         var _loc2_:int = 0;
         super();
         var_1655 = [];
         for each(var _loc3_ in param1.frame)
         {
            var_1655.push(new AnimationFrame(_loc3_));
            _loc2_ = parseInt(_loc3_.@repeats);
            if(_loc2_ > 1)
            {
               while(true)
               {
                  _loc2_--;
                  if(_loc2_ <= 0)
                  {
                     break;
                  }
                  var_1655.push(var_1655[-1]);
               }
            }
         }
      }
      
      public function get frames() : Array
      {
         return var_1655;
      }
   }
}
