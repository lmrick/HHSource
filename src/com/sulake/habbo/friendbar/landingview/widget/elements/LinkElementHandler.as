package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   import com.sulake.habbo.utils.HabboWebTools;
   
   public class LinkElementHandler implements IElementHandler, class_13
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var var_90:String;
      
      public function LinkElementHandler()
      {
         super();
      }
      
      public function dispose() : void
      {
         _landingView = null;
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         _landingView = param1;
         var _loc5_:String = String(param3[1]);
         var_90 = param3[2];
         param2.procedure = onLink;
         class_3151(param2).findChildByName("link_txt").caption = "${" + _loc5_ + "}";
      }
      
      private function onLink(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _landingView.windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,null);
            HabboWebTools.openWebPage(var_90);
            _landingView.tracking.trackGoogle("landingView","click_link");
         }
      }
      
      public function refresh() : void
      {
      }
   }
}
