package com.sulake.habbo.ui.widget.avatarinfo.botskills
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import package_38.class_1022;
   import package_96.class_398;
   
   public class BotSkillConfigurationViewBase implements class_3316
   {
       
      
      private var var_2453:IMessageEvent;
      
      protected var var_1429:AvatarInfoWidget;
      
      protected var _window:class_3151;
      
      protected var var_341:int;
      
      public function BotSkillConfigurationViewBase(param1:AvatarInfoWidget)
      {
         super();
         var_1429 = param1;
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_1429)
         {
            if(var_1429.handler.container.connection && var_2453)
            {
               var_1429.handler.container.connection.removeMessageEvent(var_2453);
               var_2453 = null;
            }
            var_1429 = null;
         }
         var_341 = -1;
      }
      
      public function get disposed() : Boolean
      {
         return var_1429 == null;
      }
      
      public function open(param1:int, param2:Point = null) : void
      {
         var _loc3_:XML = null;
         var _loc4_:Rectangle = null;
         var_341 = param1;
         if(!var_2453)
         {
            var_2453 = new class_1022(onBotCommandConfigurationEvent);
            var_1429.handler.container.connection.addMessageEvent(var_2453);
         }
         var_1429.handler.container.connection.send(new class_398(var_341,skillType));
         if(!_window)
         {
            _loc3_ = var_1429.assets.getAssetByName(windowAssetName).content as XML;
            _window = var_1429.windowManager.buildFromXML(_loc3_,1) as class_3151;
         }
         if(param2)
         {
            _loc4_ = _window.rectangle;
            _window.x = param2.x - _loc4_.width / 2;
            _window.y = param2.y - _loc4_.height;
         }
         fitToScreen();
         _window.visible = true;
         deactivateInputs();
      }
      
      public function close() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function parseConfiguration(param1:String) : void
      {
      }
      
      protected function deactivateInputs() : void
      {
      }
      
      protected function get windowAssetName() : String
      {
         return "";
      }
      
      protected function get skillType() : int
      {
         return -1;
      }
      
      private function onBotCommandConfigurationEvent(param1:class_1022) : void
      {
         if(param1.getParser().botId == var_341 && param1.getParser().commandId == skillType)
         {
            parseConfiguration(param1.getParser().data);
         }
      }
      
      private function fitToScreen() : void
      {
         var _loc1_:Rectangle = new Rectangle();
         _window.getGlobalRectangle(_loc1_);
         if(_loc1_.top < 0)
         {
            _window.y += -_loc1_.top;
         }
         if(_loc1_.left < 0)
         {
            _window.x += -_loc1_.left;
         }
         if(_loc1_.right > _window.desktop.width)
         {
            _window.x = 0 - (_loc1_.right - _window.desktop.width);
         }
         if(_loc1_.bottom > _window.desktop.height)
         {
            _window.y = 0 - (_loc1_.bottom - _window.desktop.height);
         }
      }
   }
}
