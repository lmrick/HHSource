package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.Util;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class GiveReward extends DefaultActionType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_2826:SliderWindowController;
      
      private var var_3022:int = 5;
      
      private const MAX_REWARDS:int = 20;
      
      public function GiveReward()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.GIVE_REWARD;
      }
      
      override public function validate(param1:class_3151, param2:HabboUserDefinedRoomEvents) : String
      {
         var _loc5_:int = 0;
         var _loc4_:class_3151 = null;
         var _loc6_:String = null;
         var _loc3_:class_3151 = class_3151(param1.findChildByName("rewards_container"));
         var _loc7_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.numChildren)
         {
            if((_loc4_ = class_3151(_loc3_.getChildAt(_loc5_))).visible)
            {
               if((_loc6_ = validateReward(_loc4_,getUniquePrizeCheckBox(param1).isSelected)) != null)
               {
                  return _loc6_;
               }
               _loc7_ += int(getPropabilityInput(_loc4_).text);
            }
            _loc5_++;
         }
         if(_loc7_ > 100)
         {
            return "The sum of probabilities cannot exceed 100. You now have " + _loc7_ + ".";
         }
         return null;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getUserRewardIntervalSelector(param1).getSelected().id);
         _loc2_.push(!!getUniquePrizeCheckBox(param1).isSelected ? 1 : 0);
         _loc2_.push(!!getPrizeLimitCheckBox(param1).isSelected ? var_2826.getValue() : 0);
         var _loc3_:int = int(getDonationRateIntervalInput(param1).caption);
         _loc2_.push(_loc3_ >= 1 ? _loc3_ : 1);
         return _loc2_;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         var _loc6_:int = 0;
         var _loc5_:class_3151 = null;
         var _loc2_:String = null;
         var _loc3_:String = "";
         var _loc4_:class_3151 = class_3151(param1.findChildByName("rewards_container"));
         _loc6_ = 0;
         while(_loc6_ < _loc4_.numChildren)
         {
            if((_loc5_ = class_3151(_loc4_.getChildAt(_loc6_))).visible)
            {
               _loc2_ = getRewardData(_loc5_);
               if(_loc2_ != null)
               {
                  _loc3_ += (_loc3_ == "" ? "" : ";") + _loc2_;
               }
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      private function validateReward(param1:class_3151, param2:Boolean) : String
      {
         var _loc5_:int = 0;
         var _loc4_:String = String(getRewardCodeInput(param1).text);
         var _loc3_:String = String(getPropabilityInput(param1).text);
         if(_loc4_ == "" && _loc3_ == "")
         {
            return null;
         }
         if(_loc4_.indexOf(",") > 0)
         {
            return "Product/badge codes must not contain \',\' characters.";
         }
         if(_loc4_.indexOf(";") > 0)
         {
            return "Product/badge codes must not contain \';\' characters.";
         }
         if(_loc4_.length > 100)
         {
            return "Product/badge codes cannot contain more than 100 characters.";
         }
         if(_loc4_ == "")
         {
            return "Remember to define product/badge codes for all rewards (fill all fields or leave all fields empty).";
         }
         if(!param2)
         {
            if(_loc3_ == "")
            {
               return "Remember to define probabilities for all rewards (fill all fields or leave all fields empty).";
            }
            if(isNaN(Number(_loc3_)))
            {
               return "Make sure are probabilities are numbers.";
            }
            if((_loc5_ = int(_loc3_)) < 1 || _loc5_ > 100)
            {
               return "Make sure all probabilities are numbers between 1 and 100.";
            }
         }
         return null;
      }
      
      private function getRewardData(param1:class_3151) : String
      {
         var _loc3_:String = String(getRewardCodeInput(param1).text);
         var _loc5_:String = String(getPropabilityInput(param1).text);
         var _loc2_:Boolean = Boolean(getIsBadgeCheckBox(param1).isSelected);
         _loc3_ = replaceAll(_loc3_,";","");
         _loc3_ = replaceAll(_loc3_,",","");
         if(_loc3_ == "")
         {
            return null;
         }
         var _loc4_:int = int(isNaN(Number(_loc5_)) ? 0 : int(_loc5_));
         return (_loc2_ ? "0" : "1") + "," + _loc3_ + "," + _loc4_;
      }
      
      private function setRewardData(param1:int, param2:class_3151, param3:String) : void
      {
         var _loc4_:Array = param3 == null ? [] : param3.split(",");
         getRewardCodeInput(param2).text = !!_loc4_[1] ? _loc4_[1] : "";
         getPropabilityInput(param2).text = !!_loc4_[2] ? _loc4_[2] : "";
         if(_loc4_[0] && _loc4_[0] == "0")
         {
            getIsBadgeCheckBox(param2).select();
         }
         else
         {
            getIsBadgeCheckBox(param2).unselect();
         }
      }
      
      private function replaceAll(param1:String, param2:String, param3:String) : String
      {
         var _loc4_:int = 100;
         while(param1.indexOf(param2) > -1)
         {
            param1 = param1.replace(param2,param3);
            _loc4_--;
            if(_loc4_ < 1)
            {
               break;
            }
         }
         return param1;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         var _loc5_:int = 0;
         var _loc4_:class_3151 = null;
         _roomEvents = param2;
         var_2826 = new SliderWindowController(param2,getPrizeLimitSliderContainer(param1),param2.assets,1,1000,1);
         var_2826.addEventListener("change",onSliderChange);
         var_2826.setValue(1);
         getPrizeLimitCheckBox(param1).procedure = onPrizeLimitCheckBox;
         getUniquePrizeCheckBox(param1).procedure = onUniquePrizeCheckBox;
         param1.findChildByName("add_reward_txt").procedure = onAddReward;
         var _loc3_:class_3151 = class_3151(param1.findChildByName("rewards_container"));
         _loc5_ = 0;
         while(_loc5_ < 20)
         {
            _loc4_ = class_3151(_roomEvents.getXmlWindow("ude_action_inputs_17_reward"));
            _loc3_.addChild(_loc4_);
            _loc4_.y = _loc5_ * 14;
            _loc4_.id = _loc5_;
            _loc5_++;
         }
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc8_:int = 0;
         var _loc6_:class_3151 = null;
         var _loc3_:int = int(param2.intParams[0]);
         getUserRewardIntervalSelector(param1).setSelected(getIntervalRadio(param1,_loc3_));
         if(_loc3_ > 0 && param2.intParams.length == 4)
         {
            getDonationRateIntervalInput(param1).caption = String(param2.intParams[3]);
         }
         else
         {
            getDonationRateIntervalInput(param1).caption = "1";
         }
         var _loc7_:* = param2.intParams[1] == 1;
         if(param2.intParams[1] == 1)
         {
            getUniquePrizeCheckBox(param1).select();
         }
         else
         {
            getUniquePrizeCheckBox(param1).unselect();
         }
         var _loc4_:int;
         if((_loc4_ = int(param2.intParams[2])) > 0)
         {
            var_2826.setValue(_loc4_);
            getPrizeLimitCheckBox(param1).select();
         }
         else
         {
            getPrizeLimitCheckBox(param1).unselect();
         }
         refreshPrizeLimit(param1);
         var _loc9_:Array = param2.stringParam.split(";");
         var _loc5_:class_3151 = class_3151(param1.findChildByName("rewards_container"));
         _loc8_ = 0;
         while(_loc8_ < 20)
         {
            _loc6_ = class_3151(_loc5_.getChildAt(_loc8_));
            setRewardData(_loc8_,_loc6_,_loc9_[_loc8_]);
            if(_loc9_[_loc8_])
            {
               var_3022 = _loc8_ + 1;
            }
            _loc8_++;
         }
         setEntryVisibilities(param1);
         setPropabilityVisibilities(param1);
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getRewardCodeInput(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("reward_code_input"));
      }
      
      private function getPropabilityInput(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("propability_input"));
      }
      
      private function getIsBadgeCheckBox(param1:class_3151) : class_3176
      {
         return class_3176(param1.findChildByName("is_badge_checkbox"));
      }
      
      private function getPrizeLimitSliderContainer(param1:class_3151) : class_3151
      {
         return class_3151(param1.findChildByName("slider_container"));
      }
      
      private function getUniquePrizeCheckBox(param1:class_3151) : class_3176
      {
         return class_3176(param1.findChildByName("unique_prize_checkbox"));
      }
      
      private function getPrizeLimitCheckBox(param1:class_3151) : class_3176
      {
         return class_3176(param1.findChildByName("prize_limit_checkbox"));
      }
      
      private function getIntervalRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("interval_" + param2 + "_radio"));
      }
      
      private function getUserRewardIntervalSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("user_reward_interval_selector"));
      }
      
      private function getDonationRateIntervalInput(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("interval_input"));
      }
      
      private function onSliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc4_:Number = NaN;
         var _loc3_:int = 0;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc4_ = _loc2_.getValue();
               setPrizeLimitAmount("" + _loc3_);
            }
         }
      }
      
      private function onPrizeLimitCheckBox(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            refreshPrizeLimit(class_3151(param2.parent));
         }
      }
      
      private function onUniquePrizeCheckBox(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            setPropabilityVisibilities(class_3151(param2.parent));
         }
      }
      
      private function onAddReward(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_3022++;
            setEntryVisibilities(class_3151(param2.parent.parent));
         }
      }
      
      private function refreshPrizeLimit(param1:class_3151) : void
      {
         var _loc2_:Boolean = Boolean(getPrizeLimitCheckBox(param1).isSelected);
         param1.findChildByName("prize_limit_warning_txt").visible = !_loc2_;
         getPrizeLimitSliderContainer(param1).visible = _loc2_;
         setPrizeLimitAmount(_loc2_ ? "" + var_2826.getValue() : "");
      }
      
      private function setPrizeLimitAmount(param1:String) : void
      {
         _roomEvents.localization.registerParameter("wiredfurni.params.prizelimit","amount",param1);
      }
      
      private function setEntryVisibilities(param1:class_3151) : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_3151 = null;
         var _loc2_:class_3151 = class_3151(param1.findChildByName("rewards_container"));
         _loc4_ = 0;
         while(_loc4_ < 20)
         {
            _loc3_ = class_3151(_loc2_.getChildAt(_loc4_));
            _loc3_.visible = _loc4_ < var_3022;
            _loc4_++;
         }
         _loc2_.height = Util.getLowestPoint(_loc2_);
         param1.height = Util.getLowestPoint(param1);
         _roomEvents.userDefinedRoomEventsCtrl.refresh();
      }
      
      private function setPropabilityVisibilities(param1:class_3151) : void
      {
         var _loc5_:int = 0;
         var _loc3_:class_3151 = null;
         var _loc2_:class_3151 = class_3151(param1.findChildByName("rewards_container"));
         var _loc4_:Boolean = Boolean(getUniquePrizeCheckBox(param1).isSelected);
         param1.findChildByName("propability_txt").visible = !_loc4_;
         _loc5_ = 0;
         while(_loc5_ < 20)
         {
            _loc3_ = class_3151(_loc2_.getChildAt(_loc5_));
            getPropabilityInput(_loc3_).visible = !_loc4_;
            _loc5_++;
         }
      }
   }
}
