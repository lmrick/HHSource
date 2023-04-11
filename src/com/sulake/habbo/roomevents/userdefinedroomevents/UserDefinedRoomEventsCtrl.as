package com.sulake.habbo.roomevents.userdefinedroomevents
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.*;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.Util;
   import com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes.ActionType;
   import com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes.ActionTypes;
   import com.sulake.habbo.roomevents.userdefinedroomevents.addons.AddonTypes;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import com.sulake.habbo.roomevents.userdefinedroomevents.conditions.ConditionTypes;
   import com.sulake.habbo.roomevents.userdefinedroomevents.conditions.class_3381;
   import com.sulake.habbo.roomevents.userdefinedroomevents.help.UserDefinedRoomEventsHelp;
   import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.TriggerConfs;
   import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.class_3305;
   import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.class_3306;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import package_5.class_564;
   import package_57.class_1020;
   import package_57.class_222;
   import package_57.class_355;
   import package_57.class_429;
   import package_57.class_567;
   import package_79.class_1554;
   import package_79.class_1555;
   import package_79.class_1592;
   import package_79.class_1593;
   import package_79.class_1635;
   
   public class UserDefinedRoomEventsCtrl
   {
      
      public static var STUFF_SELECTION_OPTION_NONE:int = 0;
      
      public static var STUFF_SELECTION_OPTION_BY_ID:int = 1;
      
      public static var STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE:int = 2;
      
      public static var STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT:int = 3;
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var _window:class_3281;
      
      private var _configureContainer:class_3151;
      
      private var var_3562:TriggerConfs;
      
      private var var_3660:ActionTypes;
      
      private var var_3636:ConditionTypes;
      
      private var var_3645:AddonTypes;
      
      private var var_1800:Dictionary;
      
      private var var_1461:class_1554;
      
      private var var_2856:com.sulake.habbo.roomevents.userdefinedroomevents.RoomObjectHightLighter;
      
      private var _help:UserDefinedRoomEventsHelp;
      
      private var var_3102:SliderWindowController;
      
      private var var_3914:Boolean = false;
      
      public function UserDefinedRoomEventsCtrl(param1:HabboUserDefinedRoomEvents)
      {
         var_3562 = new TriggerConfs();
         var_3660 = new ActionTypes();
         var_3636 = new ConditionTypes();
         var_3645 = new AddonTypes();
         var_1800 = new Dictionary();
         super();
         _roomEvents = param1;
         var_2856 = new com.sulake.habbo.roomevents.userdefinedroomevents.RoomObjectHightLighter(param1);
         _help = new UserDefinedRoomEventsHelp(param1);
      }
      
      public function stuffSelected(param1:int, param2:String) : void
      {
         if(_window == null || true)
         {
            return;
         }
         if(!isStuffSelectionMode())
         {
            return;
         }
         if(false)
         {
            delete var_1800[param1];
            var_2856.hide(param1);
         }
         else if(this.getStuffIds().length < var_1461.furniLimit)
         {
            var_1800[param1] = param2;
            var_2856.show(param1);
         }
         refresh();
      }
      
      private function isStuffSelectionMode() : Boolean
      {
         var _loc1_:class_3304 = resolveType();
         return _loc1_.requiresFurni != STUFF_SELECTION_OPTION_NONE;
      }
      
      private function resolveType() : class_3304
      {
         if(var_1461 != null)
         {
            return resolveHolder().getElementByCode(var_1461.code);
         }
         return null;
      }
      
      private function resolveHolder() : class_3294
      {
         if(var_1461 as class_1592 != null)
         {
            return var_3562;
         }
         if(var_1461 as class_1593 != null)
         {
            return var_3660;
         }
         if(var_1461 as class_1555 != null)
         {
            return var_3636;
         }
         if(var_1461 as class_1635 != null)
         {
            return var_3645;
         }
         return null;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         _window = class_3281(_roomEvents.getXmlWindow("ude_main"));
         _configureContainer = class_3151(find(_window,"configure_container"));
         Util.setProcDirectly(find(_configureContainer,"save_button"),onSave);
         Util.setProcDirectly(find(_configureContainer,"cancel_save_button"),onWindowClose);
         Util.setProcDirectly(find(_configureContainer,"helplink"),onHelp);
         Util.setProcDirectly(find(_configureContainer,"apply_snapshot_txt"),onApplySnapshot);
         Util.setProcDirectly(find(_configureContainer,"dec_stuff_sel_button"),onDecStuffSelectionType);
         Util.setProcDirectly(find(_configureContainer,"inc_stuff_sel_button"),onIncStuffSelectionType);
         find(_configureContainer,"helplink").mouseThreshold = 0;
         find(_configureContainer,"apply_snapshot_txt").mouseThreshold = 0;
         var_3102 = new SliderWindowController(_roomEvents,class_3151(find(_configureContainer,"delay_slider_container")),_roomEvents.assets,0,20,1);
         var_3102.addEventListener("change",onDelaySliderChange);
         var_3102.setValue(0);
         setIcon("configure_container","icon_trigger","trigger_icon_bitmap");
         setIcon("configure_container","icon_action","action_icon_bitmap");
         setIcon("configure_container","icon_condition","condition_icon_bitmap");
         setIcon("configure_container","icon_addon","addon_icon_bitmap");
         var _loc1_:class_3127 = _window.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         _window.center();
      }
      
      private function onDelaySliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc5_:Number = NaN;
         var _loc4_:int = 0;
         var _loc3_:String = null;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc4_ = _loc5_ = _loc2_.getValue();
               _loc3_ = class_3306.getSecsFromPulses(_loc4_);
               _roomEvents.localization.registerParameter("wiredfurni.params.delay","seconds",_loc3_);
            }
         }
      }
      
      private function setIcon(param1:String, param2:String, param3:String = "icon_bitmap") : void
      {
         var _loc4_:class_3151 = class_3151(find(_window,param1));
         _roomEvents.refreshButton(_loc4_,param3,true,null,0,param2);
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            close();
         }
      }
      
      public function close() : void
      {
         if(_window)
         {
            _window.visible = false;
            var_2856.hideAll(var_1800);
         }
      }
      
      private function find(param1:class_3151, param2:String) : class_3127
      {
         var _loc3_:class_3127 = param1.findChildByName(param2);
         if(_loc3_ == null)
         {
            throw new Error("Window element with name: " + param2 + " cannot be found!");
         }
         return _loc3_;
      }
      
      public function prepareForUpdate(param1:class_1554) : void
      {
         var _loc3_:class_1593 = null;
         var _loc5_:int = 0;
         prepareWindow();
         var_1461 = param1;
         class_14.log("Received: " + var_1461 + ", " + param1.code);
         var _loc6_:class_3304 = resolveType();
         var_2856.hideAll(var_1800);
         var_1800 = new Dictionary();
         for each(var _loc2_ in var_1461.stuffIds)
         {
            var_1800[_loc2_] = "yes";
         }
         var _loc4_:class_3151 = _loc6_.hasSpecialInputs ? this.prepareCustomInput() : null;
         _loc6_.onEditStart(_loc4_,var_1461);
         var_2856.showAll(var_1800);
         if(var_1461 as class_1593 != null)
         {
            _loc3_ = class_1593(var_1461);
            _loc5_ = _loc3_.delayInPulses;
            var_3102.setValue(_loc5_);
         }
         prepareStuffSelectionForUpdate();
         refresh();
      }
      
      private function prepareStuffSelectionForUpdate() : void
      {
         var _loc2_:class_3304 = null;
         getFurniTypeMatchesText().visible = false;
         getIncStuffSelTxt().visible = false;
         getDecStuffSelTxt().visible = false;
         if(false)
         {
            _loc2_ = resolveType();
            if(_loc2_.requiresFurni == STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE || _loc2_.requiresFurni == STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT)
            {
               getIncStuffSelTxt().visible = true;
               getDecStuffSelTxt().visible = true;
               getFurniTypeMatchesText().visible = true;
               refreshStuffTypeSelectionToggler();
            }
         }
         var _loc1_:class_3151 = class_3151(_configureContainer.findChildByName("select_furni_container"));
         _loc1_.height = Util.getLowestPoint(_loc1_);
      }
      
      private function refreshStuffTypeSelectionToggler() : void
      {
         var _loc5_:class_3304;
         var _loc4_:String = (_loc5_ = resolveType()) as ActionType != null ? "effect" : (_loc5_ as class_3305 != null ? "trigger" : (_loc5_ as class_3381 != null ? "condition" : "addon"));
         var _loc3_:String = "wiredfurni.pickfurnis." + _loc4_ + _loc5_.code + "." + var_1461.stuffTypeSelectionCode;
         var _loc1_:String = String(_roomEvents.localization.getLocalization(_loc3_,""));
         class_14.log("Searching with key I: " + _loc3_ + " got " + _loc1_);
         if(_loc1_ == "")
         {
            _loc3_ = "wiredfurni.pickfurnis." + _loc4_ + "." + var_1461.stuffTypeSelectionCode;
            _loc1_ = String(_roomEvents.localization.getLocalization(_loc3_,_loc3_));
            class_14.log("Searching with key II: " + _loc3_ + " got " + _loc1_);
         }
         getFurniTypeMatchesText().caption = _loc1_;
      }
      
      public function stuffRemoved(param1:int) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         if(var_1461.id == param1)
         {
            _window.visible = false;
            return;
         }
         if(false)
         {
            delete var_1800[param1];
            refresh();
         }
      }
      
      private function onSave(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(!isOwner(var_1461.id) && !var_3914)
         {
            _roomEvents.windowManager.confirm("${wiredfurni.nonowner.change.confirm.title}","${wiredfurni.nonowner.change.confirm.body}",0,confirmCallback);
         }
         else
         {
            update();
         }
      }
      
      private function confirmCallback(param1:class_3216, param2:class_3134) : void
      {
         param1.dispose();
         if(param2.type == "WE_OK")
         {
            var_3914 = true;
            update();
         }
      }
      
      private function update() : void
      {
         var _loc2_:class_3304 = resolveType();
         var _loc1_:String = _loc2_.validate(_loc2_.hasSpecialInputs ? prepareCustomInput() : null,_roomEvents);
         if(_loc1_ != null)
         {
            _roomEvents.windowManager.alert("Update failed",_loc1_,0,null);
            return;
         }
         if(var_1461 as class_1592 != null)
         {
            _roomEvents.send(new class_222(var_1461.id,resolveIntParams(),resolveStringParam(),getStuffIds(),resolveStuffSelectionType()));
         }
         else if(var_1461 as class_1593 != null)
         {
            _roomEvents.send(new class_429(var_1461.id,resolveIntParams(),resolveStringParam(),getStuffIds(),getActionDelay(),resolveStuffSelectionType()));
         }
         else if(var_1461 as class_1555 != null)
         {
            _roomEvents.send(new class_1020(var_1461.id,resolveIntParams(),resolveStringParam(),getStuffIds(),resolveStuffSelectionType()));
         }
         else if(var_1461 as class_1635 != null)
         {
            _roomEvents.send(new class_355(var_1461.id,resolveIntParams(),resolveStringParam(),getStuffIds(),resolveStuffSelectionType()));
         }
      }
      
      public function getActionDelay() : int
      {
         var _loc1_:ActionType = ActionType(this.resolveType());
         return _loc1_.allowDelaying ? var_3102.getValue() : 0;
      }
      
      private function onHelp(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _help.open(NaN,_window.y);
      }
      
      private function onDecStuffSelectionType(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var _loc3_:class_3304 = this.resolveType();
         var_1461.stuffTypeSelectionCode = var_1461.stuffTypeSelectionCode < 1 ? _loc3_.requiresFurni - 1 : -1;
         refreshStuffTypeSelectionToggler();
      }
      
      private function onIncStuffSelectionType(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var _loc3_:class_3304 = this.resolveType();
         var_1461.stuffTypeSelectionCode = NaN % _loc3_.requiresFurni;
         refreshStuffTypeSelectionToggler();
      }
      
      private function onApplySnapshot(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _roomEvents.send(new class_567(var_1461.id));
      }
      
      private function resolveIntParams() : Array
      {
         var _loc2_:class_3304 = resolveType();
         var _loc1_:class_3151 = _loc2_.hasSpecialInputs ? prepareCustomInput() : null;
         return _loc2_.readIntParamsFromForm(_loc1_);
      }
      
      private function resolveStringParam() : String
      {
         var _loc2_:class_3304 = resolveType();
         var _loc1_:class_3151 = _loc2_.hasSpecialInputs ? prepareCustomInput() : null;
         return _loc2_.readStringParamFromForm(_loc1_);
      }
      
      private function resolveStuffSelectionType() : int
      {
         if(true)
         {
            return 0;
         }
         var _loc1_:class_3304 = resolveType();
         if(_loc1_.requiresFurni == STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE || _loc1_.requiresFurni == STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT)
         {
            return var_1461.stuffTypeSelectionCode;
         }
         return 0;
      }
      
      public function getStuffIds() : Array
      {
         var _loc2_:* = [];
         for(var _loc1_ in var_1800)
         {
            _loc2_.push(int(_loc1_));
         }
         return _loc2_;
      }
      
      public function refresh() : void
      {
         _configureContainer.visible = false;
         refreshConfigureElement(var_3562);
         refreshConfigureElement(var_3660);
         refreshConfigureElement(var_3636);
         refreshConfigureElement(var_3645);
         _window.content.height = Util.getLowestPoint(_window.content);
         _window.visible = true;
      }
      
      private function refreshConfigureElement(param1:class_3294) : void
      {
         if(!param1.acceptTriggerable(var_1461))
         {
            find(_configureContainer,param1.getKey() + "_icon_bitmap").visible = false;
            return;
         }
         _configureContainer.visible = true;
         var _loc2_:class_3304 = resolveType();
         refreshHeader(_loc2_,param1.getKey());
         refreshCustomInputs();
         refreshSelectFurni();
         find(_configureContainer,"warning_container").visible = false;
         refreshConflictingTriggers();
         refreshConflictingActions();
         refreshActionInputs();
         Util.moveAllChildrenToColumn(_configureContainer,3,5);
         _configureContainer.height = Util.getLowestPoint(_configureContainer) + 1;
      }
      
      private function getElementName(param1:int) : String
      {
         var _loc2_:class_3148 = _roomEvents.sessionDataManager.getFloorItemData(param1);
         if(_loc2_ == null)
         {
            class_14.log("COULD NOT FIND FURNIDATA FOR " + param1);
            return "NAME: " + param1;
         }
         return _loc2_.localizedName;
      }
      
      private function getElementDesc(param1:int) : String
      {
         var _loc2_:class_3148 = _roomEvents.sessionDataManager.getFloorItemData(param1);
         if(_loc2_ == null)
         {
            class_14.log("COULD NOT FIND FURNIDATA FOR " + param1);
            return "NAME: " + param1;
         }
         return _loc2_.description;
      }
      
      private function setText(param1:class_3151, param2:String, param3:String) : void
      {
         var _loc4_:ITextWindow;
         (_loc4_ = ITextWindow(find(param1,param2))).caption = param3;
         _loc4_.height = _loc4_.textHeight + 6;
      }
      
      private function refreshHeader(param1:class_3304, param2:String) : void
      {
         var _loc6_:class_3151 = class_3151(find(_configureContainer,"header_container"));
         find(_loc6_,param2 + "_icon_bitmap").visible = true;
         setText(_loc6_,"conf_name_txt",getElementName(var_1461.stuffTypeId));
         setText(_loc6_,"conf_desc_txt",getElementDesc(var_1461.stuffTypeId));
         var _loc4_:class_3127 = find(_loc6_,"conf_name_txt");
         var _loc3_:class_3127 = find(_loc6_,"conf_desc_txt");
         _loc3_.y = _loc4_.y + _loc4_.height;
         var _loc7_:class_3304 = this.resolveType();
         var _loc5_:class_3127 = find(_loc6_,"apply_snapshot_txt");
         if(_loc7_.hasStateSnapshot)
         {
            _loc5_.visible = true;
            _loc5_.y = _loc3_.y + _loc3_.height;
         }
         else
         {
            _loc5_.visible = false;
         }
         _loc6_.height = Util.getLowestPoint(_loc6_) + 4;
      }
      
      private function refreshActionInputs() : void
      {
         var _loc1_:class_3151 = class_3151(find(_configureContainer,"action_inputs_container"));
         if(var_1461 as class_1593 == null)
         {
            _loc1_.visible = false;
            return;
         }
         var _loc2_:ActionType = ActionType(this.resolveType());
         if(!_loc2_.allowDelaying)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
      }
      
      private function refreshConflictingTriggers() : void
      {
         if(var_1461 as class_1593 == null)
         {
            return;
         }
         var _loc1_:class_1593 = class_1593(var_1461);
         if(_loc1_.conflictingTriggers.length < 1)
         {
            return;
         }
         var _loc3_:String = "";
         var _loc4_:Boolean = true;
         for each(var _loc2_ in _loc1_.conflictingTriggers)
         {
            _loc3_ += (_loc4_ ? "" : ", ") + "\'" + getElementName(_loc2_) + "\'";
            _loc4_ = false;
         }
         _roomEvents.localization.registerParameter("wiredfurni.conflictingtriggers.text","triggers",_loc3_);
         refreshWarning(_roomEvents.localization.getLocalization("wiredfurni.conflictingtriggers.caption"),_roomEvents.localization.getLocalization("wiredfurni.conflictingtriggers.text"));
      }
      
      private function refreshConflictingActions() : void
      {
         if(var_1461 as class_1592 == null)
         {
            return;
         }
         var _loc1_:class_1592 = class_1592(var_1461);
         if(_loc1_.conflictingActions.length < 1)
         {
            return;
         }
         var _loc3_:String = "";
         var _loc4_:Boolean = true;
         for each(var _loc2_ in _loc1_.conflictingActions)
         {
            _loc3_ += (_loc4_ ? "" : ", ") + "\'" + getElementName(_loc2_) + "\'";
            _loc4_ = false;
         }
         _roomEvents.localization.registerParameter("wiredfurni.conflictingactions.text","actions",_loc3_);
         refreshWarning(_roomEvents.localization.getLocalization("wiredfurni.conflictingactions.caption"),_roomEvents.localization.getLocalization("wiredfurni.conflictingactions.text"));
      }
      
      private function refreshWarning(param1:String, param2:String) : void
      {
         var _loc3_:class_3151 = class_3151(find(_configureContainer,"warning_container"));
         setText(_loc3_,"caption_txt",param1);
         setText(_loc3_,"desc_txt",param2);
         var _loc4_:class_3127 = find(_loc3_,"caption_txt");
         find(_loc3_,"desc_txt").y = _loc4_.y + _loc4_.height;
         _loc3_.height = Util.getLowestPoint(_loc3_) + 4;
         find(_configureContainer,"warning_container").visible = true;
      }
      
      private function refreshCustomInputs() : void
      {
         var _loc1_:class_3151 = null;
         var _loc2_:class_3151 = class_3151(_configureContainer.findChildByName("custom_inputs_container"));
         Util.hideChildren(_loc2_);
         if(resolveType().hasSpecialInputs)
         {
            _loc1_ = prepareCustomInput();
            _loc1_.visible = true;
         }
         _loc2_.height = Util.getLowestPoint(_loc2_);
      }
      
      private function prepareCustomInput() : class_3151
      {
         var _loc3_:class_3294 = resolveHolder();
         var _loc4_:class_3304 = resolveType();
         var _loc2_:class_3151 = class_3151(_configureContainer.findChildByName("custom_inputs_container"));
         var _loc5_:String = _loc3_.getKey() + _loc4_.code;
         var _loc1_:class_3151 = class_3151(_loc2_.getChildByName(_loc5_));
         if(_loc1_ == null)
         {
            _loc1_ = class_3151(_roomEvents.getXmlWindow("ude_" + _loc3_.getKey() + "_inputs_" + _loc4_.code));
            _loc1_.name = _loc5_;
            _loc2_.addChild(_loc1_);
            _loc4_.onInit(_loc1_,_roomEvents);
         }
         return _loc1_;
      }
      
      private function refreshSelectFurni() : void
      {
         var _loc1_:class_3151 = class_3151(_configureContainer.findChildByName("select_furni_container"));
         if(!isStuffSelectionMode())
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         var _loc2_:class_3127 = _loc1_.findChildByName("furni_name_txt");
         var _loc4_:int = int(this.getStuffIds().length);
         var _loc3_:int = 0;
         _roomEvents.localization.registerParameter("wiredfurni.pickfurnis.caption","count","" + _loc4_);
         _roomEvents.localization.registerParameter("wiredfurni.pickfurnis.caption","limit","" + _loc3_);
      }
      
      private function getDecStuffSelTxt() : class_3127
      {
         return _configureContainer.findChildByName("dec_stuff_sel_button");
      }
      
      private function getIncStuffSelTxt() : class_3127
      {
         return _configureContainer.findChildByName("inc_stuff_sel_button");
      }
      
      private function getFurniTypeMatchesText() : class_3127
      {
         return _configureContainer.findChildByName("furni_type_matches_txt");
      }
      
      private function isOwner(param1:int) : Boolean
      {
         var _loc4_:IRoomObject;
         if((_loc4_ = _roomEvents.roomEngine.getRoomObject(_roomEvents.roomId,param1,10)) == null)
         {
            return false;
         }
         var _loc3_:IRoomObjectModel = _loc4_.getModel();
         if(_loc3_ == null)
         {
            return false;
         }
         var _loc2_:Number = Number(_loc4_.getModel().getNumber("furniture_owner_id"));
         return _loc2_ == _roomEvents.sessionDataManager.userId;
      }
      
      public function onGuildMemberships(param1:class_564) : void
      {
         var _loc2_:class_3304 = resolveType();
         if(_loc2_ != null)
         {
            _loc2_.onGuildMemberships(param1);
         }
      }
   }
}
