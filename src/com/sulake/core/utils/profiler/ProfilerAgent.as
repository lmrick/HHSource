package com.sulake.core.utils.profiler
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_41;
   import flash.utils.getQualifiedClassName;
   
   public class ProfilerAgent extends ProfilerAgentTask implements class_13
   {
       
      
      protected var _receiver:class_41;
      
      public function ProfilerAgent(param1:class_41)
      {
         _receiver = param1;
         var _loc2_:String = getQualifiedClassName(_receiver);
         super(_loc2_.slice(_loc2_.lastIndexOf(":") + 1,_loc2_.length));
      }
      
      public function get receiver() : class_41
      {
         return _receiver;
      }
      
      override public function dispose() : void
      {
         _receiver = null;
         super.dispose();
      }
      
      public function update(param1:int) : void
      {
         if(!paused)
         {
            super.start();
            _receiver.update(param1);
            super.stop();
         }
      }
   }
}
