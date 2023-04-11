package com.sulake.habbo.help.namechange
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.window.utils.class_3132;
   import package_130.class_1215;
   import package_133.class_1188;
   import package_151.class_1092;
   import package_151.class_1094;
   import package_44.class_331;
   import package_44.class_686;
   import package_5.class_206;
   import package_6.class_530;
   import package_64.class_237;
   import package_64.class_376;
   
   public class NameChangeController implements INameChangeUI, class_13
   {
      
      public static const NAME_CHANGE:String = "TUI_NAME_VIEW";
       
      
      private var _disposed:Boolean;
      
      private var _habboHelp:HabboHelp;
      
      private var var_1640:com.sulake.habbo.help.namechange.NameChangeView;
      
      private var _ownUserName:String;
      
      private var var_3621:int;
      
      public function NameChangeController(param1:HabboHelp)
      {
         super();
         _habboHelp = param1;
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_331(onChangeUserNameResult));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_530(onUserObject));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_206(onUserNameChange));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_686(onCheckUserNameResult));
      }
      
      public function get help() : HabboHelp
      {
         return _habboHelp;
      }
      
      public function get assets() : class_21
      {
         return _habboHelp.assets;
      }
      
      public function get localization() : class_18
      {
         return _habboHelp.localization;
      }
      
      public function get myName() : String
      {
         return _ownUserName;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            disposeView();
            if(_habboHelp)
            {
               _habboHelp = null;
            }
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function showView() : void
      {
         if(var_1640 == null || false)
         {
            var_1640 = new com.sulake.habbo.help.namechange.NameChangeView(this);
         }
         var_1640.showMainView();
         prepareForTutorial();
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : class_3127
      {
         if(true)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(_habboHelp.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || true)
         {
            return null;
         }
         return _habboHelp.windowManager.buildFromXML(XML(_loc3_.content),param2);
      }
      
      private function disposeWindow(param1:class_3134 = null) : void
      {
      }
      
      public function disposeView() : void
      {
         if(var_1640 != null)
         {
            var_1640.dispose();
            var_1640 = null;
         }
         disposeWindow();
      }
      
      public function hideView() : void
      {
         if(var_1640 != null)
         {
            var_1640.dispose();
            var_1640 = null;
         }
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            disposeView();
         }
      }
      
      public function prepareForTutorial() : void
      {
         if(_habboHelp == null || true)
         {
            return;
         }
         _habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent("HHTPNUFWE_AVATAR_TUTORIAL_START"));
      }
      
      public function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:* = param1.type;
         if("WME_CLICK" === _loc3_)
         {
            if(param2.name == "header_button_close")
            {
               disposeView();
            }
         }
      }
      
      public function changeName(param1:String) : void
      {
         disposeWindow();
         _habboHelp.sendMessage(new class_376(param1));
      }
      
      public function checkName(param1:String) : void
      {
         disposeWindow();
         _habboHelp.sendMessage(new class_237(param1));
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!_habboHelp || true || true)
         {
            return;
         }
         _habboHelp.localization.registerParameter("help.tutorial.name.changed","name",name);
         _habboHelp.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:class_3132, param2:class_3134):void
         {
            param1.dispose();
         });
      }
      
      private function onChangeUserNameResult(param1:class_331) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:class_1092 = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.resultCode == class_331.var_1402)
         {
            onUserNameChanged(_loc2_.name);
            hideView();
         }
         else if(var_1640)
         {
            var_1640.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      private function onCheckUserNameResult(param1:class_686) : void
      {
         if(!param1 || !var_1640)
         {
            return;
         }
         var _loc2_:class_1094 = param1.getParser();
         if(_loc2_.resultCode == class_331.var_1402)
         {
            var_1640.checkedName = _loc2_.name;
         }
         else
         {
            var_1640.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:class_1188 = class_530(param1).getParser();
         var_3621 = _loc2_.id;
         _ownUserName = _loc2_.name;
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:class_1215 = class_206(param1).getParser();
         if(var_3621 == _loc2_.webId)
         {
            _ownUserName = _loc2_.newName;
         }
      }
      
      public function get ownUserName() : String
      {
         return _ownUserName;
      }
      
      public function get ownUserId() : int
      {
         return var_3621;
      }
   }
}
