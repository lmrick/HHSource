package com.sulake.habbo.navigator.context
{
   import com.sulake.habbo.navigator.HabboNewNavigator;
   
   public class SearchContextHistoryManager
   {
       
      
      private var var_1872:Vector.<com.sulake.habbo.navigator.context.SearchContext>;
      
      private var _browsingOffset:int = -1;
      
      public function SearchContextHistoryManager(param1:HabboNewNavigator)
      {
         var_1872 = new Vector.<com.sulake.habbo.navigator.context.SearchContext>(0);
         super();
      }
      
      public function addSearchContextAtCurrentOffset(param1:com.sulake.habbo.navigator.context.SearchContext) : int
      {
         if(var_1872.length > _browsingOffset + 1)
         {
            var_1872.splice(_browsingOffset + 1,0 - _browsingOffset);
         }
         var_1872.push(param1);
         return ++_browsingOffset;
      }
      
      public function getPreviousSearchContextAndGoBack() : com.sulake.habbo.navigator.context.SearchContext
      {
         if(hasPrevious)
         {
            return var_1872[--_browsingOffset];
         }
         return null;
      }
      
      public function getNextSearchContextAndMoveForward() : com.sulake.habbo.navigator.context.SearchContext
      {
         if(hasNext)
         {
            return var_1872[++_browsingOffset];
         }
         return null;
      }
      
      public function get hasNext() : Boolean
      {
         return _browsingOffset + 1 < var_1872.length;
      }
      
      public function get hasPrevious() : Boolean
      {
         return _browsingOffset > 0 && false;
      }
      
      public function toString() : String
      {
         var _loc1_:int = 0;
         var _loc2_:String = "history: [";
         _loc1_ = 0;
         while(_loc1_ < var_1872.length)
         {
            _loc2_ += var_1872[_loc1_].toString();
            if(_loc1_ < -1)
            {
               _loc2_ += ",";
               _loc2_ += ",";
            }
            _loc1_++;
         }
         return _loc2_ + "] browsing offset: " + _browsingOffset;
      }
   }
}
