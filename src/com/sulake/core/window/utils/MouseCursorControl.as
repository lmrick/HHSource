package com.sulake.core.window.utils
{
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var var_271:uint = 0;
      
      private static var var_1652:Stage;
      
      private static var var_805:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_3328:Boolean = true;
      
      private static var var_1602:DisplayObject;
      
      private static var var_3618:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_1652 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1602)
            {
               var_1652.removeChild(var_1602);
               var_1652.removeEventListener("mouseLeave",onStageMouseLeave);
               var_1652.removeEventListener("mouseMove",onStageMouseMove);
               var_1652.removeEventListener("mouseOver",onStageMouseMove);
               var_1652.removeEventListener("mouseOut",onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return var_271;
      }
      
      public static function set type(param1:uint) : void
      {
         if(var_271 != param1)
         {
            var_271 = param1;
            var_3328 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_805;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_805 = param1;
         if(var_805)
         {
            if(var_1602)
            {
               var_1602.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_1602)
         {
            var_1602.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:DisplayObject = null;
         if(var_3328)
         {
            _loc1_ = var_3618[var_271];
            if(_loc1_)
            {
               if(var_1602)
               {
                  var_1652.removeChild(var_1602);
               }
               else
               {
                  var_1652.addEventListener("mouseLeave",onStageMouseLeave);
                  var_1652.addEventListener("mouseMove",onStageMouseMove);
                  var_1652.addEventListener("mouseOver",onStageMouseMove);
                  var_1652.addEventListener("mouseOut",onStageMouseMove);
                  Mouse.hide();
               }
               var_1602 = _loc1_;
               var_1652.addChild(var_1602);
            }
            else
            {
               if(var_1602)
               {
                  var_1652.removeChild(var_1602);
                  var_1652.removeEventListener("mouseLeave",onStageMouseLeave);
                  var_1652.removeEventListener("mouseMove",onStageMouseMove);
                  var_1652.removeEventListener("mouseOver",onStageMouseMove);
                  var_1652.removeEventListener("mouseOut",onStageMouseMove);
                  var_1602 = null;
                  Mouse.show();
               }
               switch(var_271)
               {
                  case 0:
                  case 1:
                     Mouse.cursor = "auto";
                     break;
                  case 2:
                     Mouse.cursor = "button";
                     break;
                  case 5:
                  case 6:
                  case 7:
                  case 8:
                     Mouse.cursor = "hand";
                     break;
                  case 4294967294:
                     Mouse.cursor = "auto";
                     Mouse.hide();
               }
            }
            var_3328 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_3618[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_1602)
         {
            var_1602.x = param1.stageX - 2;
            var_1602.y = param1.stageY;
            if(var_271 == 0)
            {
               var_805 = false;
               Mouse.show();
            }
            else
            {
               var_805 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_1602 && var_271 != 0)
         {
            Mouse.hide();
            var_805 = false;
         }
      }
   }
}
