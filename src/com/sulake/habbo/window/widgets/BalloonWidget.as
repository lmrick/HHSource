package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.utils.class_403;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.habbo.window.enum.class_3506;
   import flash.geom.Rectangle;
   
   public class BalloonWidget implements class_3343
   {
      
      public static const TYPE:String = "balloon";
      
      private static const ARROW_PIVOT_KEY:String = "balloon:arrow_pivot";
      
      private static const ARROW_DISPLACEMENT_KEY:String = "balloon:arrow_displacement";
      
      private static const ARROW_PIVOT_DEFAULT:PropertyStruct = new PropertyStruct("balloon:arrow_pivot","up, center","String",false,class_3506.ALL);
      
      private static const ARROW_DISPLACEMENT_DEFAULT:PropertyStruct = new PropertyStruct("balloon:arrow_displacement",0,"int");
      
      private static const ARROW_ASSET_PREFIX:String = "illumina_light_balloon_arrow_";
      
      private static const ARROW_FREE_PADDING:int = 6;
      
      private static const ARROW_LENGTH:int = 6;
      
      private static const ARROW_WIDTH:int = 9;
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_3243:Boolean = false;
      
      private var var_1875:Boolean = false;
      
      private var var_464:class_3151;
      
      private var var_1526:class_3151;
      
      private var var_2667:IStaticBitmapWrapperWindow;
      
      private var var_2416:String;
      
      private var var_2483:int;
      
      public function BalloonWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_2416 = "null";
         var_2483 = 0;
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("balloon_xml").content as XML) as class_3151;
         var_2667 = var_464.findChildByName("bitmap") as IStaticBitmapWrapperWindow;
         var_1526 = var_464.findChildByName("border") as class_3151;
         syncFlags();
         var_1547.addEventListener("WE_RESIZE",onChange);
         var_1547.addEventListener("WE_RESIZED",onChange);
         var_1526.addEventListener("WE_RESIZE",onChange);
         var_1526.addEventListener("WE_RESIZED",onChange);
         var_1547.rootWindow = var_464;
         var_464.width = var_1547.width;
         var_464.height = var_1547.height;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1526 != null)
            {
               var_1526.removeEventListener("WE_RESIZE",onChange);
               var_1526.removeEventListener("WE_RESIZED",onChange);
               var_1526 = null;
            }
            var_2667 = null;
            if(var_464 != null)
            {
               var_464.dispose();
               var_464 = null;
            }
            if(var_1547 != null)
            {
               var_1547.removeEventListener("WE_RESIZE",onChange);
               var_1547.removeEventListener("WE_RESIZED",onChange);
               var_1547.rootWindow = null;
               var_1547 = null;
            }
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get iterator() : IIterator
      {
         return var_1526 == null ? EmptyIterator.INSTANCE : var_1526.iterator;
      }
      
      public function get properties() : Array
      {
         var _loc1_:* = [];
         if(_disposed)
         {
            return _loc1_;
         }
         _loc1_.push(ARROW_PIVOT_DEFAULT.withValue(var_2416));
         _loc1_.push(ARROW_DISPLACEMENT_DEFAULT.withValue(var_2483));
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         var_3243 = true;
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "balloon:arrow_pivot":
                  arrowPivot = String(_loc2_.value);
                  break;
               case "balloon:arrow_displacement":
                  arrowDisplacement = int(_loc2_.value);
                  break;
            }
         }
         var_3243 = false;
         refresh();
      }
      
      public function get arrowPivot() : String
      {
         return var_2416;
      }
      
      public function set arrowPivot(param1:String) : void
      {
         var_2416 = param1;
         clearFlags();
         refresh();
         syncFlags();
         refresh();
      }
      
      public function get arrowDisplacement() : int
      {
         return var_2483;
      }
      
      public function set arrowDisplacement(param1:int) : void
      {
         var_2483 = param1;
         refresh();
      }
      
      private function onChange(param1:class_3134) : void
      {
         refresh();
      }
      
      private function syncFlags() : void
      {
         if(var_1526 != null)
         {
            var_1526.setParamFlag(131072,var_1547.getParamFlag(131072));
            var_1526.setParamFlag(147456,var_1547.getParamFlag(147456));
         }
      }
      
      private function clearFlags() : void
      {
         if(var_1526 != null)
         {
            var_1526.setParamFlag(131072,false);
            var_1526.setParamFlag(147456,false);
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(var_3243 || var_1875 || _disposed || var_1526 == null)
         {
            return;
         }
         var _loc4_:String;
         switch(_loc4_ = class_3506.directionFromPivot(var_2416))
         {
            case "up":
            case "down":
               _loc1_ = 0;
               _loc3_ = 0;
               break;
            case "left":
            case "right":
               _loc1_ = 0;
               _loc3_ = 0;
         }
         var_1875 = true;
         if(var_1547.testParamFlag(147456))
         {
            var_464.width = _loc1_;
            var_464.height = _loc3_;
         }
         else if(var_1547.testParamFlag(131072))
         {
            var_464.width = Math.max(var_1547.width,_loc1_);
            var_464.height = Math.max(var_1547.height,_loc3_);
         }
         else
         {
            var_464.width = var_1547.width;
            var_464.height = var_1547.height;
         }
         var_1547.width = var_464.width;
         var_1547.height = var_464.height;
         var_1875 = false;
         var_2667.assetUri = "illumina_light_balloon_arrow_" + _loc4_;
         switch(_loc4_)
         {
            case "up":
            case "down":
               switch(class_3506.positionFromPivot(var_2416))
               {
                  case "minimum":
                     _loc2_ = 6;
                     break;
                  case "middle":
                     _loc2_ = -4;
                     break;
                  case "maximum":
                     _loc2_ = -15;
               }
               var_1875 = true;
               var_1526.rectangle = new Rectangle(0,_loc4_ == "up" ? 5 : 0,var_464.width,NaN);
               var_1875 = false;
               var_2667.rectangle = new Rectangle(class_403.clamp(_loc2_ + var_2483,6,-6),_loc4_ == "up" ? 0 : -1,9,6);
               break;
            case "left":
            case "right":
               switch(class_3506.positionFromPivot(var_2416))
               {
                  case "minimum":
                     _loc2_ = 6;
                     break;
                  case "middle":
                     _loc2_ = -4;
                     break;
                  case "maximum":
                     _loc2_ = -15;
               }
               var_1875 = true;
               var_1526.rectangle = new Rectangle(_loc4_ == "left" ? 5 : 0,0,NaN,var_464.height);
               var_1875 = false;
               var_2667.rectangle = new Rectangle(_loc4_ == "left" ? 0 : -1,class_403.clamp(_loc2_ + var_2483,6,-6),6,9);
         }
      }
   }
}
