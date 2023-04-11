package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import package_24.class_1646;
   
   public class FriendRequest implements class_13
   {
      
      public static const STATE_OPEN:int = 1;
      
      public static const STATE_ACCEPTED:int = 2;
      
      public static const STATE_DECLINED:int = 3;
      
      public static const STATE_FAILED:int = 4;
       
      
      private var var_438:int;
      
      private var _requesterName:String;
      
      private var var_984:int;
      
      private var var_159:int = 1;
      
      private var _disposed:Boolean;
      
      private var var_1430:class_3151;
      
      public function FriendRequest(param1:class_1646)
      {
         super();
         var_438 = param1.requestId;
         _requesterName = param1.requesterName;
         var_984 = param1.requesterUserId;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(view != null)
         {
            view.destroy();
            view = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get requestId() : int
      {
         return var_438;
      }
      
      public function get requesterName() : String
      {
         return _requesterName;
      }
      
      public function get requesterUserId() : int
      {
         return var_984;
      }
      
      public function get view() : class_3151
      {
         return var_1430;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function set view(param1:class_3151) : void
      {
         var_1430 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_159 = param1;
      }
   }
}
