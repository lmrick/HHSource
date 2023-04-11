package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.habbo.friendbar.landingview.*;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISlotAwareWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.class_3517;
   import com.sulake.habbo.friendbar.landingview.interfaces.class_3518;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.class_3524;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.class_3526;
   import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
   import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
   import com.sulake.habbo.friendbar.landingview.widget.elements.TitleElementHandler;
   import com.sulake.habbo.friendbar.landingview.widget.elements.class_3525;
   
   public class GenericWidget implements ILandingViewWidget, ISlotAwareWidget, ISettingsAwareWidget, class_3517, class_3518
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var var_3146:int;
      
      private var var_3250:String;
      
      private var var_2356:class_24;
      
      public function GenericWidget(param1:HabboLandingView)
      {
         super();
         _landingView = param1;
         var_2356 = new class_24();
      }
      
      public static function configureLayout(param1:HabboLandingView, param2:int, param3:String, param4:class_3151) : void
      {
         var _loc9_:Array = null;
         var _loc12_:String = null;
         var _loc11_:String = null;
         var _loc5_:String;
         var _loc10_:Array = (_loc5_ = getConf(param1,param2,param3,"layout")).split(";");
         var _loc8_:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(param4.findChildByName("bitmap"));
         var _loc6_:class_3127;
         (_loc6_ = param4.findChildByName("content_container")).x = isWideSlot(param2) ? 230 : 0;
         param4.width = isWideSlot(param2) ? param1.dynamicLayoutLeftPaneWidth : param1.dynamicLayoutRightPaneWidth;
         for each(var _loc7_ in _loc10_)
         {
            _loc12_ = String((_loc9_ = _loc7_.split(","))[0]);
            _loc11_ = String(_loc9_[1]);
            switch(_loc12_)
            {
               case "bitmap.uri":
                  _loc8_.assetUri = _loc11_;
                  break;
               case "bitmap.width":
                  _loc8_.width = parseInt(_loc11_);
                  break;
               case "bitmap.height":
                  _loc8_.height = parseInt(_loc11_);
                  break;
               case "bitmap.x":
                  _loc8_.x = parseInt(_loc11_);
                  break;
               case "bitmap.y":
                  _loc8_.y = parseInt(_loc11_);
                  break;
               case "content.x":
                  _loc6_.x = parseInt(_loc11_);
                  break;
               case "content.y":
                  _loc6_.y = parseInt(_loc11_);
                  break;
               case "content.width":
                  _loc6_.width = parseInt(_loc11_);
                  break;
               case "container.height":
                  param4.height = Math.max(parseInt(_loc11_),param4.height);
                  break;
            }
         }
      }
      
      private static function getConf(param1:HabboLandingView, param2:int, param3:String, param4:String) : String
      {
         var _loc5_:String = param3 != null ? "landing.view." + param3 + "." + param4 : "landing.view.dynamic.slot." + param2 + "." + param4;
         return param1.getProperty(_loc5_);
      }
      
      private static function isWideSlot(param1:int) : Boolean
      {
         return param1 != 3 && param1 != 5;
      }
      
      public function set slot(param1:int) : void
      {
         var_3146 = param1;
      }
      
      public function get configurationCode() : String
      {
         return var_3250;
      }
      
      public function set configurationCode(param1:String) : void
      {
         var_3250 = param1;
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function dispose() : void
      {
         _landingView = null;
         _container = null;
         for each(var _loc1_ in var_2356)
         {
            if(_loc1_ is class_13)
            {
               class_13(_loc1_).dispose();
            }
         }
         var_2356 = null;
      }
      
      public function initialize() : void
      {
         _container = class_3151(_landingView.getXmlWindow("generic_widget"));
         configureContentColumn();
         configureLayout(_landingView,var_3146,var_3250,_container);
      }
      
      public function getElementByName(param1:String) : IElementHandler
      {
         return var_2356.getValue(param1) as IElementHandler;
      }
      
      private function configureContentColumn() : void
      {
         var _loc6_:Array = null;
         var _loc8_:String = null;
         var _loc1_:IElementHandler = null;
         var _loc9_:String = null;
         var _loc5_:class_3127 = null;
         var _loc2_:String = getConf(_landingView,var_3146,var_3250,"conf");
         var _loc7_:Array = _loc2_.split(";");
         if(_loc2_ == null || _loc2_ == "")
         {
            return;
         }
         var _loc4_:IItemListWindow = IItemListWindow(_container.findChildByName("content_container"));
         for each(var _loc3_ in _loc7_)
         {
            _loc8_ = String((_loc6_ = _loc3_.split(","))[0]);
            _loc1_ = class_3525.createHandler(_loc8_);
            _loc9_ = String(_loc1_ is ILayoutNameProvider ? ILayoutNameProvider(_loc1_).layoutName : "element_" + _loc8_);
            try
            {
               _loc5_ = _landingView.getXmlWindow(_loc9_);
            }
            catch(e:Error)
            {
               return;
            }
            if(_loc5_ == null)
            {
               return;
            }
            if(_loc1_ != null)
            {
               _loc1_.initialize(_landingView,_loc5_,_loc6_,this);
               var_2356.add(_loc8_,_loc1_);
            }
            if(_loc1_ is class_3526 && Boolean(class_3526(_loc1_).isFloating(isWideSlot(var_3146))))
            {
               if(_loc1_ is TitleElementHandler)
               {
                  _loc5_.width = isWideSlot(var_3146) ? _landingView.dynamicLayoutLeftPaneWidth : _landingView.dynamicLayoutRightPaneWidth;
               }
               _container.addChild(_loc5_);
            }
            else
            {
               _loc4_.addListItem(_loc5_);
            }
         }
      }
      
      public function refresh() : void
      {
         for each(var _loc1_ in var_2356)
         {
            _loc1_.refresh();
         }
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      public function set settings(param1:CommonWidgetSettings) : void
      {
         WidgetContainerLayout.applyCommonWidgetSettings(_container,param1);
      }
      
      public function disable() : void
      {
         for each(var _loc1_ in var_2356)
         {
            if(_loc1_ is class_3524)
            {
               class_3524(_loc1_).disable();
            }
         }
      }
   }
}
