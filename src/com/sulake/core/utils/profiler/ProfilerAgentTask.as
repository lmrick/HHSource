package com.sulake.core.utils.profiler
{
   import com.sulake.core.runtime.class_13;
   import flash.utils.getTimer;
   
   public class ProfilerAgentTask implements class_13
   {
       
      
      private var _name:String;
      
      private var var_203:uint;
      
      private var var_362:int;
      
      private var var_612:int;
      
      private var var_524:Number;
      
      private var _caption:String;
      
      private var var_86:Boolean;
      
      private var _disposed:Boolean = false;
      
      private var _children:Array;
      
      private var _startTime:uint;
      
      private var var_126:Boolean = false;
      
      public function ProfilerAgentTask(param1:String, param2:String = "")
      {
         super();
         _name = param1;
         var_203 = 0;
         var_524 = 0;
         var_86 = false;
         _children = [];
         _caption = param2;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
         }
      }
      
      public function start() : void
      {
         if(!var_86)
         {
            _startTime = getTimer();
            var_86 = true;
         }
      }
      
      public function stop() : void
      {
         if(var_86)
         {
            var_612 = getTimer() - _startTime;
            var_203++;
            var_362 += var_612;
            var_524 = var_362 / var_203;
            var_86 = false;
         }
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get rounds() : uint
      {
         return var_203;
      }
      
      public function get total() : int
      {
         return var_362;
      }
      
      public function get latest() : int
      {
         return var_612;
      }
      
      public function get average() : Number
      {
         return var_524;
      }
      
      public function get caption() : String
      {
         return _caption;
      }
      
      public function set caption(param1:String) : void
      {
         _caption = caption;
      }
      
      public function get running() : Boolean
      {
         return var_86;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get paused() : Boolean
      {
         return var_126;
      }
      
      public function set paused(param1:Boolean) : void
      {
         var_126 = param1;
      }
      
      public function get numSubTasks() : uint
      {
         return _children.length;
      }
      
      public function addSubTask(param1:ProfilerAgentTask) : void
      {
         if(getSubTaskByName(param1.name) != null)
         {
            throw new Error("Component profiler task with name \"" + param1.name + "\" already exists!");
         }
         _children.push(param1);
      }
      
      public function removeSubTask(param1:ProfilerAgentTask) : ProfilerAgentTask
      {
         var _loc2_:int = _children.indexOf(param1);
         if(_loc2_ > -1)
         {
            _children.splice(_loc2_,1);
         }
         return param1;
      }
      
      public function getSubTaskAt(param1:uint) : ProfilerAgentTask
      {
         return _children[param1] as ProfilerAgentTask;
      }
      
      public function getSubTaskByName(param1:String) : ProfilerAgentTask
      {
         var _loc2_:ProfilerAgentTask = null;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _children[_loc4_++] as ProfilerAgentTask;
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
