package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.avatar.actions.class_3311;
   
   public class AvatarImageBodyPartCache
   {
       
      
      private var _cache:class_24;
      
      private var _currentAction:class_3311;
      
      private var _currentDirection:int;
      
      private var _disposed:Boolean;
      
      public function AvatarImageBodyPartCache()
      {
         super();
         _cache = new class_24();
      }
      
      public function setAction(param1:class_3311, param2:int) : void
      {
         if(_currentAction == null)
         {
            _currentAction = param1;
         }
         var _loc3_:AvatarImageActionCache = getActionCache(_currentAction);
         if(_loc3_ != null)
         {
            _loc3_.setLastAccessTime(param2);
         }
         _currentAction = param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_cache == null)
            {
               return;
            }
            if(_cache)
            {
               disposeActions(0,2147483647);
               _cache.dispose();
               _cache = null;
            }
            _disposed = true;
         }
      }
      
      public function disposeActions(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc5_:AvatarImageActionCache = null;
         var _loc6_:* = null;
         if(_cache == null || _disposed)
         {
            return;
         }
         var _loc4_:Array = _cache.getKeys();
         for each(_loc6_ in _loc4_)
         {
            if((_loc5_ = _cache.getValue(_loc6_) as AvatarImageActionCache) != null)
            {
               _loc3_ = _loc5_.getLastAccessTime();
               if(param2 - _loc3_ >= param1)
               {
                  _loc5_.dispose();
                  _cache.remove(_loc6_);
               }
            }
         }
      }
      
      public function getAction() : class_3311
      {
         return _currentAction;
      }
      
      public function setDirection(param1:int) : void
      {
         _currentDirection = param1;
      }
      
      public function getDirection() : int
      {
         return _currentDirection;
      }
      
      public function getActionCache(param1:class_3311 = null) : AvatarImageActionCache
      {
         if(!_currentAction)
         {
            return null;
         }
         if(param1 == null)
         {
            param1 = _currentAction;
         }
         if(param1.overridingAction != null)
         {
            return _cache.getValue(param1.overridingAction) as AvatarImageActionCache;
         }
         return _cache.getValue(param1.id) as AvatarImageActionCache;
      }
      
      public function updateActionCache(param1:class_3311, param2:AvatarImageActionCache) : void
      {
         if(param1.overridingAction != null)
         {
            _cache.add(param1.overridingAction,param2);
         }
         else
         {
            _cache.add(param1.id,param2);
         }
      }
      
      private function debugInfo(param1:String) : void
      {
      }
   }
}
