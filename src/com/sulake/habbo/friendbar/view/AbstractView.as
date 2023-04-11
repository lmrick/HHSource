package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   
   public class AbstractView extends class_20
   {
       
      
      protected var _windowManager:class_1684;
      
      protected var _avatarManager:class_1690;
      
      protected var _localizationManager:class_18;
      
      protected var _sessionDataManager:ISessionDataManager;
      
      protected var _tracking:class_1693;
      
      public function AbstractView(param1:class_31, param2:uint, param3:class_21)
      {
         super(param1,param2,param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDAvatarRenderManager(),function(param1:class_1690):void
         {
            _avatarManager = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localizationManager = param1;
         }),new ComponentDependency(new IIDHabboTracking(),function(param1:class_1693):void
         {
            _tracking = param1;
         })]);
      }
   }
}
