package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.utils.class_3132;
   import package_50.class_1637;
   import package_50.class_1655;
   import package_59.class_636;
   import package_59.class_694;
   import package_59.class_779;
   import package_59.class_858;
   
   public class RoomToolCtrl implements class_13, ITrackedWindow
   {
       
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var _flatId:int;
      
      private var var_45:class_1637;
      
      private var _frame:class_3281;
      
      private var var_19:IItemListWindow;
      
      private var _disposed:Boolean;
      
      private var var_2699:class_3287;
      
      private var var_1935:ITextFieldWindow;
      
      private var _includeInfo:Boolean = true;
      
      private var var_2607:class_3176;
      
      private var var_2972:class_3176;
      
      private var var_3167:class_3176;
      
      private var var_3692:class_3151;
      
      public function RoomToolCtrl(param1:com.sulake.habbo.moderation.ModerationManager, param2:int)
      {
         super();
         _main = param1;
         _flatId = param2;
      }
      
      public static function getLowestPoint(param1:class_3151) : int
      {
         var _loc2_:int = 0;
         var _loc4_:class_3127 = null;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.numChildren)
         {
            if((_loc4_ = param1.getChildAt(_loc2_)).visible)
            {
               _loc3_ = Math.max(_loc3_,_loc4_.y + _loc4_.height);
            }
            _loc2_++;
         }
         return _loc3_;
      }
      
      public static function moveChildrenToColumn(param1:class_3151, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:class_3127 = null;
         _loc4_ = 0;
         while(_loc4_ < param1.numChildren)
         {
            if((_loc5_ = param1.getChildAt(_loc4_)) != null && _loc5_.visible && _loc5_.height > 0)
            {
               _loc5_.y = param2;
               param2 += _loc5_.height + param3;
            }
            _loc4_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function show() : void
      {
         _frame = class_3281(_main.getXmlWindow("roomtool_frame"));
         var _loc1_:IItemListWindow = _frame.findChildByName("list_cont") as IItemListWindow;
         var _loc2_:class_3151 = _loc1_.getListItemByName("room_cont") as class_3151;
         var_3692 = _loc2_.findChildByName("room_data") as class_3151;
         _loc2_.removeChild(var_3692);
         _main.messageHandler.addRoomInfoListener(this);
         _main.connection.send(new class_636(_flatId));
         class_14.log("BEGINNING TO SHOW: " + _flatId);
      }
      
      public function getType() : int
      {
         return 9;
      }
      
      public function getId() : String
      {
         return "" + _flatId;
      }
      
      public function getFrame() : class_3281
      {
         return _frame;
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         dispose();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         _main.messageHandler.removeRoomEnterListener(this);
         if(_frame != null)
         {
            _frame.destroy();
            _frame = null;
         }
         if(var_45 != null)
         {
            var_45.dispose();
            var_45 = null;
         }
         _main = null;
         var_19 = null;
         var_2699 = null;
         var_1935 = null;
         var_2607 = null;
         var_2972 = null;
         var_3167 = null;
      }
      
      public function onRoomChange() : void
      {
         setSendButtonState("send_caution_but");
         setSendButtonState("send_message_but");
      }
      
      private function setSendButtonState(param1:String) : void
      {
         var _loc3_:Boolean = var_45 != null && true;
         var _loc2_:class_3140 = class_3140(_frame.findChildByName(param1));
         if(_loc3_ && _main.initMsg.roomAlertPermission)
         {
            _loc2_.enable();
         }
         else
         {
            _loc2_.disable();
         }
      }
      
      public function onRoomInfo(param1:class_1637) : void
      {
         if(_disposed)
         {
            return;
         }
         class_14.log("GOT ROOM INFO: " + param1.flatId + ", " + _flatId);
         if(param1.flatId != _flatId)
         {
            class_14.log("NOT THE SAME FLAT: " + param1.flatId + ", " + _flatId);
            return;
         }
         var_45 = param1;
         populate();
         _main.messageHandler.removeRoomInfoListener(this);
         _frame.visible = true;
         _main.messageHandler.addRoomEnterListener(this);
      }
      
      public function populate() : void
      {
         var_19 = IItemListWindow(_frame.findChildByName("list_cont"));
         var _loc1_:class_3127 = _frame.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_1935 = ITextFieldWindow(_frame.findChildByName("message_input"));
         var_1935.procedure = onInputClick;
         var_2699 = class_3287(_frame.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_2699);
         var_2699.procedure = onSelectTemplate;
         var_2607 = class_3176(_frame.findChildByName("kick_check"));
         var_2972 = class_3176(_frame.findChildByName("lock_check"));
         var_3167 = class_3176(_frame.findChildByName("changename_check"));
         refreshRoomData(var_45.room,"room_cont");
         setTxt("owner_name_txt",var_45.ownerName);
         setTxt("owner_in_room_txt",var_45.ownerInRoom ? "Yes" : "No");
         setTxt("user_count_txt","undefined");
         _frame.findChildByName("enter_room_but").procedure = onEnterRoom;
         _frame.findChildByName("chatlog_but").procedure = onChatlog;
         _frame.findChildByName("edit_in_hk_but").procedure = onEditInHk;
         _frame.findChildByName("send_caution_but").procedure = onSendCaution;
         _frame.findChildByName("send_message_but").procedure = onSendMessage;
         if(!_main.initMsg.roomKickPermission)
         {
            var_2607.disable();
         }
         _frame.findChildByName("owner_name_txt").procedure = onOwnerName;
         this.onRoomChange();
      }
      
      private function disposeItemFromList(param1:IItemListWindow, param2:class_3127) : void
      {
         var _loc3_:class_3127 = param1.removeListItem(param2);
         if(_loc3_ != null)
         {
            _loc3_.dispose();
         }
      }
      
      private function refreshRoomData(param1:class_1655, param2:String) : void
      {
         var _loc6_:class_3151 = class_3151(var_19.getListItemByName(param2));
         var _loc7_:class_3151;
         if((_loc7_ = class_3151(_loc6_.findChildByName("room_data"))) == null)
         {
            _loc7_ = _loc6_.addChild(var_3692.clone()) as class_3151;
         }
         if(!param1.exists)
         {
            disposeItemFromList(var_19,_loc6_);
            disposeItemFromList(var_19,var_19.getListItemByName("event_spacing"));
            return;
         }
         var _loc4_:ITextWindow;
         (_loc4_ = ITextWindow(_loc7_.findChildByName("name"))).caption = param1.name;
         _loc4_.height = _loc4_.textHeight + 5;
         var _loc3_:ITextWindow = ITextWindow(_loc7_.findChildByName("desc"));
         _loc3_.caption = param1.desc;
         _loc3_.height = _loc3_.textHeight + 5;
         var _loc5_:class_3151 = class_3151(_loc7_.findChildByName("tags_cont"));
         var _loc8_:ITextWindow;
         (_loc8_ = ITextWindow(_loc5_.findChildByName("tags_txt"))).caption = getTagsAsString(param1.tags);
         _loc8_.height = _loc8_.textHeight + 5;
         _loc5_.height = _loc8_.height;
         if(param1.tags.length < 1)
         {
            _loc7_.removeChild(_loc5_);
         }
         moveChildrenToColumn(_loc7_,_loc4_.y,0);
         _loc7_.height = getLowestPoint(_loc7_);
         _loc6_.height = _loc7_.height + 2 * _loc7_.y;
         class_14.log("XXXX: " + _loc6_.height + ", " + _loc7_.height + ", " + _loc4_.height + ", " + _loc3_.height + ", " + _loc5_.height + ", " + _loc8_.height);
      }
      
      private function getTagsAsString(param1:Array) : String
      {
         var _loc3_:* = null;
         var _loc2_:* = "";
         for each(_loc3_ in param1)
         {
            if(_loc2_ == "")
            {
               _loc2_ = _loc3_;
            }
            else
            {
               _loc2_ = _loc2_ + ", " + _loc3_;
            }
         }
         return _loc2_;
      }
      
      private function setTxt(param1:String, param2:String) : void
      {
         var _loc3_:ITextWindow = ITextWindow(_frame.findChildByName(param1));
         _loc3_.text = param2;
      }
      
      private function onOwnerName(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _main.windowTracker.show(new UserInfoFrameCtrl(_main,var_45.ownerId),_frame,false,false,true);
      }
      
      private function onEnterRoom(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         class_14.log("Enter room clicked");
         _main.goToRoom(var_45.flatId);
      }
      
      private function onChatlog(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _main.windowTracker.show(new ChatlogCtrl(new class_694(0,var_45.flatId),_main,4,var_45.flatId),_frame,false,false,true);
      }
      
      private function onEditInHk(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         class_14.log("Edit in hk clicked");
         _main.openHkPage("roomadmin.url","undefined");
      }
      
      private function onSendCaution(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         class_14.log("Sending caution...");
         act(true);
      }
      
      private function onSendMessage(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         class_14.log("Sending message...");
         act(false);
      }
      
      private function act(param1:Boolean) : void
      {
         if(_includeInfo || false)
         {
            _main.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         var _loc2_:int = determineAction(param1,var_2607.isSelected);
         _main.connection.send(new class_779(_loc2_,var_1935.text,""));
         if(false || false || false)
         {
            _main.connection.send(new class_858(var_45.flatId,var_2972.isSelected,var_3167.isSelected,var_2607.isSelected));
         }
         this.dispose();
      }
      
      private function determineAction(param1:Boolean, param2:Boolean) : int
      {
         if(param2)
         {
            return param1 ? 1 : 4;
         }
         return param1 ? 0 : 3;
      }
      
      private function onInputClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_FOCUSED")
         {
            return;
         }
         if(!_includeInfo)
         {
            return;
         }
         var_1935.text = "";
         _includeInfo = false;
      }
      
      private function onAlertClose(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
      
      private function prepareMsgSelect(param1:class_3287) : void
      {
         class_14.log("MSG TEMPLATES: " + _main.initMsg.roomMessageTemplates.length);
         param1.populate(_main.initMsg.roomMessageTemplates);
      }
      
      private function onSelectTemplate(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_SELECTED")
         {
            return;
         }
         var _loc3_:String = String(_main.initMsg.roomMessageTemplates[var_2699.selection]);
         if(_loc3_ != null)
         {
            _includeInfo = false;
            var_1935.text = _loc3_;
         }
      }
   }
}
