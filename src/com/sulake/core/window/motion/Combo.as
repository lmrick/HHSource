package com.sulake.core.window.motion
{
   public class Combo extends com.sulake.core.window.motion.Motion
   {
       
      
      private var var_2199:Vector.<com.sulake.core.window.motion.Motion>;
      
      private var var_3369:Vector.<com.sulake.core.window.motion.Motion>;
      
      public function Combo(... rest)
      {
         var_2199 = new Vector.<com.sulake.core.window.motion.Motion>();
         var_3369 = new Vector.<com.sulake.core.window.motion.Motion>();
         for each(var _loc2_ in rest)
         {
            var_2199.push(_loc2_);
         }
         super(var_2199.length > 0 ? var_2199[0].target : null);
      }
      
      override friend function start() : void
      {
         super.friend::start();
         for each(var _loc1_ in var_2199)
         {
            _loc1_.friend::start();
         }
      }
      
      override friend function tick(param1:int) : void
      {
         var _loc2_:com.sulake.core.window.motion.Motion = null;
         super.friend::tick(param1);
         while((_loc2_ = var_3369.pop()) != null)
         {
            var_2199.splice(var_3369.indexOf(_loc2_),1);
            if(_loc2_.running)
            {
               _loc2_.friend::stop();
            }
         }
         for each(_loc2_ in var_2199)
         {
            if(_loc2_.running)
            {
               _loc2_.friend::tick(param1);
            }
            if(_loc2_.complete)
            {
               var_3369.push(_loc2_);
            }
         }
         if(false)
         {
            for each(_loc2_ in var_2199)
            {
               var_319 = _loc2_.target;
               if(var_319)
               {
                  break;
               }
            }
            var_1589 = false;
         }
         else
         {
            var_1589 = true;
         }
      }
   }
}
