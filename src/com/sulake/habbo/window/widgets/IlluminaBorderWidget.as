package com.sulake.habbo.window.widgets
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class IlluminaBorderWidget implements IIlluminaBorderWidget
   {
      
      public static const TYPE:String = "illumina_border";
      
      public static const BORDER_STYLE_ILLUMINA_LIGHT:String = "illumina_light";
      
      public static const BORDER_STYLE_ILLUMINA_DARK:String = "illumina_dark";
      
      public static const BORDER_STYLES:Array = ["illumina_light","illumina_dark"];
      
      public static const BORDER_STYLE_KEY:String = "illumina_border:border_style";
      
      private static const CONTENT_CHILD_KEY:String = "illumina_border:content_child";
      
      private static const CONTENT_PADDING_KEY:String = "illumina_border:content_padding";
      
      private static const SIDE_PADDING_KEY:String = "illumina_border:side_padding";
      
      private static const CHILD_MARGIN_KEY:String = "illumina_border:child_margin";
      
      private static const TOP_LEFT_CHILD_KEY:String = "illumina_border:top_left_child";
      
      private static const TOP_CENTER_CHILD_KEY:String = "illumina_border:top_center_child";
      
      private static const TOP_RIGHT_CHILD_KEY:String = "illumina_border:top_right_child";
      
      private static const BOTTOM_LEFT_CHILD_KEY:String = "illumina_border:bottom_left_child";
      
      private static const BOTTOM_CENTER_CHILD_KEY:String = "illumina_border:bottom_center_child";
      
      private static const BOTTOM_RIGHT_CHILD_KEY:String = "illumina_border:bottom_right_child";
      
      private static const LANDING_VIEW_MODE_KEY:String = "illumina_border:landing_view_mode";
      
      private static const CONTENT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:content_child","","String");
      
      private static const CONTENT_PADDING_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:content_padding",5,"uint");
      
      private static const SIDE_PADDING_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:side_padding",15,"uint");
      
      private static const CHILD_MARGIN_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:child_margin",3,"uint");
      
      private static const TOP_LEFT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:top_left_child","","String");
      
      private static const TOP_CENTER_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:top_center_child","","String");
      
      private static const TOP_RIGHT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:top_right_child","","String");
      
      private static const BOTTOM_LEFT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:bottom_left_child","","String");
      
      private static const BOTTOM_CENTER_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:bottom_center_child","","String");
      
      private static const BOTTOM_RIGHT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:bottom_right_child","","String");
      
      private static const LANDING_VIEW_MODE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:landing_view_mode",false,"Boolean");
      
      private static const MATRIX:Matrix = new Matrix();
      
      private static const TOP_LEFT:String = "top_left";
      
      private static const TOP:String = "top_center";
      
      private static const TOP_RIGHT:String = "top_right";
      
      private static const RIGHT:String = "center_right";
      
      private static const BOTTOM_RIGHT:String = "bottom_right";
      
      private static const BOTTOM:String = "bottom_center";
      
      private static const BOTTOM_LEFT:String = "bottom_left";
      
      private static const const_433:String = "center_left";
      
      private static const BORDER_PIECES:Array = ["top_left","top_center","top_right","center_right","bottom_right","bottom_center","bottom_left","center_left"];
       
      
      private var var_2716:Dictionary;
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var var_1492:class_3282;
      
      private var var_1651:BitmapData;
      
      private var _children:class_3151;
      
      private var var_3243:Boolean = false;
      
      private var var_1875:Boolean = false;
      
      private var var_3454:String;
      
      private var var_2590:String;
      
      private var var_2445:uint;
      
      private var var_2464:uint;
      
      private var _childMargin:uint;
      
      private var var_2584:String;
      
      private var var_2516:String;
      
      private var var_2499:String;
      
      private var var_2490:String;
      
      private var var_2514:String;
      
      private var var_2442:String;
      
      private var var_2475:Boolean;
      
      public function IlluminaBorderWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_2590 = "null";
         var_2445 = 0;
         var_2464 = 0;
         _childMargin = 0;
         var_2584 = "null";
         var_2516 = "null";
         var_2499 = "null";
         var_2490 = "null";
         var_2514 = "null";
         var_2442 = "null";
         var_2475 = false;
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("illumina_border_xml").content as XML) as class_3151;
         var_1492 = var_464.getChildByName("canvas") as class_3282;
         _children = var_464.getChildByName("children") as class_3151;
         borderStyle = String(var_1547.getDefaultProperty("illumina_border:border_style").value);
         var_1547.addEventListener("WE_RESIZE",onChange);
         var_1547.addEventListener("WE_RESIZED",onChange);
         _children.addEventListener("WE_CHILD_ADDED",onChange);
         _children.addEventListener("WE_CHILD_REMOVED",onChange);
         _children.addEventListener("WE_CHILD_RELOCATED",onChange);
         _children.addEventListener("WE_CHILD_RESIZED",onChange);
         var_1547.rootWindow = var_464;
         var_464.width = var_1547.width;
         var_464.height = var_1547.height;
      }
      
      private function onChange(param1:class_3134) : void
      {
         refresh();
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1651 != null)
            {
               var_1651.dispose();
               var_1651 = null;
            }
            if(var_1492 != null)
            {
               var_1492.removeEventListener("WE_RESIZE",onChange);
               var_1492.removeEventListener("WE_RESIZED",onChange);
               var_1492 = null;
            }
            if(_children != null)
            {
               _children.removeEventListener("WE_CHILD_ADDED",onChange);
               _children.removeEventListener("WE_CHILD_REMOVED",onChange);
               _children.removeEventListener("WE_CHILD_RELOCATED",onChange);
               _children.removeEventListener("WE_CHILD_RESIZED",onChange);
               _children = null;
            }
            if(var_464 != null)
            {
               var_464.dispose();
               var_464 = null;
            }
            if(var_1547 != null)
            {
               var_1547.rootWindow = null;
               var_1547 = null;
            }
            var_2716 = null;
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
         return _children.iterator;
      }
      
      public function get properties() : Array
      {
         var _loc1_:* = [];
         if(_disposed)
         {
            return _loc1_;
         }
         _loc1_.push(var_1547.createProperty("illumina_border:border_style",var_3454));
         _loc1_.push(CONTENT_CHILD_DEFAULT.withValue(var_2590));
         _loc1_.push(CONTENT_PADDING_DEFAULT.withValue(var_2445));
         _loc1_.push(SIDE_PADDING_DEFAULT.withValue(var_2464));
         _loc1_.push(CHILD_MARGIN_DEFAULT.withValue(_childMargin));
         _loc1_.push(TOP_LEFT_CHILD_DEFAULT.withValue(var_2584));
         _loc1_.push(TOP_CENTER_CHILD_DEFAULT.withValue(var_2516));
         _loc1_.push(TOP_RIGHT_CHILD_DEFAULT.withValue(var_2499));
         _loc1_.push(BOTTOM_LEFT_CHILD_DEFAULT.withValue(var_2490));
         _loc1_.push(BOTTOM_CENTER_CHILD_DEFAULT.withValue(var_2514));
         _loc1_.push(BOTTOM_RIGHT_CHILD_DEFAULT.withValue(var_2442));
         _loc1_.push(LANDING_VIEW_MODE_DEFAULT.withValue(var_2475));
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         if(_disposed)
         {
            return;
         }
         var_3243 = true;
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "illumina_border:border_style":
                  borderStyle = String(_loc2_.value);
                  break;
               case "illumina_border:content_child":
                  contentChild = String(_loc2_.value);
                  break;
               case "illumina_border:content_padding":
                  contentPadding = uint(_loc2_.value);
                  break;
               case "illumina_border:side_padding":
                  sidePadding = uint(_loc2_.value);
                  break;
               case "illumina_border:child_margin":
                  childMargin = uint(_loc2_.value);
                  break;
               case "illumina_border:top_left_child":
                  topLeftChild = String(_loc2_.value);
                  break;
               case "illumina_border:top_center_child":
                  topCenterChild = String(_loc2_.value);
                  break;
               case "illumina_border:top_right_child":
                  topRightChild = String(_loc2_.value);
                  break;
               case "illumina_border:bottom_left_child":
                  bottomLeftChild = String(_loc2_.value);
                  break;
               case "illumina_border:bottom_center_child":
                  bottomCenterChild = String(_loc2_.value);
                  break;
               case "illumina_border:bottom_right_child":
                  bottomRightChild = String(_loc2_.value);
                  break;
               case "illumina_border:landing_view_mode":
                  landingViewMode = Boolean(_loc2_.value);
                  break;
            }
         }
         var_3243 = false;
         refresh();
      }
      
      public function get borderStyle() : String
      {
         return var_3454;
      }
      
      public function set borderStyle(param1:String) : void
      {
         var_3454 = param1;
         var_2716 = new Dictionary();
         for each(var _loc2_ in BORDER_PIECES)
         {
            var_2716[_loc2_] = _windowManager.assets.getAssetByName(var_3454 + "_border_" + _loc2_);
         }
         refresh();
      }
      
      public function get contentChild() : String
      {
         return var_2590;
      }
      
      public function set contentChild(param1:String) : void
      {
         var_2590 = param1 != null ? param1 : "";
         refresh();
      }
      
      public function get contentPadding() : uint
      {
         return var_2445;
      }
      
      public function set contentPadding(param1:uint) : void
      {
         var_2445 = param1;
         refresh();
      }
      
      public function get sidePadding() : uint
      {
         return var_2464;
      }
      
      public function set sidePadding(param1:uint) : void
      {
         var_2464 = param1;
         refresh();
      }
      
      public function get childMargin() : uint
      {
         return _childMargin;
      }
      
      public function set childMargin(param1:uint) : void
      {
         _childMargin = param1;
         refresh();
      }
      
      public function get topLeftChild() : String
      {
         return var_2584;
      }
      
      public function set topLeftChild(param1:String) : void
      {
         var_2584 = param1 != null ? param1 : "";
         refresh();
      }
      
      public function get topCenterChild() : String
      {
         return var_2516;
      }
      
      public function set topCenterChild(param1:String) : void
      {
         var_2516 = param1 != null ? param1 : "";
         refresh();
      }
      
      public function get topRightChild() : String
      {
         return var_2499;
      }
      
      public function set topRightChild(param1:String) : void
      {
         var_2499 = param1 != null ? param1 : "";
         refresh();
      }
      
      public function get bottomLeftChild() : String
      {
         return var_2490;
      }
      
      public function set bottomLeftChild(param1:String) : void
      {
         var_2490 = param1 != null ? param1 : "";
         refresh();
      }
      
      public function get bottomCenterChild() : String
      {
         return var_2514;
      }
      
      public function set bottomCenterChild(param1:String) : void
      {
         var_2514 = param1 != null ? param1 : "";
         refresh();
      }
      
      public function get bottomRightChild() : String
      {
         return var_2442;
      }
      
      public function set bottomRightChild(param1:String) : void
      {
         var_2442 = param1 != null ? param1 : "";
         refresh();
      }
      
      public function get landingViewMode() : Boolean
      {
         return var_2475;
      }
      
      public function set landingViewMode(param1:Boolean) : void
      {
         var_2475 = param1;
         refresh();
      }
      
      private function getPiece(param1:String) : BitmapDataAsset
      {
         return var_2716[param1];
      }
      
      private function getChildHeight(param1:String) : int
      {
         var _loc2_:class_3127 = _children.getChildByName(param1);
         return param1 != null && param1.length > 0 && _loc2_ != null ? _loc2_.height : 0;
      }
      
      private function get topPadding() : int
      {
         return Math.max(getChildHeight(var_2516),Math.max(getChildHeight(var_2584),getChildHeight(var_2499))) / 2;
      }
      
      private function get bottomPadding() : int
      {
         return Math.max(getChildHeight(var_2514),Math.max(getChildHeight(var_2490),getChildHeight(var_2442))) / 2;
      }
      
      private function refresh() : void
      {
         var _loc3_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:BitmapDataAsset = null;
         var _loc6_:BitmapData = null;
         var _loc13_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc1_:int = 0;
         var _loc8_:int = 0;
         if(var_3243 || var_1875 || disposed)
         {
            return;
         }
         var_464.limits.setEmpty();
         var_464.width = var_1547.width;
         var_464.height = var_1547.height;
         var _loc2_:class_3127 = _children.getChildByName(var_2590);
         if(_loc2_ != null)
         {
            _loc3_ = Math.max(1,_loc2_.width + 2 * var_2445);
            _loc9_ = Math.max(1,_loc2_.height + 2 * var_2445 + topPadding + bottomPadding);
            var_1875 = true;
            if(var_1547.testParamFlag(131072))
            {
               var_464.limits.minWidth = _loc3_;
               var_464.limits.minHeight = _loc9_;
            }
            if(var_1547.testParamFlag(147456))
            {
               var_464.limits.minWidth = _loc3_;
               var_464.limits.minHeight = _loc9_;
               var_464.limits.maxWidth = _loc3_;
               var_464.limits.maxHeight = _loc9_;
            }
            var_1875 = false;
         }
         if(var_1651 == null)
         {
            var_1492.width = var_464.width;
            var_1492.height = var_464.height;
            _children.width = var_464.width;
            _children.height = var_464.height;
            if(var_1651 != null)
            {
               var_1651.dispose();
            }
            var_1651 = new BitmapData(var_1492.width,var_1492.height,true,0);
            var_1492.bitmap = var_1651;
         }
         var _loc12_:Rectangle = var_1492.rectangle;
         _loc12_.y = _loc12_.y + topPadding;
         _loc12_.height -= topPadding + bottomPadding;
         var_1651.lock();
         var_1651.fillRect(new Rectangle(0,0,var_1492.width,var_1492.height),0);
         for(var _loc5_ in var_2716)
         {
            if(!((_loc10_ = getPiece(_loc5_)) == null || var_2475 && (_loc5_ == "top_left" || _loc5_ == "center_left" || _loc5_ == "bottom_left")))
            {
               _loc6_ = _loc10_.content as BitmapData;
               _loc13_ = _loc10_.rectangle;
               _loc4_ = new Rectangle(_loc12_.x,_loc12_.y,_loc13_.width,_loc13_.height);
               switch(_loc5_)
               {
                  case "top_left":
                     break;
                  case "top_center":
                     _loc4_.x += getPiece("top_left").rectangle.width;
                     _loc4_.width = _loc12_.width - getPiece("top_left").rectangle.width - getPiece("top_right").rectangle.width;
                     break;
                  case "top_right":
                     _loc4_.x += _loc12_.width - _loc13_.width;
                     break;
                  case "center_right":
                     _loc4_.x += _loc12_.width - _loc13_.width;
                     _loc4_.y += getPiece("top_right").rectangle.height;
                     _loc4_.height = _loc12_.height - getPiece("top_right").rectangle.height - getPiece("bottom_right").rectangle.height;
                     break;
                  case "bottom_right":
                     _loc4_.x += _loc12_.width - _loc13_.width;
                     _loc4_.y += _loc12_.height - _loc13_.height;
                     break;
                  case "bottom_center":
                     _loc4_.x += getPiece("bottom_left").rectangle.width;
                     _loc4_.y += _loc12_.height - _loc13_.height;
                     _loc4_.width = _loc12_.width - getPiece("bottom_left").rectangle.width - getPiece("bottom_right").rectangle.width;
                     if(var_2475)
                     {
                        _loc1_ = _loc4_.width / 2;
                        _loc4_.x += _loc1_;
                        _loc4_.width -= _loc1_;
                        break;
                     }
                     break;
                  case "bottom_left":
                     _loc4_.y += _loc12_.height - _loc13_.height;
                     break;
                  case "center_left":
                     _loc4_.y += getPiece("top_left").rectangle.height;
                     _loc4_.height = _loc12_.height - getPiece("top_left").rectangle.height - getPiece("bottom_left").rectangle.height;
                     break;
                  default:
                     continue;
               }
               MATRIX.a = _loc4_.width / _loc13_.width;
               MATRIX.d = _loc4_.height / _loc13_.height;
               MATRIX.tx = _loc4_.x - _loc13_.x * 0;
               MATRIX.ty = _loc4_.y - _loc13_.y * 0;
               var_1651.draw(_loc6_,MATRIX,null,null,_loc4_,false);
            }
         }
         var _loc11_:Array = [var_2584,var_2516,var_2499,var_2490,var_2514,var_2442];
         for each(var _loc7_ in _children.iterator)
         {
            if(_loc7_.name != null && _loc7_.name.length > 0)
            {
               if((_loc8_ = _loc11_.indexOf(_loc7_.name)) < 0)
               {
                  if(_loc7_.name == var_2590)
                  {
                     _loc7_.x = _loc12_.x + contentPadding;
                     _loc7_.y = _loc12_.y + contentPadding;
                     _loc7_.visible = true;
                  }
                  else
                  {
                     _loc7_.visible = false;
                  }
               }
               else
               {
                  switch(_loc8_ % 3)
                  {
                     case 0:
                        _loc7_.x = Math.min(var_2464,0 - _loc7_.width);
                        break;
                     case 1:
                        _loc7_.x = Math.max(0 - _loc7_.width,0) / 2;
                        break;
                     case 2:
                        _loc7_.x = Math.max(0 - _loc7_.width - var_2464,0);
                  }
                  if(_loc8_ < 3)
                  {
                     _loc7_.y = topPadding - _loc7_.height / 2;
                  }
                  else
                  {
                     _loc7_.y = 0 - (bottomPadding + _loc7_.height / 2);
                  }
                  _loc7_.visible = true;
                  var_1651.fillRect(new Rectangle(_loc7_.x - _childMargin,_loc7_.y,_loc7_.width + _childMargin * 2,_loc7_.height),0);
               }
            }
            else
            {
               _loc7_.visible = false;
            }
         }
         var_1651.unlock();
         var_1492.invalidate();
      }
   }
}
