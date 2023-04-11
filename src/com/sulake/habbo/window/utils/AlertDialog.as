package com.sulake.habbo.window.utils
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.utils.INotify;
   import com.sulake.habbo.window.class_1684;
   
   public class AlertDialog implements class_3132, INotify
   {
      
      protected static const LIST_BUTTONS:String = "_alert_button_list";
      
      protected static const const_897:String = "_alert_button_ok";
      
      protected static const const_602:String = "_alert_button_cancel";
      
      protected static const BUTTON_CUSTOM:String = "_alert_button_custom";
      
      protected static const const_967:String = "header_button_close";
      
      protected static const const_679:String = "_alert_text_summary";
      
      private static var var_1186:uint = 0;
       
      
      protected var var_462:String = "";
      
      protected var var_536:String = "";
      
      protected var _disposed:Boolean = false;
      
      protected var _callback:Function = null;
      
      protected var _window:class_3281;
      
      protected var var_1680:com.sulake.habbo.window.utils.IModalDialog;
      
      public function AlertDialog(param1:class_1684, param2:XML, param3:String, param4:String, param5:uint, param6:Function, param7:Boolean)
      {
         var _loc8_:class_3127 = null;
         super();
         var_1186++;
         if(param7)
         {
            var_1680 = param1.buildModalDialogFromXML(param2);
            _window = var_1680.rootWindow as class_3281;
         }
         else
         {
            _window = param1.buildFromXML(param2,2) as class_3281;
         }
         if(param5 == 0)
         {
            param5 = 19;
         }
         var _loc9_:IItemListWindow;
         if(_loc9_ = _window.findChildByName("_alert_button_list") as IItemListWindow)
         {
            if(!(param5 & 16))
            {
               (_loc8_ = _loc9_.getListItemByName("_alert_button_ok")).dispose();
            }
            if(!(param5 & 32))
            {
               (_loc8_ = _loc9_.getListItemByName("_alert_button_cancel")).dispose();
            }
            if(!(param5 & 64))
            {
               (_loc8_ = _loc9_.getListItemByName("_alert_button_custom")).dispose();
            }
         }
         _window.procedure = dialogEventProc;
         _window.center();
         this.title = param3;
         this.summary = param4;
         this.callback = param6;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1680)
            {
               var_1680.dispose();
               var_1680 = null;
               _window = null;
            }
            if(_window)
            {
               _window.dispose();
               _window = null;
            }
            _callback = null;
            _disposed = true;
         }
      }
      
      protected function dialogEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:class_3134 = null;
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "_alert_button_ok":
                  if(_callback != null)
                  {
                     _loc3_ = class_3134.allocate("WE_OK",null,null);
                     _callback(this,_loc3_);
                     _loc3_.recycle();
                     break;
                  }
                  dispose();
                  break;
               case "header_button_close":
               case "_alert_button_cancel":
                  if(_callback != null)
                  {
                     _loc3_ = class_3134.allocate("WE_CANCEL",null,null);
                     _callback(this,_loc3_);
                     _loc3_.recycle();
                     break;
                  }
                  dispose();
                  break;
            }
         }
      }
      
      public function getButtonCaption(param1:int) : ICaption
      {
         var _loc2_:IInteractiveWindow = null;
         if(!_disposed)
         {
            switch(param1)
            {
               case 16:
                  _loc2_ = _window.findChildByName("_alert_button_ok") as IInteractiveWindow;
                  break;
               case 32:
                  _loc2_ = _window.findChildByName("_alert_button_cancel") as IInteractiveWindow;
                  break;
               case 64:
                  _loc2_ = _window.findChildByName("_alert_button_custom") as IInteractiveWindow;
            }
         }
         return !!_loc2_ ? new AlertDialogCaption(_loc2_.caption,_loc2_.toolTipCaption,_loc2_.visible) : null;
      }
      
      public function setButtonCaption(param1:int, param2:ICaption) : void
      {
         var _loc3_:IInteractiveWindow = null;
         if(!_disposed)
         {
            switch(param1)
            {
               case 16:
                  _loc3_ = _window.findChildByName("_alert_button_ok") as IInteractiveWindow;
                  break;
               case 32:
                  _loc3_ = _window.findChildByName("_alert_button_cancel") as IInteractiveWindow;
                  break;
               case 64:
                  _loc3_ = _window.findChildByName("_alert_button_custom") as IInteractiveWindow;
            }
         }
         if(_loc3_)
         {
            _loc3_.caption = param2.text;
         }
      }
      
      public function set title(param1:String) : void
      {
         var_462 = param1;
         if(_window)
         {
            _window.caption = var_462;
         }
      }
      
      public function get title() : String
      {
         return var_462;
      }
      
      public function set summary(param1:String) : void
      {
         var_536 = param1;
         if(_window)
         {
            ITextWindow(_window.findChildByTag("DESCRIPTION")).text = var_536;
         }
      }
      
      public function get summary() : String
      {
         return var_536;
      }
      
      public function set callback(param1:Function) : void
      {
         _callback = param1;
      }
      
      public function get callback() : Function
      {
         return _callback;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
   }
}
