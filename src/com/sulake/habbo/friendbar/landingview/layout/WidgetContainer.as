package com.sulake.habbo.friendbar.landingview.layout
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.IResizeAwareWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.class_3518;
   
   public class WidgetContainer implements class_13
   {
       
      
      private var var_1429:ILandingViewWidget;
      
      private var _placeholderName:String;
      
      private var var_3556:class_3151;
      
      private var var_66:Boolean;
      
      private var var_2272:com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
      
      public function WidgetContainer(param1:ILandingViewWidget, param2:String, param3:com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings, param4:class_3151 = null)
      {
         super();
         var_1429 = param1;
         _placeholderName = param2;
         var_2272 = param3;
         var_3556 = param4;
      }
      
      public function dispose() : void
      {
         if(var_1429)
         {
            var_1429.dispose();
            var_1429 = null;
         }
         if(var_2272)
         {
            var_2272 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_1429 == null && var_2272 == null;
      }
      
      public function refresh(param1:class_3151) : void
      {
         var _loc3_:class_3127 = null;
         var _loc2_:class_3151 = class_3151(param1.findChildByName("content_background"));
         if(!var_66)
         {
            var_66 = true;
            if(_placeholderName != null)
            {
               _loc3_ = _loc2_.getChildByName(_placeholderName);
               if(_loc3_ == null)
               {
                  return;
               }
               var_1429.initialize();
               _loc2_.addChildAt(var_1429.container,_loc2_.getChildIndex(_loc3_));
               var_1429.container.x = _loc3_.x;
               var_1429.container.y = _loc3_.y;
               _loc2_.removeChild(_loc3_);
               _loc3_.dispose();
            }
            else
            {
               if(!(var_3556 != null && var_1429 != null))
               {
                  return;
               }
               var_1429.initialize();
               var_3556.addChild(var_1429.container);
            }
         }
         if(false)
         {
            if(var_1429 is ISettingsAwareWidget && var_2272 != null)
            {
               ISettingsAwareWidget(var_1429).settings = var_2272;
            }
            var_1429.refresh();
         }
      }
      
      public function get container() : class_3127
      {
         return var_1429.container;
      }
      
      public function windowResized() : void
      {
         if(var_1429 != null && false && var_1429 is IResizeAwareWidget)
         {
            IResizeAwareWidget(var_1429).windowResized();
         }
      }
      
      public function disable() : void
      {
         if(var_1429 != null && false && var_1429 is class_3518)
         {
            class_3518(var_1429).disable();
         }
      }
   }
}
