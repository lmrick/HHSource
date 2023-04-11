package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import package_154.class_1256;
   import package_17.class_486;
   import package_3.class_156;
   import package_3.class_708;
   import package_3.class_859;
   import package_73.class_379;
   import package_73.class_655;
   import package_80.class_956;
   
   public class RoomCompetitionController implements class_13, class_3158
   {
      
      private static const INDENT_LEFT:int = 270;
      
      private static const INDENT_RIGHT:int = 200;
      
      private static const INDENT_TOP:int = 4;
       
      
      private var _window:class_3151;
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var var_822:String;
      
      private var var_4279:int;
      
      private var var_3523:int;
      
      private var _submit:Boolean;
      
      private var _dontShowAgain:Boolean;
      
      private var _hideTimer:Timer;
      
      private var var_170:int;
      
      private var var_2121:class_24;
      
      public function RoomCompetitionController(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         _hideTimer = new Timer(3000,1);
         var_2121 = new class_24();
         super();
         _questEngine = param1;
         _hideTimer.addEventListener("timer",onHideTimer);
      }
      
      public function dispose() : void
      {
         _questEngine = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(_hideTimer)
         {
            _hideTimer.removeEventListener("timer",onHideTimer);
            _hideTimer.reset();
            _hideTimer = null;
         }
         if(var_2121)
         {
            var_2121.dispose();
            var_2121 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _window == null;
      }
      
      private function setText(param1:class_3127, param2:String, param3:String) : void
      {
         var _loc5_:* = param2 + "." + param3;
         var _loc4_:String;
         if((_loc4_ = String(_questEngine.localization.getLocalization(_loc5_,""))) == "")
         {
            _loc5_ = param2;
            _loc4_ = String(_questEngine.localization.getLocalization(_loc5_,""));
         }
         if(_loc4_ == "")
         {
            param1.visible = false;
         }
         else
         {
            param1.visible = true;
            _questEngine.localization.registerParameter(_loc5_,"competition_name",getCompetitionName());
            _questEngine.localization.registerParameter(_loc5_,"votes","" + var_3523);
            param1.caption = "${" + _loc5_ + "}";
         }
      }
      
      public function onCompetitionVotingInfo(param1:class_379) : void
      {
         var_3523 = param1.getParser().votesRemaining;
         var _loc2_:Boolean = param1.getParser().isVotingAllowedForUser;
         var _loc3_:int = param1.getParser().resultCode;
         refreshContent(param1.getParser().goalId,false,param1.getParser().goalCode,_loc3_.toString());
         setInfoRegionProc(_loc3_ == 1 ? onTalents : onSeeParticipants);
         getActionButton().procedure = onVote;
         getActionButton().visible = var_3523 > 0 && _loc2_;
         getButtonInfoText().visible = _loc2_;
      }
      
      public function onCompetitionEntrySubmitResult(param1:class_655) : void
      {
         if(param1.getParser().result == 5)
         {
            return;
         }
         refreshContent(param1.getParser().goalId,true,param1.getParser().goalCode,"" + param1.getParser().result);
         var_170 = param1.getParser().result;
         if(var_170 == 2)
         {
            setInfoRegionProc(null);
            getActionButton().procedure = onConfirm;
         }
         else if(var_170 == 6)
         {
            setInfoRegionProc(onGoToHotelView);
            getActionButton().procedure = onAccept;
         }
         else if(var_170 == 1)
         {
            setInfoRegionProc(onGoToHotelView);
            getActionButton().procedure = onSubmit;
         }
         else if(var_170 == 3)
         {
            setInfoRegionProc(onCatalogLink);
            getActionButton().visible = false;
            refreshRequiredFurnis(param1);
            getRequiredFurnisWindow().visible = true;
         }
         else if(var_170 == 0)
         {
            setInfoRegionProc(onGoToHotelView);
            getActionButton().procedure = onClose;
         }
         else if(var_170 == 4)
         {
            setInfoRegionProc(null);
            getActionButton().procedure = null;
            getActionButton().visible = false;
         }
         else if(var_170 == 5)
         {
            setInfoRegionProc(null);
            getActionButton().procedure = onOpenNavigator;
            getActionButton().visible = true;
         }
      }
      
      private function setInfoRegionProc(param1:Function) : void
      {
         getInfoRegion().procedure = param1;
         getInfoRegion().setParamFlag(1,param1 != null);
      }
      
      public function refreshContent(param1:int, param2:Boolean, param3:String, param4:String) : void
      {
         var_4279 = param1;
         var_822 = param3;
         _submit = param2;
         prepare();
         setTexts(param2 ? "submit" : "vote",param4);
         getActionButton().visible = true;
         setPromoImage();
         showAndPositionWindow();
         getRequiredFurnisWindow().visible = false;
         _window.findChildByName("dont_show_again_container").visible = false;
         _window.findChildByName("normal_container").visible = true;
      }
      
      private function setPromoImage() : void
      {
         getVoteImage().visible = !_submit;
         getSubmitImage().visible = _submit;
      }
      
      private function showAndPositionWindow() : void
      {
         _window.visible = true;
         var _loc1_:Rectangle = _window.desktop.rectangle;
         _window.x = 270;
         _window.y = 4;
         _window.width = _loc1_.width - 270 - 200;
         _window.activate();
      }
      
      private function refreshRequiredFurnis(param1:class_655) : void
      {
         var _loc3_:int = 0;
         var _loc5_:String = null;
         var _loc4_:Array = null;
         var _loc7_:String = null;
         var _loc6_:String = null;
         var _loc8_:class_3151 = null;
         var _loc2_:class_3266 = null;
         var _loc9_:Array = param1.getParser().requiredFurnis;
         _loc3_ = 0;
         while(_loc3_ < _loc9_.length)
         {
            _loc7_ = String((_loc4_ = (_loc5_ = String(_loc9_[_loc3_])).split("*"))[0]);
            _loc6_ = String(_loc4_.length > 1 ? _loc4_[1] : "");
            _loc8_ = getRequiredFurniWindow(_loc3_ + 1);
            if(_loc5_ == null)
            {
               _loc8_.visible = false;
            }
            else
            {
               _loc8_.visible = true;
               _loc8_.findChildByName("tick_icon").visible = !param1.getParser().isMissing(_loc5_);
               _loc2_ = _questEngine.roomEngine.getGenericRoomObjectImage(_loc7_,_loc6_,new Vector3d(180,0,0),1,this);
               if(_loc2_.id != 0)
               {
                  var_2121.add(_loc2_.id,_loc3_);
               }
               setRequiredFurniImage(_loc3_,_loc2_.data);
            }
            _loc3_++;
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(var_2121.getValue(param1) != null)
         {
            setRequiredFurniImage(var_2121.getValue(param1),param2);
            var_2121.remove(param1);
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function setRequiredFurniImage(param1:int, param2:BitmapData) : void
      {
         var _loc4_:class_3151 = getRequiredFurniWindow(param1 + 1);
         var _loc5_:class_3282 = class_3282(_loc4_.findChildByName("furni_icon"));
         var _loc3_:BitmapData = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         if(param2 != null)
         {
            _loc3_.copyPixels(param2,param2.rect,new Point((_loc3_.width - param2.width) / 2,(_loc3_.height - param2.height) / 2));
            _loc5_.bitmap = _loc3_;
         }
      }
      
      private function getCompetitionName() : String
      {
         var _loc1_:String = "roomcompetition." + var_822 + ".name";
         return _questEngine.localization.getLocalization(_loc1_,_loc1_);
      }
      
      private function setTexts(param1:String, param2:String) : void
      {
         setText(getCaption(),"roomcompetition.caption." + param1,param2);
         setText(getInfoText(),"roomcompetition.info." + param1,param2);
         setText(getActionButton(),"roomcompetition.button." + param1,param2);
         setText(getButtonInfoText(),"roomcompetition.buttoninfo." + param1,param2);
         onResize();
      }
      
      private function onResize() : void
      {
         getInfoRegion().y = getCaption().y + getCaption().textHeight + 5;
      }
      
      public function onRoomExit() : void
      {
         close();
      }
      
      public function onRoomEnter(param1:class_486) : void
      {
         close();
         var _loc3_:class_1256 = param1.getParser();
         var _loc2_:Boolean = _questEngine.getInteger("new.identity",0) == 0 || !_questEngine.getBoolean("new.identity.hide.ui");
         if(!_dontShowAgain && _loc2_)
         {
            _submit = _loc3_.owner;
            _questEngine.send(new class_859());
         }
      }
      
      public function sendRoomCompetitionInit() : void
      {
         _questEngine.send(new class_859());
      }
      
      public function onContextChanged() : void
      {
         if(_window != null && false && _submit)
         {
            _questEngine.send(new class_708(var_822,0));
         }
      }
      
      private function close() : void
      {
         if(_window)
         {
            _window.visible = false;
         }
         var_822 = "";
      }
      
      private function prepare() : void
      {
         var _loc1_:int = 0;
         if(_window == null)
         {
            _loc1_ = 1;
            _window = class_3151(_questEngine.getXmlWindow("RoomCompetition",_loc1_));
            _window.findChildByName("close_region").procedure = onClose;
            _questEngine.windowManager.getWindowContext(_loc1_).getDesktopWindow().addEventListener("WE_RESIZED",onDesktopResized);
            _window.findChildByName("dont_show_again_region").procedure = onDontShowAgain;
         }
      }
      
      private function onCatalogLink(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.catalog.openCatalogPage(_questEngine.getProperty("competition." + var_822 + ".catalogPage"));
         }
      }
      
      private function onOpenNavigator(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.navigator.open();
         }
      }
      
      private function onGoToHotelView(param1:class_3134, param2:class_3127 = null) : void
      {
         var _loc3_:HabboToolbarEvent = null;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = new HabboToolbarEvent("HTE_TOOLBAR_CLICK");
            _loc3_.iconId = "HTIE_ICON_RECEPTION";
            _questEngine.toolbar.events.dispatchEvent(_loc3_);
         }
      }
      
      private function onSeeParticipants(param1:class_3134, param2:class_3127 = null) : void
      {
      }
      
      private function onTalents(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.tracking.trackTalentTrackOpen(_questEngine.sessionDataManager.currentTalentTrack,"roomcompetition");
            _questEngine.send(new class_956(_questEngine.sessionDataManager.currentTalentTrack));
         }
      }
      
      private function onAccept(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.send(new class_708(var_822,1));
         }
      }
      
      private function onSubmit(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.send(new class_708(var_822,2));
         }
      }
      
      private function onConfirm(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.send(new class_708(var_822,3));
         }
      }
      
      private function onVote(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.send(new class_156(var_822));
         }
      }
      
      private function onClose(param1:class_3134, param2:class_3127 = null) : void
      {
         var _loc3_:String = null;
         if(param1.type == "WME_CLICK")
         {
            if(_submit && var_170 == 0)
            {
               close();
               return;
            }
            _loc3_ = "roomcompetition.dontshowagain.info." + (_submit ? "submit" : "vote");
            _window.findChildByName("dont_show_info_txt").caption = _questEngine.localization.getLocalization(_loc3_,_loc3_);
            _window.findChildByName("dont_show_again_container").visible = true;
            _window.findChildByName("normal_container").visible = false;
            _hideTimer.reset();
            _hideTimer.start();
         }
      }
      
      private function onDontShowAgain(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _dontShowAgain = true;
            close();
         }
      }
      
      private function getInfoRegion() : class_3127
      {
         return _window.findChildByName("info_region");
      }
      
      private function getInfoText() : class_3127
      {
         return _window.findChildByName("info_txt");
      }
      
      private function getButtonInfoText() : class_3127
      {
         return _window.findChildByName("button_info_txt");
      }
      
      private function getActionButton() : class_3127
      {
         return _window.findChildByName("action_button");
      }
      
      private function getCaption() : ITextWindow
      {
         return ITextWindow(_window.findChildByName("caption_txt"));
      }
      
      private function getRequiredFurnisWindow() : class_3127
      {
         return _window.findChildByName("required_furnis_itemgrid");
      }
      
      private function getVoteImage() : class_3127
      {
         return _window.findChildByName("vote_image");
      }
      
      private function getSubmitImage() : class_3127
      {
         return _window.findChildByName("submit_image");
      }
      
      private function getRequiredFurniWindow(param1:int) : class_3151
      {
         var _loc3_:int = 0;
         var _loc4_:IItemGridWindow = IItemGridWindow(_window.findChildByName("required_furnis_itemgrid"));
         var _loc2_:class_3151 = class_3151(_loc4_.getGridItemAt(0));
         if(_loc4_.numGridItems < param1)
         {
            _loc3_ = 0;
            while(_loc3_ < param1 - _loc4_.numGridItems)
            {
               _loc4_.addGridItem(_loc2_.clone());
               _loc3_++;
            }
         }
         return class_3151(_loc4_.getGridItemAt(param1 - 1));
      }
      
      private function onDesktopResized(param1:class_3134) : void
      {
         if(_window != null && false)
         {
            onResize();
         }
      }
      
      public function set dontShowAgain(param1:Boolean) : void
      {
         _dontShowAgain = param1;
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         close();
      }
   }
}
