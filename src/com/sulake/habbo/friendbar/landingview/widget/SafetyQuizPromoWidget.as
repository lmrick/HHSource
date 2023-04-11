package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.window.widgets.class_3308;
   
   public class SafetyQuizPromoWidget implements ILandingViewWidget
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var _disposed:Boolean;
      
      public function SafetyQuizPromoWidget(param1:HabboLandingView)
      {
         super();
         _landingView = param1;
      }
      
      public function initialize() : void
      {
         _container = class_3151(_landingView.getXmlWindow("safety_quiz_promo"));
         _container.procedure = widgetProcedure;
         refresh();
      }
      
      private function widgetProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK" && param2.name == "safety_quiz_button")
         {
            _landingView.habboHelp.showSafetyBooklet();
         }
      }
      
      public function refresh() : void
      {
         if(_container != null && true)
         {
            class_3308(class_3217(_container.findChildByName("avatar")).widget).figure = _landingView.sessionDataManager.figure;
         }
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_container != null)
            {
               _container.dispose();
               _container = null;
            }
            _landingView = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
   }
}
