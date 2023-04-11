package com.sulake.habbo.friendbar.popup
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendbar.class_3166;
   import com.sulake.habbo.friendbar.view.AbstractView;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import package_83.class_523;
   
   public class HabboEpicPopupView extends AbstractView implements class_3166
   {
       
      
      private var _communicationManager:class_25;
      
      private var _activeFrame:class_3151;
      
      public function HabboEpicPopupView(param1:class_31, param2:uint, param3:class_21)
      {
         super(param1,param2,param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         })]);
      }
      
      override public function dispose() : void
      {
         if(_activeFrame != null)
         {
            _activeFrame.dispose();
            _activeFrame = null;
         }
         super.dispose();
      }
      
      override protected function initComponent() : void
      {
         _communicationManager.addHabboConnectionMessageEvent(new class_523(onEpicPopupMessageEvent));
      }
      
      private function onEpicPopupMessageEvent(param1:class_523) : void
      {
         showPopup(param1.getParser().imageUri);
      }
      
      public function showPopup(param1:String) : void
      {
         if(_activeFrame != null)
         {
            _activeFrame.dispose();
         }
         _activeFrame = _windowManager.buildFromXML(assets.getAssetByName("epic_popup_frame_xml").content as XML) as class_3151;
         IStaticBitmapWrapperWindow(_activeFrame.findChildByName("content_static_bitmap")).assetUri = param1;
         _activeFrame.procedure = windowProc;
         _activeFrame.center();
      }
      
      private function windowProc(param1:class_3134, param2:class_3127) : void
      {
         if(_activeFrame != null && param1.type == "WME_CLICK")
         {
            switch(param1.target.name)
            {
               case "close_button":
               case "header_button_close":
                  _activeFrame.dispose();
                  _activeFrame = null;
            }
         }
      }
   }
}
