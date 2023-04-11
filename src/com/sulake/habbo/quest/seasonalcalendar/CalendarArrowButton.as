package com.sulake.habbo.quest.seasonalcalendar
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class CalendarArrowButton
   {
      
      public static const DIRECTION_BACK:int = 0;
      
      public static const const_905:int = 1;
      
      public static const STATE_INACTIVE:int = 0;
      
      public static const STATE_ACTIVE:int = 1;
      
      public static const STATE_HILITE:int = 2;
      
      private static const PRESSED_OFFSET_PIXELS:Point = new Point(1,1);
       
      
      private var _window:class_3282;
      
      private var _callback:Function;
      
      private var var_159:int = 0;
      
      private var _pressed:Boolean = false;
      
      private var _initialLocation:Point;
      
      private var var_2723:BitmapData;
      
      private var var_2634:BitmapData;
      
      private var var_2846:BitmapData;
      
      public function CalendarArrowButton(param1:class_21, param2:class_3282, param3:int, param4:Function)
      {
         super();
         _window = param2;
         _window.procedure = procedure;
         _callback = param4;
         switch(param3)
         {
            case 0:
               var_2634 = BitmapData(param1.getAssetByName("arrow_back_active").content).clone();
               var_2723 = BitmapData(param1.getAssetByName("arrow_back_inactive").content).clone();
               var_2846 = BitmapData(param1.getAssetByName("arrow_back_hilite").content).clone();
               break;
            case 1:
               var_2634 = BitmapData(param1.getAssetByName("arrow_next_active").content).clone();
               var_2723 = BitmapData(param1.getAssetByName("arrow_next_inactive").content).clone();
               var_2846 = BitmapData(param1.getAssetByName("arrow_next_hilite").content).clone();
         }
         _initialLocation = new Point(_window.x,_window.y);
         updateWindow();
      }
      
      public function dispose() : void
      {
         var_2634 = null;
         var_2846 = null;
         var_2723 = null;
         _window.procedure = null;
         _window = null;
         _callback = null;
      }
      
      public function activate() : void
      {
         if(var_159 != 1 && var_159 != 2)
         {
            var_159 = 1;
         }
         updateWindow();
      }
      
      public function deactivate() : void
      {
         var_159 = 0;
         updateWindow();
      }
      
      public function isInactive() : Boolean
      {
         return var_159 == 0;
      }
      
      private function updateWindow() : void
      {
         switch(var_159)
         {
            case 0:
               _window.bitmap = var_2723;
               break;
            case 1:
               _window.bitmap = var_2634;
               break;
            case 2:
               _window.bitmap = var_2846;
         }
         if(_pressed)
         {
            _window.x = NaN;
            _window.y = NaN;
         }
         else
         {
            _window.position = _initialLocation;
         }
      }
      
      private function procedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1 as WindowMouseEvent != null)
         {
            switch(param1.type)
            {
               case "WME_OVER":
                  if(var_159 != 0)
                  {
                     var_159 = 2;
                     break;
                  }
                  break;
               case "WME_OUT":
                  if(var_159 != 0)
                  {
                     var_159 = 1;
                     break;
                  }
                  break;
               case "WME_DOWN":
                  _pressed = true;
                  break;
               case "WME_UP":
               case "WME_UP_OUTSIDE":
                  _pressed = false;
            }
            updateWindow();
            _callback(param1,param2);
         }
      }
   }
}
