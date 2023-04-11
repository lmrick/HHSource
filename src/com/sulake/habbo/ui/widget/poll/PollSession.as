package com.sulake.habbo.ui.widget.poll
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.utils.class_3132;
   
   public class PollSession implements class_13
   {
       
      
      private var var_247:int = -1;
      
      private var var_2799:com.sulake.habbo.ui.widget.poll.PollWidget;
      
      private var var_1956:com.sulake.habbo.ui.widget.poll.class_3419;
      
      private var var_1960:com.sulake.habbo.ui.widget.poll.class_3419;
      
      private var _endMessage:String = "";
      
      private var _disposed:Boolean = false;
      
      public function PollSession(param1:int, param2:com.sulake.habbo.ui.widget.poll.PollWidget)
      {
         super();
         var_247 = param1;
         var_2799 = param2;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_1956 != null)
         {
            var_1956.dispose();
            var_1956 = null;
         }
         if(var_1960 != null)
         {
            var_1960.dispose();
            var_1960 = null;
         }
         var_2799 = null;
         _disposed = true;
      }
      
      public function showOffer(param1:String, param2:String) : void
      {
         hideOffer();
         var_1956 = new PollOfferDialog(var_247,param1,param2,var_2799);
         var_1956.start();
      }
      
      public function hideOffer() : void
      {
         if(var_1956 is PollOfferDialog)
         {
            if(true)
            {
               var_1956.dispose();
            }
            var_1956 = null;
         }
      }
      
      public function showContent(param1:String, param2:String, param3:Array, param4:Boolean) : void
      {
         hideOffer();
         hideContent();
         _endMessage = param2;
         var_1960 = new PollContentDialog(var_247,param1,param3,var_2799,param4);
         var_1960.start();
      }
      
      public function hideContent() : void
      {
         if(var_1960 is PollContentDialog)
         {
            if(true)
            {
               var_1960.dispose();
            }
            var_1960 = null;
         }
      }
      
      public function showThanks() : void
      {
         var_2799.windowManager.alert("${poll_thanks_title}",_endMessage,0,function(param1:class_3132, param2:class_3134):void
         {
            param1.dispose();
         });
      }
   }
}
