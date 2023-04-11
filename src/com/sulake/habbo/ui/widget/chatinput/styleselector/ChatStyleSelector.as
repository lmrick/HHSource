package com.sulake.habbo.ui.widget.chatinput.styleselector
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3207;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.freeflowchat.style.class_3383;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.ui.widget.chatinput.RoomChatInputView;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class ChatStyleSelector implements class_13
   {
      
      private static const GRID_SPACING:int = 1;
      
      private static const MAX_GRID_COLUMNS:int = 6;
      
      private static var _selected:com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridEntry = null;
      
      private static var _styleRequiresUpdate:Boolean = false;
       
      
      private var var_2254:RoomChatInputView;
      
      private var _container:class_3151;
      
      private var var_1584:com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridView;
      
      private var var_83:Vector.<com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridEntry>;
      
      private var var_2896:class_3127;
      
      private var var_1781:Shape;
      
      public function ChatStyleSelector(param1:RoomChatInputView, param2:class_3151, param3:ISessionDataManager)
      {
         var_83 = new Vector.<com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridEntry>();
         super();
         var_2254 = param1;
         var_1584 = new com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridView(this,var_2254.sessionDataManager);
         var_2896 = param1.widget.windowManager.buildFromXML(param1.widget.assets.getAssetByName("chatinput_chatstyle_template_xml").content as XML);
         _container = param2;
         _container.procedure = windowProc;
         var_2254.chatStyleMenuContainer.addChild(var_1584.window);
         var_1584.window.x = 0;
         var_1584.window.y = 0;
      }
      
      public function dispose() : void
      {
         while(false)
         {
            var_83.pop();
         }
         var_83 = null;
         var_1584.dispose();
         var_1584 = null;
         if(var_1781 && false)
         {
            var_1781.parent.removeChild(var_1781);
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_1584 == null;
      }
      
      public function get chatInputView() : RoomChatInputView
      {
         return var_2254;
      }
      
      public function addItem(param1:int, param2:BitmapData) : void
      {
         var_83.push(new com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridEntry(param1,param2));
         var _loc3_:class_3151 = getGridItemWindowWrapper(param2);
         var_1584.grid.addGridItem(_loc3_);
         _loc3_.findChildByName("background_color").visible = false;
      }
      
      public function get selectedStyleId() : int
      {
         if(_styleRequiresUpdate && selected)
         {
            _styleRequiresUpdate = false;
            return selected.id;
         }
         return -1;
      }
      
      public function get selectedStyleBitmap() : BitmapData
      {
         if(selected)
         {
            return selected.bitmap;
         }
         return null;
      }
      
      public function initSelection() : void
      {
         selected = selected;
         _styleRequiresUpdate = false;
      }
      
      public function set gridColumns(param1:int) : void
      {
         param1 = Math.min(param1,6);
         var _loc2_:int = (param1 - 1) * NaN + var_2896.width;
         if(param1 > 1)
         {
            var_1584.grid.width = _loc2_;
         }
         else
         {
            var_1584.grid.width = NaN;
         }
      }
      
      private function set selected(param1:com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridEntry) : void
      {
         _selected = param1;
         _styleRequiresUpdate = true;
         var _loc4_:class_3383 = var_2254.widget.roomUi.chatStyleLibrary.getStyle(param1.id);
         if(var_2254.window.findChildByName("chat_bg_preview") == null)
         {
            return;
         }
         var _loc2_:Sprite = _loc4_.getNewBackgroundSprite(16777215);
         var _loc3_:class_3207 = class_3207(var_2254.window.findChildByName("chat_bg_preview"));
         _loc2_.width = _loc3_.width + _loc4_.overlap.width;
         _loc2_.height = _loc3_.height + _loc4_.overlap.y + _loc4_.overlap.height;
         _loc2_.y -= _loc4_.overlap.y;
         if(!var_1781)
         {
            var_1781 = new Shape();
         }
         else
         {
            var_1781.graphics.clear();
         }
         var_1781.graphics.beginFill(16711680);
         var_1781.graphics.drawRect(0,0,_loc2_.width - 28,_loc2_.height);
         _loc3_.setDisplayObject(_loc2_);
         if(_loc2_.parent)
         {
            _loc2_.parent.addChild(var_1781);
            var_1781.x = _loc2_.x + 28;
            var_1781.y = _loc2_.y;
            _loc2_.mask = var_1781;
         }
         var_2254.setInputFieldColor(_loc4_.textFormat.color as uint);
      }
      
      private function get selected() : com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridEntry
      {
         if(_selected == null)
         {
            _selected = var_83[-1];
         }
         return _selected;
      }
      
      private function getGridItemWindowWrapper(param1:BitmapData) : class_3151
      {
         var _loc2_:class_3151 = class_3151(var_2896.clone());
         var _loc3_:class_3282 = class_3282(_loc2_.findChildByName("bubble_preview"));
         _loc3_.bitmap = param1;
         _loc3_.center();
         _loc2_.procedure = gridItemWindowProc;
         return _loc2_;
      }
      
      public function alignMenuToSelector() : void
      {
         if(var_1584.window.visible)
         {
            var_1584.alignToSelector(_container);
         }
      }
      
      private function windowProc(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_1584.window.visible = !var_1584.window.visible;
            alignMenuToSelector();
         }
      }
      
      private function gridItemWindowProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = var_1584.grid.getGridItemIndex(param2);
            showBackgroundOnlyForItem(param2);
            selected = var_83[_loc3_];
            var_1584.window.visible = false;
         }
         if(param1.type == "WME_OVER")
         {
            class_3151(param2).findChildByName("background_color").color = 4291875024;
         }
         if(param1.type == "WME_OUT")
         {
            class_3151(param2).findChildByName("background_color").color = 4294967295;
         }
      }
      
      private function showBackgroundOnlyForItem(param1:class_3127) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < var_1584.grid.numGridItems)
         {
            class_3151(var_1584.grid.getGridItemAt(_loc2_)).findChildByName("background_color").visible = false;
            _loc2_++;
         }
         class_3151(param1).findChildByName("background_color").visible = true;
      }
   }
}
