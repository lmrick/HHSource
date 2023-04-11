package com.sulake.habbo.avatar.common
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   
   public class CategoryBaseView
   {
       
      
      protected var _window:class_3151;
      
      protected var var_1508:String = "";
      
      protected var _currentTabName:String = "";
      
      protected var var_1443:com.sulake.habbo.avatar.common.class_3319;
      
      protected var var_1420:Boolean;
      
      public function CategoryBaseView(param1:com.sulake.habbo.avatar.common.class_3319)
      {
         super();
         var_1443 = param1;
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_1443 = null;
         var_1420 = false;
      }
      
      public function init() : void
      {
      }
      
      public function reset() : void
      {
         var_1508 = "";
         _currentTabName = "";
         var_1420 = false;
      }
      
      public function getWindowContainer() : class_3151
      {
         if(!var_1420)
         {
            init();
         }
         return _window;
      }
      
      public function showPalettes(param1:String, param2:int) : void
      {
         var_1443.controller.view.gridView.showPalettes(param2);
      }
      
      protected function updateGridView(param1:String) : void
      {
         var_1443.controller.view.gridView.initFromList(var_1443,param1);
      }
      
      protected function activateTab(param1:String) : void
      {
         var _loc2_:IStaticBitmapWrapperWindow = null;
         if(!_window)
         {
            return;
         }
         var _loc3_:class_3151 = _window.findChildByName(param1) as class_3151;
         if(_loc3_)
         {
            _loc2_ = _loc3_.findChildByTag("BITMAP") as IStaticBitmapWrapperWindow;
            TabUtils.setElementImage(_loc2_,true);
         }
      }
      
      protected function inactivateTab(param1:String) : void
      {
         var _loc2_:IStaticBitmapWrapperWindow = null;
         if(!_window)
         {
            return;
         }
         var _loc3_:class_3151 = _window.findChildByName(param1) as class_3151;
         if(_loc3_)
         {
            _loc2_ = _loc3_.findChildByTag("BITMAP") as IStaticBitmapWrapperWindow;
            TabUtils.setElementImage(_loc2_,false);
         }
      }
   }
}
