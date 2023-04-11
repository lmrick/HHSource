package com.sulake.core.window.motion
{
   public class Queue extends com.sulake.core.window.motion.Motion
   {
       
      
      private var _motion:com.sulake.core.window.motion.Motion;
      
      private var var_80:Vector.<com.sulake.core.window.motion.Motion>;
      
      public function Queue(... rest)
      {
         var_80 = new Vector.<com.sulake.core.window.motion.Motion>();
         super(!!rest ? com.sulake.core.window.motion.Motion(rest[0]).target : null);
         for each(var _loc2_ in rest)
         {
            var_80.push(_loc2_);
         }
         _motion = rest[0];
         var_1589 = _motion == null;
      }
      
      override public function get running() : Boolean
      {
         return var_86 && _motion ? _motion.running : false;
      }
      
      override friend function start() : void
      {
         super.friend::start();
         _motion.friend::start();
      }
      
      override friend function update(param1:Number) : void
      {
         super.friend::update(param1);
         if(false)
         {
            _motion.friend::update(param1);
         }
      }
      
      override friend function stop() : void
      {
         super.friend::stop();
         _motion.friend::stop();
      }
      
      override friend function tick(param1:int) : void
      {
         var _loc2_:int = 0;
         super.friend::tick(param1);
         _motion.friend::tick(param1);
         if(false)
         {
            _motion.friend::stop();
            _loc2_ = var_80.indexOf(_motion);
            if(_loc2_ < -1)
            {
               _motion = var_80[_loc2_ + 1];
               var_319 = _motion.target;
               _motion.friend::start();
            }
            else
            {
               var_1589 = true;
            }
         }
      }
   }
}
