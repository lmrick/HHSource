package com.sulake.habbo.ui.widget.friendrequest
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFriendRequestUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFriendRequestMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetGetObjectLocationMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   
   public class FriendRequestWidget extends RoomWidgetBase implements class_41
   {
       
      
      private var var_1460:class_20;
      
      private var var_103:class_24;
      
      public function FriendRequestWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18, param5:class_20)
      {
         super(param1,param2,param3,param4);
         var_1460 = param5;
         var_103 = new class_24();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_1460)
         {
            var_1460.removeUpdateReceiver(this);
            var_1460 = null;
         }
         if(var_103)
         {
            for each(var _loc1_ in var_103)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_103.dispose();
            var_103 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener("RWFRUE_SHOW_FRIEND_REQUEST",eventHandler);
         param1.addEventListener("RWFRUE_HIDE_FRIEND_REQUEST",eventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWFRUE_SHOW_FRIEND_REQUEST",eventHandler);
         param1.removeEventListener("RWFRUE_HIDE_FRIEND_REQUEST",eventHandler);
      }
      
      private function eventHandler(param1:RoomWidgetFriendRequestUpdateEvent) : void
      {
         if(!param1)
         {
            return;
         }
         switch(param1.type)
         {
            case "RWFRUE_SHOW_FRIEND_REQUEST":
               addRequest(param1.requestId,new FriendRequestDialog(this,param1.requestId,param1.userId,param1.userName));
               break;
            case "RWFRUE_HIDE_FRIEND_REQUEST":
               removeRequest(param1.requestId);
         }
         checkUpdateNeed();
      }
      
      public function checkUpdateNeed() : void
      {
         if(!var_1460)
         {
            return;
         }
         if(var_103 && false)
         {
            var_1460.registerUpdateReceiver(this,10);
         }
         else
         {
            var_1460.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:RoomWidgetUserLocationUpdateEvent = null;
         if(!var_103)
         {
            return;
         }
         for each(var _loc2_ in var_103)
         {
            if(_loc2_)
            {
               _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION",_loc2_.userId,1)) as RoomWidgetUserLocationUpdateEvent;
               if(_loc3_)
               {
                  _loc2_.targetRect = _loc3_.rectangle;
               }
            }
         }
      }
      
      public function acceptRequest(param1:int) : void
      {
         if(!messageListener)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage("RWFRM_ACCEPT",param1));
         removeRequest(param1);
      }
      
      public function declineRequest(param1:int) : void
      {
         if(!messageListener)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage("RWFRM_DECLINE",param1));
         removeRequest(param1);
      }
      
      public function ignoreRequest(param1:int) : void
      {
         removeRequest(param1);
      }
      
      private function addRequest(param1:int, param2:FriendRequestDialog) : void
      {
         if(!var_103 || !param2)
         {
            return;
         }
         var_103.add(param1,param2);
      }
      
      private function removeRequest(param1:int) : void
      {
         if(!var_103)
         {
            return;
         }
         var _loc2_:FriendRequestDialog = var_103.getValue(param1) as FriendRequestDialog;
         if(!_loc2_)
         {
            return;
         }
         var_103.remove(param1);
         _loc2_.dispose();
         checkUpdateNeed();
      }
      
      public function showProfile(param1:int, param2:String) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE",param1,param2));
      }
   }
}
