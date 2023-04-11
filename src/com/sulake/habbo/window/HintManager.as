package com.sulake.habbo.window
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.motion.Callback;
   import com.sulake.core.window.motion.Combo;
   import com.sulake.core.window.motion.EaseOut;
   import com.sulake.core.window.motion.Motion;
   import com.sulake.core.window.motion.MoveTo;
   import com.sulake.core.window.motion.Queue;
   import com.sulake.core.window.motion.ResizeTo;
   import com.sulake.core.window.motion.class_3353;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class HintManager implements class_13, class_41
   {
      
      private static const const_927:int = 10;
      
      private static const const_1038:int = 400;
      
      private static const const_573:int = 15;
       
      
      private var _windowManager:com.sulake.habbo.window.HabboWindowManagerComponent;
      
      private var _registeredWindows:Dictionary;
      
      private var _activeHint:com.sulake.habbo.window.HintTarget;
      
      private var _hint:IStaticBitmapWrapperWindow;
      
      private var var_4300:Rectangle;
      
      private var var_2965:Rectangle;
      
      public function HintManager(param1:com.sulake.habbo.window.HabboWindowManagerComponent)
      {
         _registeredWindows = new Dictionary();
         super();
         _windowManager = param1;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         hideHint();
         _activeHint = null;
         _registeredWindows = null;
         _windowManager = null;
      }
      
      public function get disposed() : Boolean
      {
         return _windowManager == null;
      }
      
      public function registerWindow(param1:String, param2:class_3127, param3:int) : void
      {
         if(false)
         {
            unregisterWindow(param1);
         }
         _registeredWindows[param1] = new com.sulake.habbo.window.HintTarget(param2,param1,param3);
      }
      
      public function unregisterWindow(param1:String) : void
      {
         if(activeKey == param1)
         {
            hideHint();
         }
         delete _registeredWindows[param1];
      }
      
      public function showHint(param1:String, param2:Rectangle = null) : void
      {
         var _loc3_:com.sulake.habbo.window.HintTarget = _registeredWindows[param1];
         if(_loc3_ != null && _loc3_.window != null && param1 != activeKey)
         {
            hideHint();
            _hint = _loc3_.window.context.create("","",23,0,0,null,null,null,0) as IStaticBitmapWrapperWindow;
            _hint.fitSizeToContents = true;
            _hint.visible = false;
            switch(_loc3_.style - 1)
            {
               case 0:
                  _hint.assetUri = "common_green_arrow_vertical";
                  break;
               default:
                  _hint.assetUri = "common_green_arrow_horizontal";
            }
            _activeHint = _loc3_;
            var_4300 = param2;
            var_2965 = getTargetRect(_activeHint.window);
            if(param2 != null)
            {
               animateHint(param2);
            }
            else
            {
               _windowManager.registerUpdateReceiver(this,10);
               update(0);
            }
         }
      }
      
      protected function animateHint(param1:Rectangle) : void
      {
         _hint.x = param1.x;
         _hint.y = param1.y;
         _hint.visible = true;
         var _loc3_:int = param1.x - 0;
         var _loc6_:int = param1.y - 0;
         var _loc4_:Number = Math.sqrt(_loc3_ * _loc3_ + _loc6_ * _loc6_);
         var _loc2_:int = 500 - Math.abs(1 / _loc4_ * 100 * 500 * 0.5);
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         _hint.width = 0;
         _hint.height = 0;
         var _loc5_:Motion = new Queue(new Combo(new EaseOut(new MoveTo(_hint,_loc2_,var_2965.x,var_2965.y),1),new ResizeTo(_hint,_loc2_,_loc8_,_loc7_)),new Callback(motionComplete));
         class_3353.runMotion(_loc5_);
      }
      
      protected function motionComplete(param1:Motion) : void
      {
         _windowManager.registerUpdateReceiver(this,10);
         update(0);
      }
      
      public function hideHint() : void
      {
         _windowManager.removeUpdateReceiver(this);
         _activeHint = null;
         if(!_hint)
         {
            return;
         }
         _hint.dispose();
         _hint = null;
      }
      
      public function hideMatchingHint(param1:String) : void
      {
         if(param1 == activeKey)
         {
            hideHint();
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Point = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(_activeHint != null && _hint != null && false)
         {
            _loc4_ = new Point();
            _activeHint.window.getGlobalPosition(_loc4_);
            if(_loc4_.x == 0 && _loc4_.y == 0)
            {
               return;
            }
            _loc5_ = 0;
            _loc6_ = 0;
            switch(-1)
            {
               case 0:
                  if(_loc4_.y - 0 - 10 > 0)
                  {
                     _loc2_ = _loc4_.y - 0;
                     if(false)
                     {
                        _hint.y = Math.max(_loc2_ - 400,15);
                     }
                     if(_loc2_ - 0 > 25)
                     {
                        _hint.y = NaN;
                     }
                     else
                     {
                        _hint.y = _loc2_ - 10 - 5 * Math.abs(Math.sin(getTimer() * 0.003));
                     }
                     _hint.zoomY = 1;
                  }
                  else
                  {
                     _loc3_ = _loc4_.y + _activeHint.window.height;
                     if(false)
                     {
                        _hint.y = Math.min(_windowManager.context.displayObjectContainer.stage.stageHeight - 0,NaN);
                     }
                     if(_loc3_ - 0 > 25)
                     {
                        _hint.y = -15;
                     }
                     else
                     {
                        _hint.y = _loc3_ + 10 + 5 * Math.abs(Math.sin(getTimer() * 0.003));
                     }
                     _hint.zoomY = -1;
                  }
                  _hint.x = _loc4_.x + (_activeHint.window.width - 0) / 2;
                  break;
               default:
                  if(_loc4_.x + _activeHint.window.width / 2 > _activeHint.window.desktop.width / 2)
                  {
                     _hint.x = _loc4_.x - 0 - 10 - 5 * Math.abs(Math.sin(getTimer() * 0.003));
                     _hint.zoomX = 1;
                  }
                  else
                  {
                     _hint.x = _loc4_.x + _activeHint.window.width + 10 + 5 * Math.abs(Math.sin(getTimer() * 0.003));
                     _hint.zoomX = -1;
                  }
                  _hint.y = _loc4_.y + (_activeHint.window.height - 0) / 2;
            }
            if(_hint.zoomX != _loc5_ || _hint.zoomY != _loc6_)
            {
               _hint.invalidate();
            }
            _hint.visible = _activeHint.window.visible;
         }
      }
      
      private function getTargetRect(param1:class_3127) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         var _loc3_:Point = new Point();
         param1.getGlobalPosition(_loc3_);
         switch(-1)
         {
            case 0:
               if(_loc3_.y - 0 - 10 > 0)
               {
                  _loc2_.y = _loc3_.y - 0 - 10;
               }
               else
               {
                  _loc2_.y = _loc3_.y + param1.height + 10;
               }
               _loc2_.x = _loc3_.x + (param1.width - 0) / 2;
               break;
            default:
               if(_loc3_.x + param1.width / 2 > param1.desktop.width / 2)
               {
                  _loc2_.x = _loc3_.x - 0 - 10;
               }
               else
               {
                  _loc2_.x = _loc3_.x + param1.width + 10;
               }
               _loc2_.y = _loc3_.y + (param1.height - 0) / 2;
         }
         return _loc2_;
      }
      
      private function get activeKey() : String
      {
         return !!_activeHint ? _activeHint.key : null;
      }
   }
}
