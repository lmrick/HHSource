package com.sulake.habbo.ui.widget.poll
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPollUpdateEvent;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class PollWidget extends RoomWidgetBase
   {
       
      
      private var var_1733:class_24;
      
      public function PollWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null, param4:class_18 = null)
      {
         super(param1,param2,param3,param4);
         var_1733 = new class_24();
      }
      
      override public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:PollSession = null;
         if(disposed)
         {
            return;
         }
         if(var_1733 != null)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = var_1733.getWithIndex(0) as PollSession;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc3_++;
            }
            var_1733.dispose();
            var_1733 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWPUW_OFFER",showPollOffer);
         param1.addEventListener("RWPUW_ERROR",showPollError);
         param1.addEventListener("RWPUW_CONTENT",showPollContent);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWPUW_OFFER",showPollOffer);
         param1.removeEventListener("RWPUW_ERROR",showPollError);
         param1.removeEventListener("RWPUW_CONTENT",showPollContent);
      }
      
      private function showPollOffer(param1:Event) : void
      {
         var _loc4_:int = int(RoomWidgetPollUpdateEvent(param1).id);
         var _loc3_:PollSession = var_1733.getValue(_loc4_) as PollSession;
         var _loc2_:String = String(RoomWidgetPollUpdateEvent(param1).summary);
         var _loc5_:String = String(RoomWidgetPollUpdateEvent(param1).headline);
         if(!_loc3_)
         {
            _loc3_ = new PollSession(_loc4_,this);
            var_1733.add(_loc4_,_loc3_);
            _loc3_.showOffer(_loc5_,_loc2_);
         }
         else
         {
            class_14.log("Poll with given id already exists!");
            _loc3_.showOffer(_loc5_,_loc2_);
         }
      }
      
      private function showPollError(param1:Event) : void
      {
         var e:Event = param1;
         windowManager.alert("${win_error}",RoomWidgetPollUpdateEvent(e).summary,0,function(param1:class_3132, param2:class_3134):void
         {
            param1.dispose();
         });
      }
      
      private function showPollContent(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc2_:PollSession = null;
         var _loc3_:RoomWidgetPollUpdateEvent = param1 as RoomWidgetPollUpdateEvent;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.id;
            _loc2_ = var_1733.getValue(_loc4_) as PollSession;
            if(_loc2_ != null)
            {
               _loc2_.showContent(_loc3_.startMessage,_loc3_.endMessage,_loc3_.questionArray,_loc3_.npsPoll);
            }
         }
      }
      
      public function pollFinished(param1:int) : void
      {
         var _loc2_:PollSession = var_1733.getValue(param1) as PollSession;
         if(_loc2_ != null)
         {
            _loc2_.showThanks();
            _loc2_.dispose();
            var_1733.remove(param1);
         }
      }
      
      public function pollCancelled(param1:int) : void
      {
         var _loc2_:PollSession = var_1733.getValue(param1) as PollSession;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            var_1733.remove(param1);
         }
      }
   }
}
