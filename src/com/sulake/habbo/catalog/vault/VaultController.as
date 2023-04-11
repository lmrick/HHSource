package com.sulake.habbo.catalog.vault
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import package_167.class_1196;
   import package_167.class_1373;
   import package_167.class_1457;
   import package_97.class_409;
   import package_97.class_537;
   import package_97.class_548;
   
   public class VaultController extends class_20 implements ILinkEventTracker
   {
       
      
      private var _communicationManager:class_25;
      
      private var _localizationManager:class_18;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _windowManager:class_1684;
      
      private var var_1430:com.sulake.habbo.catalog.vault.VaultView;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      public function VaultController(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         },true),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localizationManager = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         _messageEvents = new Vector.<IMessageEvent>(0);
         addMessageEvent(new class_409(onVaultStatusMessageEvent));
         addMessageEvent(new class_548(onIncomeRewardStatusMessageEvent));
         addMessageEvent(new class_537(onIncomeRewardClaimResponseMessageEvent));
         context.addLinkEventTracker(this);
      }
      
      private function addMessageEvent(param1:IMessageEvent) : void
      {
         if(!_communicationManager)
         {
            return;
         }
         _messageEvents.push(_communicationManager.addHabboConnectionMessageEvent(param1));
      }
      
      private function onVaultStatusMessageEvent(param1:class_409) : void
      {
         var _loc2_:class_1373 = null;
         if(var_1430)
         {
            _loc2_ = param1.getParser();
            var_1430.onCreditVaultDataReceived(_loc2_.isUnlocked,_loc2_.totalBalance,_loc2_.withdrawBalance);
         }
      }
      
      private function onIncomeRewardStatusMessageEvent(param1:class_548) : void
      {
         var _loc2_:class_1457 = null;
         if(var_1430)
         {
            _loc2_ = param1.getParser();
            var_1430.onIncomeRewardDataReceived(_loc2_.data);
         }
      }
      
      private function onIncomeRewardClaimResponseMessageEvent(param1:class_537) : void
      {
         var _loc2_:class_1196 = null;
         if(var_1430)
         {
            _loc2_ = param1.getParser();
            var_1430.onIncomeRewardClaimResponse(_loc2_.rewardCategory,_loc2_.result);
         }
      }
      
      public function openCatalogue() : void
      {
         context.createLinkEvent("catalog/open");
      }
      
      public function get linkPattern() : String
      {
         return "habboUI/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 3)
         {
            return;
         }
         if(_loc2_[1] == "open")
         {
            var _loc3_:* = _loc2_[2];
            if("vault" === _loc3_)
            {
               showVault();
            }
         }
      }
      
      public function withdrawVaultCredits() : void
      {
         _sessionDataManager.withdrawCreditVault();
      }
      
      public function claimReward(param1:int) : void
      {
         _sessionDataManager.claimReward(param1);
      }
      
      private function showVault() : void
      {
         if(!var_1430 || false)
         {
            var_1430 = new com.sulake.habbo.catalog.vault.VaultView(this,_windowManager);
         }
         _sessionDataManager.getCreditVaultStatus();
         _sessionDataManager.getIncomeRewardStatus();
      }
      
      public function removeView() : void
      {
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
      }
      
      override public function dispose() : void
      {
         if(_messageEvents != null && _communicationManager != null)
         {
            for each(var _loc1_ in _messageEvents)
            {
               _communicationManager.removeHabboConnectionMessageEvent(_loc1_);
            }
         }
         removeView();
         _messageEvents = null;
         super.dispose();
      }
   }
}
