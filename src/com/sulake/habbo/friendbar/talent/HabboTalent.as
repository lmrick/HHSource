package com.sulake.habbo.friendbar.talent
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.avatar.class_1753;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendbar.IHabboTalent;
   import com.sulake.habbo.friendbar.view.AbstractView;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.IModalDialog;
   import com.sulake.iid.IIDHabboAvatarEditor;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboToolbar;
   import package_149.class_1669;
   import package_80.class_956;
   
   public class HabboTalent extends AbstractView implements IHabboTalent, ILinkEventTracker
   {
       
      
      private var _talentTrack:com.sulake.habbo.friendbar.talent.TalentTrackController;
      
      private var _talentLevelUp:com.sulake.habbo.friendbar.talent.TalentLevelUpController;
      
      private var _talentPromo:com.sulake.habbo.friendbar.talent.TalentPromoCtrl;
      
      private var _citizenshipPopup:com.sulake.habbo.friendbar.talent.CitizenshipPopupController;
      
      private var _communicationManager:class_25;
      
      private var _habboHelp:IHabboHelp;
      
      private var _navigator:class_1685;
      
      private var _toolbar:IHabboToolbar;
      
      private var _avatarEditor:class_1753;
      
      public function HabboTalent(param1:class_31, param2:uint, param3:class_21)
      {
         super(param1,param2,param3);
      }
      
      public function get communicationManager() : class_25
      {
         return _communicationManager;
      }
      
      public function get localizationManager() : class_18
      {
         return _localizationManager;
      }
      
      public function get sessionManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get tracking() : class_1693
      {
         return _tracking;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return _habboHelp;
      }
      
      public function get navigator() : class_1685
      {
         return _navigator;
      }
      
      public function get habboTalentEnabled() : Boolean
      {
         return getBoolean("talent.track.enabled");
      }
      
      public function get citizenshipEnabled() : Boolean
      {
         return getBoolean("talent.track.citizenship.enabled");
      }
      
      public function get newUserTourEnabled() : Boolean
      {
         return getBoolean("guide.help.new.user.tour.enabled");
      }
      
      public function get newIdentity() : Boolean
      {
         return getInteger("new.identity",0) > 0;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function get avatarEditor() : class_1753
      {
         return _avatarEditor;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         }),new ComponentDependency(new IIDHabboHelp(),function(param1:IHabboHelp):void
         {
            _habboHelp = param1;
         }),new ComponentDependency(new IIDHabboNavigator(),function(param1:class_1685):void
         {
            _navigator = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         }),new ComponentDependency(new IIDHabboAvatarEditor(),function(param1:class_1753):void
         {
            _avatarEditor = param1;
         })]);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(_talentLevelUp)
            {
               _talentLevelUp.dispose();
               _talentLevelUp = null;
            }
            if(_talentTrack)
            {
               _talentTrack.dispose();
               _talentTrack = null;
            }
            if(_talentPromo)
            {
               _talentPromo.dispose();
               _talentPromo = null;
            }
            if(_citizenshipPopup != null)
            {
               _citizenshipPopup.dispose();
               _citizenshipPopup = null;
            }
            context.removeLinkEventTracker(this);
            super.dispose();
         }
      }
      
      override protected function initComponent() : void
      {
         if(!habboTalentEnabled)
         {
            return;
         }
         _talentTrack = new com.sulake.habbo.friendbar.talent.TalentTrackController(this);
         _talentLevelUp = new com.sulake.habbo.friendbar.talent.TalentLevelUpController(this);
         _talentPromo = new com.sulake.habbo.friendbar.talent.TalentPromoCtrl(this);
         if(citizenshipEnabled)
         {
            _citizenshipPopup = new com.sulake.habbo.friendbar.talent.CitizenshipPopupController(this);
         }
         context.addLinkEventTracker(this);
         _talentTrack.initialize();
         _talentLevelUp.initialize();
         _talentPromo.initialize();
      }
      
      public function send(param1:IMessageComposer) : void
      {
         if(_communicationManager)
         {
            _communicationManager.connection.send(param1);
         }
      }
      
      public function getXmlWindow(param1:String, param2:uint = 1) : class_3127
      {
         var _loc5_:IAsset = null;
         var _loc3_:XmlAsset = null;
         var _loc4_:class_3127 = null;
         try
         {
            _loc5_ = assets.getAssetByName(param1 + "_xml");
            _loc3_ = XmlAsset(_loc5_);
            _loc4_ = _windowManager.buildFromXML(XML(_loc3_.content),param2);
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("HabboTalent","Failed to build window " + param1 + "_xml, " + _loc5_ + ", " + _windowManager + "!");
            throw e;
         }
         return _loc4_;
      }
      
      public function getModalXmlWindow(param1:String) : IModalDialog
      {
         var _loc4_:IAsset = null;
         var _loc2_:XmlAsset = null;
         var _loc3_:IModalDialog = null;
         try
         {
            _loc4_ = assets.getAssetByName(param1 + "_xml");
            _loc2_ = XmlAsset(_loc4_);
            _loc3_ = _windowManager.buildModalDialogFromXML(XML(_loc2_.content));
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("HabboTalent","Failed to build window " + param1 + "_xml, " + _loc4_ + ", " + _windowManager + "!");
            throw e;
         }
         return _loc3_;
      }
      
      public function testLevelUp(param1:String, param2:class_1669) : void
      {
         _talentLevelUp.showWindow(param1,param2.level,param2.rewardPerks,param2.rewardProducts);
      }
      
      public function get linkPattern() : String
      {
         return "talent/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         var _loc4_:* = _loc2_[1];
         if("open" !== _loc4_)
         {
            class_14.log("Catalog unknown link-type receive: " + _loc2_[1]);
         }
         else if(_loc2_.length > 2)
         {
            _loc3_ = String(_loc2_[2]);
            switch(_loc3_)
            {
               case "citizenship":
                  _tracking.trackTalentTrackOpen("citizenship","citizenshiplink");
                  send(new class_956("citizenship"));
                  break;
               case "helper":
                  _tracking.trackTalentTrackOpen("helper","helperlink");
                  send(new class_956("helper"));
            }
         }
      }
   }
}
