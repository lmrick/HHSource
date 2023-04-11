package com.sulake.habbo.ui.widget.uihelpbubbles
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.view.class_3203;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.ui.IRoomDesktop;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetScriptProceedMessage;
   import com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class UiHelpBubblesWidget extends RoomWidgetBase implements ILinkEventTracker
   {
       
      
      private var var_1460:class_20;
      
      private var var_1559:class_24;
      
      private var _toolBar:IHabboToolbar;
      
      private var _friendBar:class_3203;
      
      private var _roomTools:RoomToolsWidget;
      
      private var var_4134:RoomChatInputWidget;
      
      private var var_1897:Array;
      
      private var var_3066:int = 0;
      
      private var _localization:class_18;
      
      public function UiHelpBubblesWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18, param5:class_3203, param6:IHabboToolbar, param7:IRoomDesktop, param8:class_20)
      {
         super(param1,param2,param3,param4);
         var_1460 = param8;
         _friendBar = param5;
         _toolBar = param6;
         var_1559 = new class_24();
         _localization = param4;
         var_1897 = [];
         if(param7)
         {
            _roomTools = param7.getWidget("RWE_ROOM_TOOLS") as RoomToolsWidget;
            var_4134 = param7.getWidget("RWE_CHAT_INPUT_WIDGET") as RoomChatInputWidget;
         }
         (param2 as class_20).context.addLinkEventTracker(this);
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_1559)
         {
            for each(var _loc1_ in var_1559)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_1559.dispose();
            var_1559 = null;
            var_1897 = null;
         }
         super.dispose();
      }
      
      private function checkElementPosition(param1:UiHelpBubble, param2:Boolean = false) : Rectangle
      {
         var _loc9_:Rectangle = null;
         var _loc14_:class_3151 = null;
         var _loc5_:class_3127 = null;
         var _loc8_:Array = null;
         var _loc3_:class_3151 = null;
         var _loc10_:ITextFieldWindow = null;
         var _loc13_:Rectangle = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!param1 || !param1.getWindow())
         {
            return null;
         }
         var _loc11_:String;
         if((_loc11_ = param1.getName()) == "" || !_loc11_)
         {
            return null;
         }
         var _loc15_:int = int(param1.getWindow().height);
         var _loc12_:int = int(param1.getWindow().width);
         var _loc16_:String = "down";
         var _loc17_:* = -1;
         if(toolBar)
         {
            if(_loc5_ = toolBar.getIcon(_loc11_))
            {
               _loc9_ = new Rectangle();
               _loc5_.getGlobalRectangle(_loc9_);
               param1.setCallback(_loc5_);
            }
         }
         if(friendBar)
         {
            if(!_loc9_)
            {
               if(_loc14_ = friendBar.getIconLocation(_loc11_))
               {
                  _loc9_ = new Rectangle();
                  _loc14_.getGlobalRectangle(_loc9_);
                  param1.setCallback(_loc14_ as class_3127);
               }
            }
         }
         if(!_loc9_)
         {
            if(roomTools)
            {
               if(_loc5_ = roomTools.getIconLocation(_loc11_))
               {
                  _loc9_ = new Rectangle();
                  _loc5_.getGlobalRectangle(_loc9_);
                  param1.setCallback(_loc5_);
               }
            }
         }
         if(!_loc9_)
         {
            if(chatInput && _loc11_ == "chat_input")
            {
               if((_loc8_ = chatInput.getChatInputElements()).length > 1)
               {
                  _loc3_ = _loc8_[0] as class_3151;
                  _loc10_ = _loc8_[1] as ITextFieldWindow;
               }
               if(_loc9_ = _loc3_.rectangle)
               {
                  if(param2 && _loc9_)
                  {
                     return _loc9_;
                  }
                  _loc9_.y -= _loc15_ - 40;
                  _loc9_.x += _loc9_.width / 2 - 10;
                  param1.setChatFieldCallback(_loc10_);
                  param1.setArrowPos(_loc16_,_loc17_);
                  return _loc9_;
               }
            }
         }
         if(_loc9_)
         {
            if(param2)
            {
               return _loc9_;
            }
            _loc13_ = _loc9_.clone();
            _loc4_ = 15;
            _loc6_ = int(param1.getWindow().desktop.width);
            if(_loc9_.y - (_loc15_ + _loc4_) < 50)
            {
               _loc4_ = 0;
            }
            _loc16_ = "down";
            _loc17_ = 0;
            _loc9_.x += _loc9_.width / 2;
            _loc9_.y -= _loc15_ + _loc4_;
            if((_loc7_ = _loc9_.right - _loc13_.right) >= _loc12_ / 2)
            {
               _loc7_ = _loc12_ / 2 - 25;
            }
            if(_loc9_.y < _loc15_)
            {
               _loc9_.y += _loc9_.height + _loc15_ + 10;
               _loc16_ = "up";
               if(_loc7_ <= 30)
               {
                  _loc7_ /= 3;
               }
               _loc17_ = _loc7_;
               param1.setArrowPos(_loc16_,_loc17_);
            }
            if(_loc9_.x < _loc12_ / 2)
            {
               _loc9_.x = 10;
               _loc17_ -= _loc12_ / 2 - 30;
               param1.setArrowPos(_loc16_,_loc17_);
               return _loc9_;
            }
            if(_loc9_.x + _loc12_ / 2 > _loc6_)
            {
               _loc9_.x = _loc6_ - _loc12_ / 2;
               _loc17_ = _loc12_ / 4;
               param1.setArrowPos(_loc16_,_loc17_);
               return _loc9_;
            }
            param1.setArrowPos(_loc16_,_loc17_);
         }
         return _loc9_;
      }
      
      public function addNextBubble() : void
      {
         var _loc5_:Point = null;
         if(!var_1897 || false || var_1897.length < var_3066 + 1)
         {
            return;
         }
         var _loc3_:HelpBubbleItem = var_1897[var_3066] as HelpBubbleItem;
         var _loc2_:* = var_1897.length > var_3066 + 1;
         var _loc6_:String = _loc3_.name;
         var _loc4_:UiHelpBubble = new UiHelpBubble(this,_loc3_,_loc2_);
         if(var_1559.hasKey(_loc6_))
         {
            removeHelpBubble(_loc6_);
         }
         var _loc1_:Rectangle = checkElementPosition(_loc4_);
         var_3066++;
         if(_loc1_)
         {
            _loc5_ = new Point(_loc1_.x,_loc1_.y);
         }
         if(_loc5_)
         {
            _loc4_.setPosition(_loc5_);
            _loc4_.getWindow().desktop.addEventListener("WE_RESIZED",onDesktopResized);
            _loc4_.setModal(checkElementPosition(_loc4_,true));
            addHelpBubble(_loc6_,_loc4_);
         }
         else
         {
            _loc4_.dispose();
            addNextBubble();
         }
      }
      
      private function addHelpBubble(param1:String, param2:UiHelpBubble) : void
      {
         if(!var_1559 || !param2)
         {
            return;
         }
         var_1559.add(param1,param2);
      }
      
      public function removeHelpBubble(param1:String) : void
      {
         if(!var_1559)
         {
            return;
         }
         var _loc2_:UiHelpBubble = var_1559.getValue(param1) as UiHelpBubble;
         if(!_loc2_)
         {
            return;
         }
         var_1559.remove(param1);
         _loc2_.dispose();
         addNextBubble();
      }
      
      private function onDesktopResized(param1:class_3134 = null) : void
      {
         var _loc2_:Rectangle = null;
         var _loc4_:Point = null;
         for each(var _loc3_ in var_1559)
         {
            _loc2_ = checkElementPosition(_loc3_);
            if(_loc2_)
            {
               _loc4_ = new Point(_loc2_.x,_loc2_.y);
               _loc3_.setPosition(_loc4_);
               _loc3_.setModal(checkElementPosition(_loc3_,true));
            }
         }
      }
      
      public function sendScriptProceedMessage() : void
      {
         var _loc1_:RoomWidgetMessage = new RoomWidgetScriptProceedMessage("RWPM_ANSWER");
         if(messageListener)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      public function get linkPattern() : String
      {
         return "helpBubble/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc8_:int = 0;
         var _loc3_:HelpBubbleItem = null;
         var _loc7_:int = 0;
         var _loc6_:String = null;
         var _loc4_:* = null;
         if(!var_1559)
         {
            var_1559 = new class_24();
         }
         if(!var_1897)
         {
            var_1897 = [];
         }
         var _loc2_:Array = param1.split("/");
         var _loc5_:int;
         if((_loc5_ = int(_loc2_.length)) < 3)
         {
            return;
         }
         if(_loc2_[1] == "add")
         {
            _loc8_ = 0;
            _loc7_ = 2;
            while(_loc7_ < _loc5_)
            {
               _loc8_++;
               if(_loc8_ == 1)
               {
                  _loc3_ = new HelpBubbleItem();
                  _loc6_ = String(_loc2_[_loc7_]);
                  if(!(_loc4_ = "null"))
                  {
                     _loc4_ = _loc6_;
                  }
                  _loc3_.name = _loc4_;
                  _loc3_.modal = true;
               }
               if(_loc8_ == 2)
               {
                  _loc3_.text = _localization.getLocalization(_loc2_[_loc7_],_loc2_[_loc7_]);
                  _loc8_ = 0;
                  var_1897.push(_loc3_);
               }
               _loc7_++;
            }
            addNextBubble();
         }
         else if(_loc2_[1] == "remove")
         {
            removeHelpBubble(_loc2_[2]);
         }
      }
      
      public function get toolBar() : IHabboToolbar
      {
         return _toolBar;
      }
      
      public function get friendBar() : class_3203
      {
         return _friendBar;
      }
      
      public function get roomTools() : RoomToolsWidget
      {
         return _roomTools;
      }
      
      public function get chatInput() : RoomChatInputWidget
      {
         return var_4134;
      }
   }
}
