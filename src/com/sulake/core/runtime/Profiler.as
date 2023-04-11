package com.sulake.core.runtime
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.profiler.ProfilerAgent;
   import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
   import flash.events.Event;
   import flash.system.System;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   internal class Profiler extends class_20 implements class_1101
   {
      
      public static const PROFILER_START:String = "PROFILER_START";
      
      public static const PROFILER_STOP:String = "PROFILER_STOP";
       
      
      private var var_71:Dictionary;
      
      private var _startTime:int;
      
      private var _roundTime:int;
      
      public function Profiler(param1:class_31)
      {
         var_71 = new Dictionary(true);
         super(param1,0,null);
      }
      
      public function get numAssetLibraryInstances() : uint
      {
         return AssetLibrary.numAssetLibraryInstances;
      }
      
      public function get numBitmapAssetInstances() : uint
      {
         return BitmapDataAsset.instances;
      }
      
      public function get numAllocatedBitmapDataBytes() : uint
      {
         return BitmapDataAsset.allocatedByteCount;
      }
      
      public function get numTrackedBitmapDataInstances() : uint
      {
         return TrackedBitmapData.numInstances;
      }
      
      public function get numTrackedBitmapDataBytes() : uint
      {
         return TrackedBitmapData.allocatedByteCount;
      }
      
      override public function dispose() : void
      {
         var _loc1_:Object = null;
         if(!disposed)
         {
            for(_loc1_ in var_71)
            {
               class_13(var_71[_loc1_]).dispose();
               delete var_71[_loc1_];
            }
            super.dispose();
         }
      }
      
      public function gc() : void
      {
         System.pauseForGCIfCollectionImminent(0.25);
      }
      
      public function start() : void
      {
         events.dispatchEvent(new Event("PROFILER_START",false,false));
         _startTime = getTimer();
      }
      
      public function stop() : void
      {
         _roundTime = getTimer() - _startTime;
         events.dispatchEvent(new Event("PROFILER_STOP",false,false));
      }
      
      public function update(param1:class_41, param2:uint) : void
      {
         getProfilerAgentForReceiver(param1).update(param2);
      }
      
      public function get numProfilerAgents() : uint
      {
         var _loc1_:Number = 0;
         for(var _loc2_ in var_71)
         {
            if(!class_13(_loc2_).disposed)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function getProfilerAgentsInArray() : Array
      {
         var _loc2_:class_41 = null;
         var _loc1_:* = [];
         for(var _loc3_ in var_71)
         {
            _loc2_ = _loc3_ as class_41;
            if(class_13(_loc3_).disposed)
            {
               class_13(var_71[_loc3_]).dispose();
               delete var_71[_loc3_];
            }
            else
            {
               _loc1_.push(var_71[_loc3_]);
            }
         }
         return _loc1_;
      }
      
      public function getProfilerAgentForReceiver(param1:class_41) : ProfilerAgent
      {
         var _loc2_:ProfilerAgent = var_71[param1];
         return _loc2_ != null ? _loc2_ : addProfilerAgentForReceiver(param1);
      }
      
      public function addProfilerAgentForReceiver(param1:class_41) : ProfilerAgent
      {
         if(false)
         {
            throw new Error("Profiler for receiver already exists!");
         }
         var _loc2_:ProfilerAgent = new ProfilerAgent(param1);
         var_71[param1] = _loc2_;
         return _loc2_;
      }
      
      public function addStartEventListener(param1:Function) : void
      {
         events.addEventListener("PROFILER_START",param1);
      }
      
      public function addStopEventListener(param1:Function) : void
      {
         events.addEventListener("PROFILER_STOP",param1);
      }
      
      public function removeStartEventListener(param1:Function) : void
      {
         events.removeEventListener("PROFILER_START",param1);
      }
      
      public function removeStopEventListener(param1:Function) : void
      {
         events.removeEventListener("PROFILER_STOP",param1);
      }
   }
}
