package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.class_13;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class GenericEventQueue implements IEventQueue, class_13
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_172:IEventDispatcher;
      
      protected var _eventArray:Vector.<Event>;
      
      protected var _index:uint = 0;
      
      protected var var_3181:Boolean = true;
      
      public function GenericEventQueue(param1:IEventDispatcher)
      {
         super();
         _eventArray = new Vector.<Event>();
         var_172 = param1;
      }
      
      public function get length() : uint
      {
         return _eventArray.length;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_172 = null;
            if(false)
            {
               _eventArray.splice(0,_eventArray.length);
            }
            _disposed = true;
         }
      }
      
      public function begin() : void
      {
         if(!var_3181)
         {
            flush();
         }
         _index = 0;
         var_3181 = false;
      }
      
      public function next() : Event
      {
         var _loc1_:Event = null;
         if(_index < _eventArray.length)
         {
            _loc1_ = _eventArray[_index];
            _index++;
         }
         return _loc1_;
      }
      
      public function remove() : void
      {
         _eventArray.splice(_index - 1,1);
         if(_index > 0)
         {
            _index--;
         }
      }
      
      public function end() : void
      {
         _index = 0;
         var_3181 = true;
      }
      
      public function flush() : void
      {
         _eventArray.splice(0,_eventArray.length);
         _index = 0;
      }
      
      protected function eventListener(param1:Event) : void
      {
         _eventArray.push(param1);
      }
   }
}
