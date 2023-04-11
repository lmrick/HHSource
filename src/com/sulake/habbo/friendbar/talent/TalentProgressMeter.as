package com.sulake.habbo.friendbar.talent
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.habbo.utils.class_403;
   import com.sulake.habbo.window.widgets.class_3308;
   import package_149.class_1606;
   
   public class TalentProgressMeter implements class_13
   {
       
      
      private const ACHIEVED_DIVIDER:String = "talent_achieved_div";
      
      private const UNACHIEVED_DIVIDER:String = "talent_unachieved_div";
      
      private const DIVIDER_WINDOW_PREFIX:String = "progress_divider_level_";
      
      private const AVATAR_GLOW_RADIUS:int = 10;
      
      private var _disposed:Boolean = false;
      
      private var _habboTalent:com.sulake.habbo.friendbar.talent.HabboTalent;
      
      private var var_282:com.sulake.habbo.friendbar.talent.TalentTrackController;
      
      private var _talentTrack:class_1606;
      
      private var var_1681:class_3151;
      
      private var _divider:IStaticBitmapWrapperWindow;
      
      private var var_1769:class_3217;
      
      private var var_3189:IStaticBitmapWrapperWindow;
      
      private var var_3294:IStaticBitmapWrapperWindow;
      
      public function TalentProgressMeter(param1:com.sulake.habbo.friendbar.talent.HabboTalent, param2:com.sulake.habbo.friendbar.talent.TalentTrackController)
      {
         super();
         _habboTalent = param1;
         var_282 = param2;
         _talentTrack = var_282.talentTrack;
         createMeter();
      }
      
      public function get width() : int
      {
         return var_282.window.width;
      }
      
      public function get progressPerLevelWidth() : int
      {
         return int(Math.floor(class_403.lerp(_talentTrack.progressPerLevel,0,width)));
      }
      
      private function createMeter() : void
      {
         var _loc2_:int = 0;
         var _loc1_:IStaticBitmapWrapperWindow = null;
         var_1681 = class_3151(var_282.window.findChildByName("progress_container"));
         _divider = IStaticBitmapWrapperWindow(var_1681.removeChild(var_1681.findChildByName("progress_level_divider")));
         var_3189 = IStaticBitmapWrapperWindow(var_1681.findChildByName("achieved_mid"));
         var_3294 = IStaticBitmapWrapperWindow(var_1681.findChildByName("unachieved_mid"));
         _loc2_ = 1;
         while(_loc2_ < _talentTrack.levels.length)
         {
            _loc1_ = IStaticBitmapWrapperWindow(_divider.clone());
            _loc1_.name = "progress_divider_level_" + _loc2_;
            var_1681.addChild(_loc1_);
            _loc2_++;
         }
         var_1769 = class_3217(var_1681.findChildByName("progress_needle"));
         class_3308(var_1769.widget).figure = _habboTalent.sessionManager.figure;
         var_1681.setChildIndex(var_1769,-1);
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_divider)
            {
               _divider.dispose();
               _divider = null;
            }
            var_3189 = null;
            var_3294 = null;
            var_1769 = null;
            var_1681 = null;
            _talentTrack = null;
            var_282 = null;
            _habboTalent = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function resize() : void
      {
         var _loc5_:int = 0;
         var _loc4_:IStaticBitmapWrapperWindow = null;
         var _loc1_:int = Math.floor(class_403.lerp(_talentTrack.totalProgress,0,width));
         var_1681.width = width;
         var_3294.width = width;
         var_3189.width = _loc1_;
         var_1769.x = class_403.clamp(_loc1_ - 0,0,width - 0);
         var _loc2_:class_3127 = var_1681.findChildByName("avatar_glow");
         _loc2_.x = -10;
         _loc2_.y = -10;
         _loc2_.width = NaN;
         _loc2_.height = NaN;
         var _loc3_:class_3127 = var_1681.findChildByName("progress_balloon");
         _loc3_.x = var_1769.x + Math.floor(0) - Math.floor(_loc3_.width / 2) + 5;
         _loc5_ = 1;
         while(_loc5_ < _talentTrack.levels.length)
         {
            (_loc4_ = IStaticBitmapWrapperWindow(var_1681.findChildByName("progress_divider_level_" + _loc5_))).x = _loc5_ * progressPerLevelWidth;
            if(_loc4_.x < _loc1_)
            {
               _loc4_.assetUri = "talent_achieved_div";
            }
            else
            {
               _loc4_.assetUri = "talent_unachieved_div";
            }
            _loc4_.visible = true;
            _loc5_++;
         }
         var_1681.invalidate();
      }
   }
}
