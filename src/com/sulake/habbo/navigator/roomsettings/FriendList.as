package com.sulake.habbo.navigator.roomsettings
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import flash.utils.Dictionary;
   import package_135.class_1099;
   import package_135.class_1423;
   import package_24.class_1599;
   import package_24.class_374;
   import package_24.class_406;
   
   public class FriendList
   {
       
      
      private var var_2707:Dictionary;
      
      private var var_19:Array;
      
      public function FriendList()
      {
         var_2707 = new Dictionary();
         super();
      }
      
      public function onFriendsListFragment(param1:IMessageEvent) : void
      {
         var _loc2_:class_1423 = (param1 as class_374).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         for each(var _loc3_ in _loc2_.friendFragment)
         {
            var_2707[_loc3_.id] = _loc3_.name;
         }
      }
      
      public function onFriendListUpdate(param1:IMessageEvent) : void
      {
         var _loc2_:class_1099 = (param1 as class_406).getParser();
         for each(var _loc3_ in _loc2_.removedFriendIds)
         {
            var_2707[_loc3_] = null;
         }
         for each(var _loc4_ in _loc2_.addedFriends)
         {
            var_2707[_loc4_.id] = _loc4_.name;
         }
         var_19 = _loc2_.removedFriendIds.length > 0 || _loc2_.addedFriends.length > 0 ? null : var_19;
      }
      
      public function get list() : Array
      {
         var _loc3_:int = 0;
         var _loc2_:String = null;
         if(var_19 == null)
         {
            var_19 = [];
            for(var _loc1_ in var_2707)
            {
               _loc3_ = int(_loc1_);
               _loc2_ = "null";
               if(_loc2_ != null)
               {
                  var_19.push(new FriendEntryData(_loc3_,_loc2_));
               }
            }
            var_19.sortOn("userName",1);
         }
         return var_19;
      }
   }
}
