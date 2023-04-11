package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.class_3134;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import package_13.class_282;
   import package_171.class_1626;
   import package_96.class_852;
   
   public class RentableBotMenuView extends AvatarContextInfoButtonView
   {
       
      
      protected var var_45:com.sulake.habbo.ui.widget.avatarinfo.class_3361;
      
      public function RentableBotMenuView(param1:AvatarInfoWidget)
      {
         super(param1);
         var_1566 = false;
      }
      
      public static function setup(param1:RentableBotMenuView, param2:int, param3:String, param4:int, param5:int, param6:com.sulake.habbo.ui.widget.avatarinfo.class_3361) : void
      {
         param1.var_45 = param6;
         AvatarContextInfoButtonView.setup(param1,param2,param3,param4,param5,false);
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            _window.removeEventListener("WME_OVER",onMouseHoverEvent);
            _window.removeEventListener("WME_OUT",onMouseHoverEvent);
         }
         var_45 = null;
         super.dispose();
      }
      
      protected function updateButtons() : void
      {
         var _loc6_:int = 0;
         var _loc9_:Array = null;
         var _loc4_:class_3151 = null;
         var _loc10_:int = 0;
         if(!_window || !var_45)
         {
            return;
         }
         var _loc2_:IItemListWindow = _window.findChildByName("buttons") as IItemListWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:class_3151 = _buttons.getListItemByName("link_template") as class_3151;
         var _loc1_:class_3151 = _buttons.getListItemByName("nux_proceed_1") as class_3151;
         _loc2_.procedure = buttonEventProc;
         _loc2_.autoArrangeItems = false;
         var _loc5_:int = _loc2_.numListItems;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_.getListItemAt(_loc6_).visible = false;
            _loc6_++;
         }
         var _loc7_:Boolean = false || false;
         showButton("pick",!var_45.botSkills ? _loc7_ : var_45.botSkills.indexOf(12) == -1 && _loc7_);
         if(false)
         {
            showButton("donate_to_all",var_45.botSkills.indexOf(25) != -1);
            showButton("donate_to_user",var_45.botSkills.indexOf(24) != -1);
            if(false)
            {
               showButton("change_bot_name",var_45.botSkills.indexOf(5) != -1);
               showButton("dress_up",var_45.botSkills.indexOf(1) != -1);
               showButton("random_walk",var_45.botSkills.indexOf(3) != -1);
               showButton("setup_chat",var_45.botSkills.indexOf(2) != -1);
               showButton("dance",var_45.botSkills.indexOf(4) != -1);
            }
            showButton("nux_take_tour",var_45.botSkills.indexOf(10) != -1);
         }
         for each(var _loc8_ in var_45.botSkillsWithCommands)
         {
            if(_loc8_.id == 7)
            {
               _loc4_ = _loc3_.clone() as class_3151;
               if((_loc9_ = _loc8_.data.split(",")).length == 2)
               {
                  _loc4_.findChildByName("label").caption = _loc9_[0];
                  _loc4_.name = ":link " + _loc9_[1];
                  _loc4_.visible = true;
                  _loc2_.addListItem(_loc4_);
               }
            }
            if(_loc8_.id == 8)
            {
               if(_loc8_.data == "")
               {
                  showButton("nux_proceed_1",true);
               }
               else if((_loc9_ = _loc8_.data.split(",")).length == 2)
               {
                  if((_loc10_ = parseInt(_loc9_[1])) == 1)
                  {
                     showButton("nux_proceed_1",true);
                     class_3151(_loc2_.getListItemByName("nux_proceed_1")).findChildByName("label").caption = _loc9_[0];
                  }
                  else
                  {
                     (_loc4_ = _loc1_.clone() as class_3151).visible = true;
                     _loc4_.name = "nux_proceed_" + _loc10_;
                     _loc4_.findChildByName("label").caption = _loc9_[0];
                     _loc2_.addListItemAt(_loc4_,_loc2_.getListItemIndex(_loc2_.getListItemByName("nux_proceed_1")) + _loc10_ - 1);
                  }
               }
            }
            if(_loc8_.id == 14)
            {
               _loc4_ = _loc3_.clone() as class_3151;
               if((_loc9_ = _loc8_.data.split(",")).length == 2)
               {
                  _loc4_.findChildByName("label").caption = _loc9_[0];
                  _loc4_.name = ":link navigator/search/" + _loc9_[1];
                  _loc4_.visible = true;
                  _loc2_.addListItem(_loc4_);
               }
            }
         }
         _loc2_.autoArrangeItems = true;
         _loc2_.visible = true;
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:XML = null;
         if(!var_1429 || true || true)
         {
            return;
         }
         if(var_1726)
         {
            activeView = getMinimizedView();
         }
         else
         {
            if(!_window)
            {
               _loc1_ = XmlAsset(var_1429.assets.getAssetByName("avatar_menu_widget")).content as XML;
               _window = var_1429.windowManager.buildFromXML(_loc1_,0) as class_3151;
               if(!_window)
               {
                  return;
               }
               _window.addEventListener("WME_OVER",onMouseHoverEvent);
               _window.addEventListener("WME_OUT",onMouseHoverEvent);
               _window.findChildByName("minimize").addEventListener("WME_CLICK",onMinimize);
               _window.findChildByName("minimize").addEventListener("WME_OVER",onMinimizeHover);
               _window.findChildByName("minimize").addEventListener("WME_OUT",onMinimizeHover);
            }
            _buttons = _window.findChildByName("buttons") as IItemListWindow;
            _buttons.procedure = buttonEventProc;
            _window.findChildByName("name").caption = _userName;
            _window.visible = false;
            activeView = _window;
            updateButtons();
         }
      }
      
      override protected function buttonEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:Point = null;
         var _loc5_:Rectangle = null;
         var _loc7_:String = null;
         var _loc6_:String = null;
         if(disposed)
         {
            return;
         }
         if(!_window || false)
         {
            return;
         }
         var _loc3_:Boolean = false;
         if(param1.type == "WME_CLICK")
         {
            if(param2.name == "button")
            {
               _loc5_ = null;
               switch(param2.parent.name)
               {
                  case "pick":
                     _loc3_ = true;
                     widget.handler.container.connection.send(new class_282(var_45.id));
                     break;
                  case "setup_chat":
                     _loc3_ = true;
                     _loc5_ = new Rectangle();
                     _window.getGlobalRectangle(_loc5_);
                     _loc4_ = new Point(_loc5_.x + _loc5_.width / 2,_loc5_.y + _loc5_.height);
                     widget.openBotSkillConfigurationView(var_45.id,2,_loc4_);
                     break;
                  case "random_walk":
                     _loc3_ = true;
                     widget.handler.container.connection.send(new class_852(var_45.id,3,""));
                     break;
                  case "dress_up":
                     _loc3_ = true;
                     widget.handler.container.connection.send(new class_852(var_45.id,1,""));
                     break;
                  case "dance":
                     _loc3_ = true;
                     widget.handler.container.connection.send(new class_852(var_45.id,4,""));
                     break;
                  case "donate_to_all":
                     _loc3_ = true;
                     widget.handler.container.connection.send(new class_852(var_45.id,25,""));
                     break;
                  case "donate_to_user":
                     _loc3_ = true;
                     widget.handler.container.connection.send(new class_852(var_45.id,24,""));
                     break;
                  case "nux_take_tour":
                     _loc3_ = true;
                     widget.component.context.createLinkEvent("help/tour");
                     widget.handler.container.connection.send(new class_852(var_45.id,10,""));
                     break;
                  case "change_bot_name":
                     _loc3_ = true;
                     _loc5_ = new Rectangle();
                     _window.getGlobalRectangle(_loc5_);
                     _loc4_ = new Point(_loc5_.x + _loc5_.width / 2,_loc5_.y + _loc5_.height);
                     widget.openBotSkillConfigurationView(var_45.id,5,_loc4_);
               }
               if(param2.parent.name.indexOf(":link ") != -1)
               {
                  _loc7_ = param2.parent.name.substr(6,param2.parent.name.length - 6);
                  widget.component.context.createLinkEvent(_loc7_);
                  _loc3_ = true;
               }
               if(param2.parent.name.indexOf("nux_proceed_") != -1)
               {
                  _loc6_ = param2.parent.name.substr(12,param2.parent.name.length - 12);
                  widget.handler.container.connection.send(new class_852(var_45.id,8,_loc6_));
                  _loc3_ = true;
               }
            }
            updateButtons();
         }
         else
         {
            super.buttonEventProc(param1,param2);
         }
         if(_loc3_)
         {
            var_1429.removeView(this,false);
         }
      }
      
      private function get widget() : AvatarInfoWidget
      {
         return var_1429 as AvatarInfoWidget;
      }
   }
}
