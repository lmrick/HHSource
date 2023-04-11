package com.sulake.core.window.events
{
   import com.sulake.core.window.class_3127;
   
   public class WindowMouseEvent extends class_3134
   {
      
      public static const CLICK:String = "WME_CLICK";
      
      public static const DOUBLE_CLICK:String = "WME_DOUBLE_CLICK";
      
      public static const DOWN:String = "WME_DOWN";
      
      public static const MIDDLE_CLICK:String = "WME_MIDDLE_CLICK";
      
      public static const const_501:String = "WME_MIDDLE_DOWN";
      
      public static const const_684:String = "WME_MIDDLE_UP";
      
      public static const MOVE:String = "WME_MOVE";
      
      public static const const_843:String = "WME_OUT";
      
      public static const OVER:String = "WME_OVER";
      
      public static const const_447:String = "WME_UP";
      
      public static const UP_OUTSIDE:String = "WME_UP_OUTSIDE";
      
      public static const const_917:String = "WME_WHEEL";
      
      public static const RIGHT_CLICK:String = "WME_RIGHT_CLICK";
      
      public static const const_803:String = "WME_RIGHT_DOWN";
      
      public static const const_537:String = "WME_RIGHT_UP";
      
      public static const ROLL_OUT:String = "WME_ROLL_OUT";
      
      public static const ROLL_OVER:String = "WME_ROLL_OVER";
      
      public static const HOVERING:String = "WME_HOVERING";
      
      private static const const_421:Array = [];
       
      
      public var delta:int;
      
      public var localX:Number;
      
      public var localY:Number;
      
      public var stageX:Number;
      
      public var stageY:Number;
      
      public var altKey:Boolean;
      
      public var ctrlKey:Boolean;
      
      public var shiftKey:Boolean;
      
      public var buttonDown:Boolean;
      
      public function WindowMouseEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:class_3127, param3:class_3127, param4:Number, param5:Number, param6:Number, param7:Number, param8:Boolean, param9:Boolean, param10:Boolean, param11:Boolean, param12:int) : WindowMouseEvent
      {
         var _loc13_:WindowMouseEvent;
         (_loc13_ = const_421.length > 0 ? const_421.pop() : new WindowMouseEvent()).var_271 = param1;
         _loc13_._window = param2;
         _loc13_.var_2304 = param3;
         _loc13_.var_1501 = false;
         _loc13_.var_2472 = const_421;
         _loc13_.localX = param4;
         _loc13_.localY = param5;
         _loc13_.stageX = param6;
         _loc13_.stageY = param7;
         _loc13_.altKey = param8;
         _loc13_.ctrlKey = param9;
         _loc13_.shiftKey = param10;
         _loc13_.buttonDown = param11;
         _loc13_.delta = param12;
         return _loc13_;
      }
      
      override public function clone() : class_3134
      {
         return allocate(var_271,window,related,localX,localY,stageX,stageY,altKey,ctrlKey,shiftKey,buttonDown,delta);
      }
      
      override public function toString() : String
      {
         return "WindowMouseEvent { type: " + var_271 + " cancelable: " + var_2152 + " window: " + _window + " localX: " + localX + " localY: " + localY + " }";
      }
   }
}
