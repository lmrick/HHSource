package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import flash.geom.Point;
   
   public class ProgressBar implements class_13
   {
      
      private static const PROGRESS_TEXT_X_OFFSET:int = 3;
      
      private static const CONTAINER_SPACING:int = 10;
       
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var _window:class_3151;
      
      private var _progressBarWidth:int;
      
      private var _progressKey:String;
      
      private var _hasFrame:Boolean;
      
      private var _currentAmount:int;
      
      private var _maxAmount:int;
      
      private var var_443:int;
      
      private var var_4151:int;
      
      private var _startProgressWidth:int;
      
      private var _currentProgressWidth:int;
      
      private var var_2952:Boolean;
      
      public function ProgressBar(param1:com.sulake.habbo.quest.HabboQuestEngine, param2:class_3151, param3:int, param4:String, param5:Boolean, param6:Point)
      {
         super();
         _questEngine = param1;
         _window = param2;
         _progressBarWidth = param3;
         _progressKey = param4;
         _hasFrame = param5;
         var _loc7_:class_3151;
         if((_loc7_ = class_3151(_window.findChildByName("progress_bar_cont"))) == null)
         {
            _loc7_ = class_3151(_questEngine.getXmlWindow("ProgressBar"));
            _window.addChild(_loc7_);
            _loc7_.x = param6.x;
            _loc7_.y = param6.y;
            _loc7_.width = _progressBarWidth + 10;
         }
      }
      
      public function refresh(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Boolean = param3 != var_4151 || param2 != _maxAmount;
         _maxAmount = param2;
         _currentAmount = param1;
         _startProgressWidth = _currentProgressWidth;
         var_4151 = param3;
         var_443 = param4;
         if(_loc5_ || _currentAmount == 0 && _currentProgressWidth > 0)
         {
            _currentProgressWidth = getProgressWidth(_currentAmount);
         }
         var_2952 = true;
         updateView();
      }
      
      public function set visible(param1:Boolean) : void
      {
         var _loc2_:class_3151 = class_3151(_window.findChildByName("progress_bar_cont"));
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      public function updateView() : void
      {
         var _loc10_:int = 0;
         if(!var_2952)
         {
            return;
         }
         var _loc5_:class_3127 = _window.findChildByName("bar_a_bkg");
         var _loc8_:class_3127 = _window.findChildByName("bar_a_c");
         var _loc7_:class_3127 = _window.findChildByName("bar_a_r");
         var _loc9_:class_3127 = _window.findChildByName("bar_l");
         var _loc3_:class_3127 = _window.findChildByName("bar_c");
         var _loc6_:class_3127 = _window.findChildByName("bar_r");
         _loc9_.visible = _hasFrame;
         _loc3_.visible = _hasFrame;
         _loc6_.visible = _hasFrame;
         if(_hasFrame)
         {
            _loc3_.width = _progressBarWidth;
            _loc6_.x = _progressBarWidth + _loc8_.x;
         }
         var _loc1_:int = getProgressWidth(_currentAmount);
         if(_currentProgressWidth < _loc1_)
         {
            _loc10_ = Math.min(Math.abs(_currentProgressWidth - _loc1_),Math.abs(_startProgressWidth - _loc1_));
            _currentProgressWidth = Math.min(_loc1_,_currentProgressWidth + Math.max(1,Math.round(Math.sqrt(_loc10_))));
         }
         var _loc11_:* = _currentProgressWidth > 0;
         _loc5_.visible = _loc11_;
         _loc8_.visible = _loc11_;
         _loc7_.visible = _loc11_;
         if(_loc11_)
         {
            _loc8_.blend = 1 - (_loc1_ - _currentProgressWidth) / (_loc1_ - _startProgressWidth);
            _loc8_.width = _currentProgressWidth;
            _loc7_.x = _currentProgressWidth + _loc8_.x;
            _loc5_.width = _loc7_.right - _loc8_.left;
         }
         var_2952 = _currentProgressWidth < _loc1_;
         var _loc4_:class_3127 = _window.findChildByName("progress_txt");
         var _loc2_:int = int(var_2952 ? Math.round(_currentProgressWidth / _progressBarWidth * _maxAmount) : _currentAmount);
         _questEngine.localization.registerParameter(_progressKey,"progress","" + (_loc2_ + var_443));
         _questEngine.localization.registerParameter(_progressKey,"limit","" + (_maxAmount + var_443));
         _loc4_.caption = _questEngine.localization.getLocalization(_progressKey,_progressKey);
         _loc4_.x = 3 + _loc8_.x + (_progressBarWidth - _loc4_.width) / 2;
      }
      
      public function dispose() : void
      {
         _questEngine = null;
         _window = null;
      }
      
      public function get disposed() : Boolean
      {
         return _questEngine == null;
      }
      
      private function getProgressWidth(param1:int) : int
      {
         return Math.max(0,Math.round(_progressBarWidth * param1 / _maxAmount));
      }
   }
}
