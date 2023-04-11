package com.sulake.habbo.catalog.vault
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Point;
   import package_167.class_1603;
   
   public class VaultView implements class_13
   {
      
      private static const TAB_EARNINGS:String = "earningsTab";
      
      private static const TAB_VAULT:String = "vaultTab";
       
      
      private const DEFAULT_VIEW_LOCATION:Point = new Point(120,150);
      
      private var var_282:com.sulake.habbo.catalog.vault.VaultController;
      
      private var _window:class_3151;
      
      private var _currentTab:String = "earningsTab";
      
      private var _tabContext:ITabContextWindow;
      
      private var var_3026:Array;
      
      public function VaultView(param1:com.sulake.habbo.catalog.vault.VaultController, param2:class_1684)
      {
         var_3026 = ["tutorial","dailygift","achievements","marketplace","habboclub","levelprogression","roombundlesales","bonusbag","donation","surprise","snowstorm"];
         super();
         var_282 = param1;
         _window = param2.buildFromXML(XML(var_282.assets.getAssetByName("vault_view_xml").content)) as class_3151;
         _window.position = DEFAULT_VIEW_LOCATION;
         _window.procedure = windowProcedure;
         _window.findChildByName("vaultTab").procedure = onTab;
         _window.findChildByName("earningsTab").procedure = onTab;
         refresh();
         switchToTab("earningsTab");
      }
      
      private static function getDistinctRewardCategories(param1:Array) : Array
      {
         var _loc2_:Boolean = false;
         var _loc4_:* = [];
         for each(var _loc3_ in param1)
         {
            _loc2_ = false;
            for each(var _loc5_ in _loc4_)
            {
               if(_loc3_.rewardCategory == _loc5_)
               {
                  _loc2_ = true;
                  break;
               }
            }
            if(!_loc2_)
            {
               _loc4_.push(_loc3_.rewardCategory);
            }
         }
         return _loc4_;
      }
      
      private function resizeTabs() : void
      {
         var _loc3_:int = 0;
         var _loc2_:ITabButtonWindow = null;
         var _loc1_:int = 0 / 0;
         _loc1_ -= 1;
         _loc3_ = 0;
         while(_loc3_ < _tabContext.numTabItems)
         {
            _loc2_ = _tabContext.getTabItemAt(_loc3_);
            _loc2_.width = _loc1_ - 2;
            _loc3_++;
         }
      }
      
      private function switchToTab(param1:String) : void
      {
         _currentTab = param1;
         _tabContext.selector.setSelected(ISelectableWindow(_window.findChildByName(_currentTab)));
      }
      
      public function onCreditVaultDataReceived(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            toggleUnlockedVaultElements(true,param2);
            toggleLockedVaultElements(false,param2,param3);
         }
         else
         {
            toggleUnlockedVaultElements(false,param2);
            toggleLockedVaultElements(true,param2,param3);
         }
      }
      
      private function toggleUnlockedVaultElements(param1:Boolean, param2:int) : void
      {
         var _loc5_:* = null;
         var _loc4_:class_3127 = null;
         var _loc3_:class_3127 = null;
         var _loc7_:class_3127 = null;
         if(_window)
         {
            _loc5_ = ["vaultUnlockedInstructions_container"];
            for each(var _loc6_ in _loc5_)
            {
               if((_loc4_ = _window.findChildByName(_loc6_)) != null)
               {
                  _loc4_.visible = param1;
               }
            }
            _loc3_ = _window.findChildByName("vaultCreditsPending_amount");
            if(_loc3_ != null)
            {
               _loc3_.caption = param2.toString();
            }
            if((_loc7_ = _window.findChildByName("vaultWithdrawAll_button")) != null)
            {
               if(param2 > 0)
               {
                  _loc7_.enable();
               }
               else
               {
                  _loc7_.disable();
               }
            }
         }
      }
      
      private function toggleLockedVaultElements(param1:Boolean, param2:int, param3:int) : void
      {
         var _loc6_:* = null;
         var _loc5_:class_3127 = null;
         var _loc7_:class_3127 = null;
         var _loc9_:class_3127 = null;
         var _loc4_:class_3127 = null;
         if(_window)
         {
            _loc6_ = ["vaultWithdrawArea","vaultLockedInstructions_container"];
            for each(var _loc8_ in _loc6_)
            {
               if((_loc5_ = _window.findChildByName(_loc8_)) != null)
               {
                  _loc5_.visible = param1;
               }
            }
            if(param1)
            {
               if((_loc7_ = _window.findChildByName("vaultCredits_amount")) != null)
               {
                  _loc7_.caption = param3.toString();
                  if((_loc9_ = _window.findChildByName("vaultWithdraw_button")) != null)
                  {
                     if(param3 > 0)
                     {
                        _loc9_.enable();
                     }
                     else
                     {
                        _loc9_.disable();
                     }
                  }
               }
            }
            if((_loc4_ = _window.findChildByName("vaultCreditsPending_amount")) != null)
            {
               _loc4_.caption = param2.toString();
            }
         }
      }
      
      public function onIncomeRewardClaimResponse(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            updateRewardsForCategory(param1,0,0);
         }
         else
         {
            setElementEnabled("undefined_claim_button",true);
         }
      }
      
      public function onIncomeRewardDataReceived(param1:Array) : void
      {
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:Boolean = false;
         var _loc10_:class_3127 = null;
         var _loc5_:* = [];
         for each(var _loc2_ in getDistinctRewardCategories(param1))
         {
            _loc6_ = 0;
            _loc3_ = 0;
            _loc7_ = 0;
            for each(var _loc8_ in param1)
            {
               if(_loc2_ == _loc8_.rewardCategory)
               {
                  if(_loc8_.rewardType == 0)
                  {
                     _loc6_ += _loc8_.amount;
                  }
                  if(_loc8_.rewardType === 1)
                  {
                     _loc3_ += _loc8_.amount;
                  }
                  if(_loc8_.productCode)
                  {
                     _loc7_++;
                  }
               }
            }
            updateRewardsForCategory(_loc2_,_loc3_,_loc6_,_loc7_);
            if(_loc3_ > 0 || _loc6_ > 0 || _loc7_ > 0)
            {
               _loc5_.push(var_3026[_loc2_]);
            }
         }
         for each(var _loc9_ in var_3026)
         {
            _loc4_ = false;
            for each(var _loc11_ in _loc5_)
            {
               if(_loc9_ == _loc11_)
               {
                  _loc4_ = true;
                  break;
               }
            }
            if(!_loc4_)
            {
               if((_loc10_ = _window.findChildByName(_loc9_ + "_claim_button")) != null)
               {
                  _loc10_.disable();
               }
            }
         }
      }
      
      private function updateRewardsForCategory(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         var _loc6_:class_3127 = null;
         var _loc8_:String = "null";
         var _loc7_:class_3127;
         if((_loc7_ = _window.findChildByName(_loc8_ + "CreditValue")) != null)
         {
            _loc7_.caption = param2.toString();
         }
         var _loc5_:class_3127;
         if((_loc5_ = _window.findChildByName(_loc8_ + "DucketValue")) != null)
         {
            _loc5_.caption = param3.toString();
         }
         if(param4 > 0)
         {
            if((_loc6_ = _window.findChildByName(_loc8_ + "ProductValue")) != null)
            {
               _loc6_.caption = param4.toString();
            }
         }
      }
      
      private function onTab(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _currentTab = param2.name;
         refresh();
      }
      
      private function refresh() : void
      {
         _tabContext = ITabContextWindow(_window.findChildByName("tabs"));
         _tabContext.selector.setSelected(ISelectableWindow(_window.findChildByName(_currentTab)));
         resizeTabs();
         if(_currentTab == "vaultTab")
         {
            _window.findChildByName("vaultContentArea").visible = true;
            _window.findChildByName("earningsContentArea").visible = false;
         }
         else if(_currentTab == "earningsTab")
         {
            _window.findChildByName("vaultContentArea").visible = false;
            _window.findChildByName("earningsContentArea").visible = true;
         }
      }
      
      private function setElementEnabled(param1:String, param2:Boolean) : void
      {
         var _loc3_:class_3127 = _window.findChildByName(param1);
         if(_loc3_ != null)
         {
            param2 ? _loc3_.enable() : _loc3_.disable();
         }
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "vaultWithdraw_button":
            case "vaultWithdrawAll_button":
               var_282.withdrawVaultCredits();
               break;
            case "vaultOpenShop_button":
               var_282.openCatalogue();
               break;
            case "header_button_close":
               dispose();
               break;
            case "dailygift_claim_button":
               setElementEnabled("dailygift_claim_button",false);
               var_282.claimReward(1);
               break;
            case "achievements_claim_button":
               setElementEnabled("achievements_claim_button",false);
               var_282.claimReward(2);
               break;
            case "marketplace_claim_button":
               setElementEnabled("marketplace_claim_button",false);
               var_282.claimReward(3);
               break;
            case "habboclub_claim_button":
               setElementEnabled("habboclub_claim_button",false);
               var_282.claimReward(4);
               break;
            case "levelprogression_claim_button":
               setElementEnabled("levelprogression_claim_button",false);
               var_282.claimReward(5);
               break;
            case "bonusbag_claim_button":
               setElementEnabled("bonusbag_claim_button",false);
               var_282.claimReward(7);
               break;
            case "donation_claim_button":
               setElementEnabled("donation_claim_button",false);
               var_282.claimReward(8);
               break;
            case "surprise_claim_button":
               setElementEnabled("surprise_claim_button",false);
               var_282.claimReward(9);
               break;
            case "snowstorm_claim_button":
               setElementEnabled("snowstorm_claim_button",false);
               var_282.claimReward(10);
         }
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_282 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_282 == null;
      }
   }
}
