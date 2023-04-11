package com.sulake.core.window.events
{
   import com.sulake.core.window.class_3127;
   
   public class WindowEvent
   {
      
      public static const const_947:String = "WE_DESTROY";
      
      public static const const_673:String = "WE_DESTROYED";
      
      public static const const_787:String = "WE_OPEN";
      
      public static const const_1124:String = "WE_OPENED";
      
      public static const const_1106:String = "WE_CLOSE";
      
      public static const const_1135:String = "WE_CLOSED";
      
      public static const WINDOW_EVENT_FOCUS:String = "WE_FOCUS";
      
      public static const const_1054:String = "WE_FOCUSED";
      
      public static const WINDOW_EVENT_UNFOCUS:String = "WE_UNFOCUS";
      
      public static const const_799:String = "WE_UNFOCUSED";
      
      public static const const_683:String = "WE_ACTIVATE";
      
      public static const const_1128:String = "WE_ACTIVATED";
      
      public static const const_807:String = "WE_DEACTIVATE";
      
      public static const const_605:String = "WE_DEACTIVATED";
      
      public static const const_695:String = "WE_SELECT";
      
      public static const const_1156:String = "WE_SELECTED";
      
      public static const const_838:String = "WE_UNSELECT";
      
      public static const const_791:String = "WE_UNSELECTED";
      
      public static const WINDOW_EVENT_LOCK:String = "WE_LOCK";
      
      public static const const_937:String = "WE_LOCKED";
      
      public static const WINDOW_EVENT_UNLOCK:String = "WE_UNLOCK";
      
      public static const const_562:String = "WE_UNLOCKED";
      
      public static const const_524:String = "WE_ENABLE";
      
      public static const const_846:String = "WE_ENABLED";
      
      public static const const_1178:String = "WE_DISABLE";
      
      public static const const_761:String = "WE_DISABLED";
      
      public static const const_608:String = "WE_RELOCATE";
      
      public static const const_1018:String = "WE_RELOCATED";
      
      public static const const_769:String = "WE_RESIZE";
      
      public static const const_706:String = "WE_RESIZED";
      
      public static const const_1095:String = "WE_MINIMIZE";
      
      public static const const_1176:String = "WE_MINIMIZED";
      
      public static const const_545:String = "WE_MAXIMIZE";
      
      public static const const_676:String = "WE_MAXIMIZED";
      
      public static const WINDOW_EVENT_RESTORE:String = "WE_RESTORE";
      
      public static const const_1127:String = "WE_RESTORED";
      
      public static const const_664:String = "WE_CHILD_ADDED";
      
      public static const const_708:String = "WE_CHILD_REMOVED";
      
      public static const const_940:String = "WE_CHILD_RELOCATED";
      
      public static const const_523:String = "WE_CHILD_RESIZED";
      
      public static const const_1151:String = "WE_CHILD_ACTIVATED";
      
      public static const const_1049:String = "WE_CHILD_VISIBILITY";
      
      public static const const_645:String = "WE_PARENT_ADDED";
      
      public static const const_730:String = "WE_PARENT_REMOVED";
      
      public static const const_647:String = "WE_PARENT_RELOCATED";
      
      public static const const_988:String = "WE_PARENT_RESIZED";
      
      public static const const_729:String = "WE_PARENT_ACTIVATED";
      
      public static const const_732:String = "WE_OK";
      
      public static const const_675:String = "WE_CANCEL";
      
      public static const WINDOW_EVENT_CHANGE:String = "WE_CHANGE";
      
      public static const const_500:String = "WE_SCROLL";
      
      public static const UNKNOWN:String = "";
      
      private static const const_421:Array = [];
       
      
      protected var var_271:String;
      
      protected var _window:class_3127;
      
      protected var var_2304:class_3127;
      
      protected var var_2171:Boolean;
      
      protected var var_2152:Boolean;
      
      protected var var_1501:Boolean;
      
      protected var var_2472:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:class_3127, param3:class_3127, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent;
         (_loc5_ = const_421.length > 0 ? const_421.pop() : new WindowEvent()).var_271 = param1;
         _loc5_._window = param2;
         _loc5_.var_2304 = param3;
         _loc5_.var_2152 = param4;
         _loc5_.var_1501 = false;
         _loc5_.var_2472 = const_421;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get target() : class_3127
      {
         return _window;
      }
      
      public function get window() : class_3127
      {
         return _window;
      }
      
      public function get related() : class_3127
      {
         return var_2304;
      }
      
      public function get cancelable() : Boolean
      {
         return var_2152;
      }
      
      public function recycle() : void
      {
         if(var_1501)
         {
            throw new Error("Event already recycled!");
         }
         _window = var_2304 = null;
         var_1501 = true;
         var_2171 = false;
         var_2472.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(var_271,window,related,cancelable);
      }
      
      public function preventDefault() : void
      {
         preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return var_2171;
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_2171 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_2171;
      }
      
      public function stopPropagation() : void
      {
         var_2171 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         var_2171 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + var_271 + " cancelable: " + var_2152 + " window: " + _window + " }";
      }
   }
}
