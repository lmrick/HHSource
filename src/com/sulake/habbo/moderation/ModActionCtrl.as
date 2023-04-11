package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.StringUtil;
   import com.sulake.habbo.window.utils.class_3132;
   import package_137.class_1612;
   import package_36.class_1634;
   import package_36.class_1671;
   import package_59.class_1023;
   import package_59.class_224;
   import package_59.class_253;
   import package_59.class_280;
   import package_59.class_352;
   import package_59.class_375;
   import package_59.class_870;
   
   public class ModActionCtrl implements class_13, ITrackedWindow
   {
      
      private static var var_1628:Array;
      
      private static var var_3089:class_24;
       
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var var_1873:int;
      
      private var _targetUserName:String;
      
      private var var_3425:class_1612;
      
      private var _frame:class_3281;
      
      private var _topicDropdown:class_3287;
      
      private var var_3035:Array;
      
      private var _actionTypeDropdown:class_3287;
      
      private var var_1935:ITextFieldWindow;
      
      private var _disposed:Boolean;
      
      private var var_2642:com.sulake.habbo.moderation.UserInfoCtrl;
      
      public function ModActionCtrl(param1:com.sulake.habbo.moderation.ModerationManager, param2:int, param3:String, param4:class_1612, param5:com.sulake.habbo.moderation.UserInfoCtrl)
      {
         super();
         _main = param1;
         var_1873 = param2;
         _targetUserName = param3;
         var_3425 = param4;
         var_2642 = param5;
         if(var_1628 == null)
         {
            var_1628 = [];
            var_1628.push(new ModActionDefinition(1,"Alert",1,1,0));
            var_1628.push(new ModActionDefinition(2,"Mute 1h",2,2,0));
            var_1628.push(new ModActionDefinition(3,"Ban 18h",3,3,0));
            var_1628.push(new ModActionDefinition(4,"Ban 7 days",3,4,0));
            var_1628.push(new ModActionDefinition(5,"Ban 30 days (step 1)",3,5,0));
            var_1628.push(new ModActionDefinition(7,"Ban 30 days (step 2)",3,7,0));
            var_1628.push(new ModActionDefinition(6,"Ban 100 years",3,6,0));
            var_1628.push(new ModActionDefinition(106,"Ban avatar-only 100 years",3,6,0));
            var_1628.push(new ModActionDefinition(101,"Kick",4,0,0));
            var_1628.push(new ModActionDefinition(102,"Lock trade 1 week",5,0,168));
            var_1628.push(new ModActionDefinition(104,"Lock trade permanent",5,0,876000));
            var_1628.push(new ModActionDefinition(105,"Message",6,0,0));
         }
         _main.issueManager.addModActionView(var_1873,this);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function show() : void
      {
         _frame = class_3281(_main.getXmlWindow("modact_summary"));
         _frame.caption = "Mod action on: " + _targetUserName;
         _frame.findChildByName("custom_sanction_button").procedure = onCustomSanctionButton;
         var_1935 = ITextFieldWindow(_frame.findChildByName("message_input"));
         _frame.findChildByName("default_sanction_button").procedure = onDefaultSanctionButton;
         _frame.findChildByName("default_sanction_button").disable();
         initializeTopicToSanctionTypeMapping();
         initializeTopicDropdown();
         initializeActionTypeDropdown();
         var _loc1_:class_3127 = _frame.findChildByTag("close");
         _loc1_.procedure = onClose;
         _frame.visible = true;
      }
      
      public function getType() : int
      {
         return 7;
      }
      
      public function getId() : String
      {
         return _targetUserName;
      }
      
      public function getFrame() : class_3281
      {
         return _frame;
      }
      
      private function logEvent(param1:String, param2:String = "") : void
      {
         if(var_2642 != null)
         {
            var_2642.logEvent(param1,param2);
         }
      }
      
      private function trackAction(param1:String) : void
      {
         if(var_2642 != null && true)
         {
            var_2642.trackAction("modAction_" + param1);
         }
      }
      
      private function initializeTopicToSanctionTypeMapping() : void
      {
         var _loc2_:String = null;
         var _loc6_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         if(var_3089 == null)
         {
            var_3089 = new class_24();
            _loc2_ = _main.getProperty("cfh.topic_id.to.sanction_type_id");
            if(_loc2_ != null)
            {
               _loc6_ = _loc2_.split(",");
               _loc3_ = 0;
               while(_loc3_ < _loc6_.length)
               {
                  if((_loc4_ = _loc6_[_loc3_].split("=")).length == 2)
                  {
                     _loc1_ = parseInt(String(_loc4_[0]));
                     _loc5_ = parseInt(String(_loc4_[1]));
                     var_3089.add(_loc1_,_loc5_);
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      private function initializeTopicDropdown() : void
      {
         _topicDropdown = class_3287(_frame.findChildByName("cfh_topics"));
         _topicDropdown.addEventListener("WE_SELECTED",refreshSanctionDataForSelectedTopic);
         var_3035 = [];
         var _loc1_:* = [];
         var _loc2_:int = 0;
         for each(var _loc4_ in _main.issueManager.getCfhTopics())
         {
            for each(var _loc3_ in _loc4_.topics)
            {
               _loc1_[_loc2_] = "${help.cfh.topic." + _loc3_.id + "}";
               var_3035[_loc2_] = _loc3_.id;
               _loc2_++;
            }
         }
         _topicDropdown.populate(_loc1_);
      }
      
      private function refreshSanctionDataForSelectedTopic(param1:class_3134) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = var_3089.getValue(_loc2_);
         if(!_loc3_)
         {
            _loc3_ = var_3089.getValue(0);
         }
         if(_loc3_)
         {
            _loc4_ = 0;
            while(_loc4_ < var_1628.length)
            {
               if(var_1628[_loc4_].actionId == _loc3_)
               {
                  _actionTypeDropdown.selection = _loc4_;
                  break;
               }
               _loc4_++;
            }
         }
         else
         {
            _actionTypeDropdown.selection = -1;
         }
         _main.issueManager.requestSanctionDataForAccount(var_1873,_loc2_);
      }
      
      public function showDefaultSanction(param1:int, param2:String) : void
      {
         if(_frame == null || param1 != var_1873)
         {
            return;
         }
         var _loc3_:ITextWindow = _frame.findChildByName("default_sanction_label") as ITextWindow;
         if(_loc3_ != null)
         {
            _loc3_.caption = param2;
         }
         _frame.findChildByName("default_sanction_button").enable();
      }
      
      private function initializeActionTypeDropdown() : void
      {
         _actionTypeDropdown = class_3287(_frame.findChildByName("sanction_type"));
         var _loc1_:* = [];
         for each(var _loc2_ in var_1628)
         {
            _loc1_.push(_loc2_.name);
         }
         _actionTypeDropdown.populate(_loc1_);
      }
      
      private function onDefaultSanctionButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(false)
         {
            _main.windowManager.alert("Alert","Please select a topic.",0,onAlertClose);
            return;
         }
         class_14.log("Giving default sanction...");
         trackAction("defaultAction");
         logEvent("action.default");
         var _loc3_:int = 0;
         _main.connection.send(new class_352(var_1873,_loc3_,var_1935.text,getIssueId()));
         dispose();
      }
      
      private function onCustomSanctionButton(param1:class_3134, param2:class_3127) : void
      {
         var _loc6_:* = false;
         var _loc3_:int = 0;
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(false)
         {
            _main.windowManager.alert("Alert","Please select a topic.",0,onAlertClose);
            return;
         }
         if(false)
         {
            _main.windowManager.alert("Alert","Please select a sanction.",0,onAlertClose);
            return;
         }
         var _loc4_:int = 0;
         var _loc5_:ModActionDefinition;
         switch((_loc5_ = var_1628[_actionTypeDropdown.selection]).actionType - 1)
         {
            case 0:
               if(!_main.initMsg.alertPermission)
               {
                  _main.windowManager.alert("Alert","You have insufficient permissions.",0,onAlertClose);
                  return;
               }
               trackAction("sendCaution");
               _main.connection.send(new class_870(var_1873,var_1935.text,_loc4_,getIssueId()));
               break;
            case 1:
               trackAction("mute");
               _main.connection.send(new class_280(var_1873,var_1935.text,_loc4_,getIssueId()));
               break;
            case 2:
               if(!_main.initMsg.banPermission)
               {
                  _main.windowManager.alert("Alert","You have insufficient permissions.",0,onAlertClose);
                  return;
               }
               trackAction("ban");
               _loc6_ = _loc5_.actionId == 106;
               _main.connection.send(new class_253(var_1873,var_1935.text,_loc4_,_loc5_.sanctionTypeId,_loc6_,getIssueId()));
               break;
            case 3:
               if(!_main.initMsg.kickPermission)
               {
                  _main.windowManager.alert("Alert","You have insufficient permissions.",0,onAlertClose);
                  return;
               }
               trackAction("kick");
               _main.connection.send(new class_1023(var_1873,var_1935.text,_loc4_,getIssueId()));
               break;
            case 4:
               trackAction("trading_lock");
               _loc3_ = _loc5_.actionLengthHours * 60;
               _main.connection.send(new class_375(var_1873,var_1935.text,_loc3_,_loc4_,getIssueId()));
               break;
            case 5:
               if(StringUtil.isEmpty(var_1935.text))
               {
                  _main.windowManager.alert("Alert","Please write a message to user.",0,onAlertClose);
                  return;
               }
               trackAction("sendCaution");
               _main.connection.send(new class_224(var_1873,var_1935.text,_loc4_,getIssueId()));
               break;
         }
         logEvent("action.custom","unknown");
         dispose();
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         trackAction("close");
         dispose();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(_frame != null)
         {
            _frame.destroy();
            _frame = null;
         }
         _topicDropdown = null;
         var_1935 = null;
         _main.issueManager.removeModActionView(var_1873);
         _main = null;
      }
      
      private function onAlertClose(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
      
      private function getIssueId() : int
      {
         return var_3425 != null ? var_3425.issueId : -1;
      }
   }
}
