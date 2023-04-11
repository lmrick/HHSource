package com.sulake.habbo.navigator.roomsettings
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.class_1686;
   import package_31.class_163;
   import package_31.class_413;
   
   public class RoomFilterCtrl implements class_13
   {
       
      
      private var _flatId:int;
      
      private var _navigator:class_1686;
      
      private var var_3182:int = -1;
      
      private var _window:class_3151;
      
      private var var_616:Array;
      
      private var var_1768:IItemListWindow;
      
      private var var_2217:ITextFieldWindow;
      
      public function RoomFilterCtrl(param1:class_1686)
      {
         super();
         _navigator = param1;
         var_616 = [];
      }
      
      public function startRoomFilterEdit(param1:int) : void
      {
         _flatId = param1;
         _navigator.send(new class_413(_flatId));
         refreshWindow();
      }
      
      private function refreshWindow() : void
      {
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         prepareWindow();
         _window.visible = true;
         _window.invalidate();
         _window.activate();
         _navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer","open","room.filter.seen");
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3281(_navigator.getXmlWindow("iro_room_filter_framed"));
         _window.findChildByName("badword_remove_btn").addEventListener("WME_CLICK",onRemoveWordClick);
         _window.findChildByName("badword_add_btn").addEventListener("WME_CLICK",onAddWordClick);
         _window.findChildByTag("close").addEventListener("WME_CLICK",onCloseButtonClick);
         var_2217 = _window.findChildByName("roomfilter_addword_txt") as ITextFieldWindow;
         var_1768 = IItemListWindow(_window.findChildByName("badwords_itemlist"));
         refreshBadWords();
         _window.center();
      }
      
      public function onRoomFilterSettings(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            if(var_616.indexOf(param1[_loc2_]) == -1)
            {
               var_616.push(param1[_loc2_]);
            }
            _loc2_++;
         }
         if(var_1768)
         {
            var_1768.removeListItems();
            refreshBadWords();
         }
      }
      
      private function refreshBadWords() : void
      {
         var _loc2_:int = 0;
         var _loc1_:class_3151 = null;
         var_1768.autoArrangeItems = false;
         _loc2_ = 0;
         while(true)
         {
            _loc1_ = class_3151(var_1768.getListItemAt(_loc2_));
            if(_loc1_ == null)
            {
               if(true)
               {
                  break;
               }
               _loc1_ = getListEntry(_loc2_);
               var_1768.addListItem(_loc1_);
            }
            if(false)
            {
               _loc1_.color = this.getBgColor(_loc2_,false);
               refreshEntryDetails(_loc1_,var_616[_loc2_]);
               _loc1_.visible = true;
               _loc1_.height = 20;
            }
            else
            {
               _loc1_.height = 0;
               _loc1_.visible = false;
            }
            _loc2_++;
         }
         var_1768.autoArrangeItems = true;
         var_1768.invalidate();
      }
      
      private function refreshEntryDetails(param1:class_3151, param2:String) : void
      {
         param1.findChildByName("badword_txt").caption = param2;
      }
      
      private function onCloseButtonClick(param1:class_3134) : void
      {
         disposeWindow();
      }
      
      private function onAddWordClick(param1:WindowMouseEvent) : void
      {
         addBadWord(var_2217.text);
      }
      
      private function addBadWord(param1:String) : void
      {
         if(var_2217 != null && var_2217.text.length > 0)
         {
            _navigator.send(new class_163(_flatId,class_163.var_1425,param1));
            _navigator.send(new class_413(_flatId));
            var_2217.text = "bobba";
         }
      }
      
      private function onRemoveWordClick(param1:WindowMouseEvent) : void
      {
         if(var_3182 < 0)
         {
            return;
         }
         var _loc2_:* = class_3151(var_1768.getListItemAt(var_3182));
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.findChildByName("badword_txt").caption;
         _loc2_.height = 0;
         _loc2_.visible = false;
         _loc2_ = null;
         if(var_616.indexOf(_loc3_) >= 0)
         {
            var_616.splice(var_616.indexOf(_loc3_),1);
         }
         _navigator.send(new class_163(_flatId,class_163.var_1426,_loc3_));
      }
      
      private function refreshColorsAfterClick(param1:IItemListWindow) : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_3151 = null;
         _loc3_ = 0;
         while(_loc3_ < var_616.length)
         {
            _loc2_ = class_3151(param1.getListItemAt(_loc3_));
            _loc2_.color = this.getBgColor(_loc3_,false);
            _loc3_++;
         }
      }
      
      private function getListEntry(param1:int) : class_3151
      {
         if(!_navigator)
         {
            return null;
         }
         var _loc2_:class_3151 = class_3151(_navigator.getXmlWindow("ros_badword"));
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:IRegionWindow = IRegionWindow(_loc2_.findChildByName("bg_region"));
         _loc3_.addEventListener("WME_CLICK",onBgMouseClick);
         _loc3_.addEventListener("WME_OVER",onBgMouseOver);
         _loc3_.addEventListener("WME_OUT",onBgMouseOut);
         _loc2_.id = param1;
         return _loc2_;
      }
      
      protected function getBgColor(param1:int, param2:Boolean) : uint
      {
         if(param1 == var_3182)
         {
            return 4288329945;
         }
         return param2 ? 4290173439 : (param1 % 2 != 0 ? 4294967295 : 4293519841);
      }
      
      private function onBgMouseClick(param1:class_3134) : void
      {
         var_3182 = param1.target.parent.id;
         refreshColorsAfterClick(param1.target.findParentByName("badwords_itemlist") as IItemListWindow);
      }
      
      private function onBgMouseOver(param1:class_3134) : void
      {
         var _loc2_:class_3151 = class_3151(param1.target.parent);
         _loc2_.color = getBgColor(-1,true);
      }
      
      private function onBgMouseOut(param1:class_3134) : void
      {
         var _loc2_:class_3151 = class_3151(param1.target.parent);
         _loc2_.color = getBgColor(_loc2_.id,false);
      }
      
      public function close() : void
      {
         this._flatId = 0;
         if(_window != null)
         {
            _window.visible = false;
         }
      }
      
      public function disposeWindow() : void
      {
         if(_window)
         {
            _window.visible = false;
            _window.dispose();
            _window = null;
         }
         if(var_1768)
         {
            var_1768.removeListItems();
            var_1768.dispose();
            var_1768 = null;
         }
         if(var_2217)
         {
            var_2217.dispose();
            var_2217 = null;
         }
         if(var_616)
         {
            var_616.length = 0;
         }
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         disposeWindow();
         _navigator = null;
      }
      
      public function get disposed() : Boolean
      {
         return _navigator == null;
      }
   }
}
