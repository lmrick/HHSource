package com.sulake.core.runtime.events
{
   import com.sulake.core.class_79;
   import com.sulake.core.runtime.class_13;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import com.sulake.core.runtime.IDisposable;
   
   public class EventDispatcherWrapper implements IEventDispatcher, IDisposable
   {
      
      private static const const_190:uint = 0;
      
      private static const const_201:uint = 1;
      
      private static const const_336:uint = 2;
       
      
      protected var _disposed:Boolean = false;
      
      private var var_172:EventDispatcher;
      
      private var var_54:Dictionary;
      
      private var var_170:uint;
      
      private var var_161:Error;
      
      public function EventDispatcherWrapper(param1:IEventDispatcher = null)
      {
         var_54 = new Dictionary();
         super();
         var_172 = new EventDispatcher(!!param1 ? param1 : this);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get error() : Error
      {
         return var_161;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc8_:Array = var_54[param1];
         var _loc6_:EventListenerStruct = new EventListenerStruct(param2,param3,param4,param5);
         if(!_loc8_)
         {
            _loc8_ = [_loc6_];
            var_54[param1] = _loc8_;
            var_172.addEventListener(param1,eventProcessor);
         }
         else
         {
            for each(var _loc7_ in _loc8_)
            {
               if(_loc7_.callback == param2 && _loc7_.useCapture == param3)
               {
                  return;
               }
               if(param4 > _loc7_.priority)
               {
                  _loc8_.splice(_loc8_.indexOf(_loc7_),0,_loc6_);
                  return;
               }
            }
            _loc8_.push(_loc6_);
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc5_:Array = null;
         var _loc6_:* = 0;
         if(!_disposed)
         {
            if(_loc5_ = var_54[param1])
            {
               _loc6_ = 0;
               for each(var _loc4_ in _loc5_)
               {
                  if(_loc4_.callback == param2 && _loc4_.useCapture == param3)
                  {
                     _loc5_.splice(_loc6_,1);
                     _loc4_.callback = null;
                     if(_loc5_.length == 0)
                     {
                        delete var_54[param1];
                        var_172.removeEventListener(param1,eventProcessor);
                     }
                     return;
                  }
                  _loc6_++;
               }
            }
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         if(!_disposed)
         {
            var_170 = 0;
            var_172.dispatchEvent(param1);
            if(var_170 == 2)
            {
               if(var_161 != null)
               {
                  class_79.crash("Error caught when handling " + getQualifiedClassName(param1) + ": " + var_161.message,var_161.errorID,var_161);
               }
               else
               {
                  class_79.crash("Error caught when handling " + getQualifiedClassName(param1) + ". No error data available!",0,var_161);
               }
            }
            return var_170 == 0;
         }
         return false;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _disposed ? false : false;
      }
      
      public function callEventListeners(param1:String) : void
      {
         var _loc3_:Array = var_54[param1];
         if(_loc3_)
         {
            for each(var _loc2_ in _loc3_)
            {
               _loc2_.callback(null);
            }
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _disposed ? false : false;
      }
      
      private function eventProcessor(param1:Event) : void
      {
         var _loc4_:Function = null;
         var _loc5_:* = null;
         var _loc3_:Array = var_54[param1.type];
         if(_loc3_)
         {
            _loc5_ = [];
            for each(var _loc2_ in _loc3_)
            {
               _loc5_.push(_loc2_.callback);
            }
            while(_loc5_.length > 0)
            {
               try
               {
                  (_loc4_ = _loc5_.shift())(param1);
               }
               catch(e:Error)
               {
                  class_14.log(e.getStackTrace());
                  var_170 = 2;
                  var_161 = e;
                  return;
               }
            }
         }
         var_170 = param1.isDefaultPrevented() ? 1 : 0;
      }
      
      public function dispose() : void
      {
         var _loc2_:Array = null;
         if(!_disposed)
         {
            for(var _loc3_ in var_54)
            {
               _loc2_ = var_54[_loc3_] as Array;
               for each(var _loc1_ in _loc2_)
               {
                  _loc1_.callback = null;
               }
               delete var_54[_loc3_];
               var_172.removeEventListener(_loc3_,eventProcessor);
            }
            var_54 = null;
            var_172 = null;
            _disposed = true;
         }
      }
   }
}
