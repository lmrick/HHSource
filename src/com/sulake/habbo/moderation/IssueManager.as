package com.sulake.habbo.moderation
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.utils.StringUtil;
   import flash.events.Event;
   import flash.utils.Timer;
   import package_137.class_1612;
   import package_36.class_1632;
   import package_36.class_1634;
   import package_59.class_334;
   import package_59.class_478;
   import package_59.class_737;
   import package_59.class_787;
   import package_59.class_999;
   
   public class IssueManager
   {
      
      public static const const_547:String = "issue_bundle_open";
      
      public static const BUNDLE_MY:String = "issue_bundle_my";
      
      public static const const_910:String = "issue_bundle_picked";
      
      public static const PRIORITY_UPDATE_INTERVAL_MS:int = 15000;
      
      public static const RESOLUTION_USELESS:int = 1;
      
      public static const RESOLUTION_RESOLVED:int = 3;
       
      
      private var _moderationManager:com.sulake.habbo.moderation.ModerationManager;
      
      private var var_2256:com.sulake.habbo.moderation.IssueBrowser;
      
      private var var_249:class_24;
      
      private var var_1543:class_24;
      
      private var var_2713:class_24;
      
      private var var_2382:Array;
      
      private var var_2744:Array;
      
      private var _issueHandlers:class_24;
      
      private var var_3267:class_24;
      
      private var var_4159:int = 1;
      
      private var var_4282:int;
      
      private var var_3540:Timer;
      
      private var var_3336:int;
      
      private var var_557:int;
      
      private var var_473:int;
      
      private var _windowWidth:int;
      
      private var var_352:int;
      
      private var var_3830:Vector.<class_1634>;
      
      public function IssueManager(param1:com.sulake.habbo.moderation.ModerationManager)
      {
         super();
         _moderationManager = param1;
         var_249 = new class_24();
         var_1543 = new class_24();
         var_2713 = new class_24();
         var_2256 = new com.sulake.habbo.moderation.IssueBrowser(this,_moderationManager.windowManager,_moderationManager.assets);
         var_2382 = [];
         var_2744 = [];
         _issueHandlers = new class_24();
         var_3267 = new class_24();
         var_4282 = _moderationManager.getInteger("chf.score.updatefactor",60);
         var_3336 = _moderationManager.getInteger("max.call_for_help.results",200);
         var_3540 = new Timer(15000,0);
         var_3540.addEventListener("timer",updateIssueBrowser);
         var_3540.start();
      }
      
      public function get issueListLimit() : int
      {
         return var_3336;
      }
      
      public function init() : void
      {
         var_2256.show();
      }
      
      public function pickBundle(param1:int, param2:String, param3:Boolean = false, param4:int = 0) : void
      {
         var _loc5_:IssueBundle;
         if((_loc5_ = var_1543.getValue(param1) as IssueBundle) == null)
         {
            return;
         }
         sendPick(_loc5_.getIssueIds(),param3,param4,param2);
         var_2382 = var_2382.concat(_loc5_.getIssueIds());
      }
      
      public function autoPick(param1:String, param2:Boolean = false, param3:int = 0) : void
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc5_:Array = var_1543.getValues();
         for each(_loc6_ in _loc5_)
         {
            if(_loc6_.state == 1 && (_loc4_ == null || isBundleHigherPriorityOrOlder(_loc6_,_loc4_)))
            {
               _loc4_ = _loc6_;
            }
         }
         if(_loc4_ == null)
         {
            return;
         }
         pickBundle(_loc4_.id,param1,param2,param3);
      }
      
      private function isBundleHigherPriorityOrOlder(param1:IssueBundle, param2:IssueBundle) : Boolean
      {
         if(param1.highestPriority < param2.highestPriority)
         {
            return true;
         }
         return param1.highestPriority == param2.highestPriority && param1.issueAgeInMilliseconds < param2.issueAgeInMilliseconds;
      }
      
      public function releaseAll() : void
      {
         var _loc3_:* = null;
         if(var_1543 == null)
         {
            return;
         }
         var _loc1_:int = _moderationManager.sessionDataManager.userId;
         var _loc2_:* = [];
         for each(_loc3_ in var_1543)
         {
            if(_loc3_.state == 2 && _loc3_.pickerUserId == _loc1_)
            {
               _loc2_ = _loc2_.concat(_loc3_.getIssueIds());
            }
         }
         sendRelease(_loc2_);
      }
      
      public function releaseBundle(param1:int) : void
      {
         if(var_1543 == null)
         {
            return;
         }
         var _loc2_:IssueBundle = var_1543.getValue(param1) as IssueBundle;
         if(_loc2_ == null)
         {
            return;
         }
         sendRelease(_loc2_.getIssueIds());
      }
      
      private function sendRelease(param1:Array) : void
      {
         if(param1 == null || param1.length == 0 || _moderationManager == null || true)
         {
            return;
         }
         _moderationManager.connection.send(new class_334(param1));
         var_2744 = var_2744.concat(param1);
      }
      
      public function playSound(param1:class_1612) : void
      {
         if(false)
         {
            return;
         }
         if(var_2256 == null || !var_2256.isOpen())
         {
            _moderationManager.soundManager.playSound("HBST_call_for_help");
         }
      }
      
      public function updateIssue(param1:class_1612) : void
      {
         var _loc9_:* = null;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var_249.remove(param1.issueId);
         var_249.add(param1.issueId,param1);
         var _loc6_:int;
         if((_loc6_ = var_2713.getValue(param1.issueId)) != 0)
         {
            if((_loc9_ = var_1543.getValue(_loc6_) as IssueBundle) != null)
            {
               if(_loc9_.matches(param1))
               {
                  _loc9_.updateIssue(param1);
               }
               else
               {
                  _loc9_.removeIssue(param1.issueId);
                  if(_loc9_.getIssueCount() == 0)
                  {
                     var_1543.remove(_loc9_.id);
                     removeHandler(_loc9_.id);
                  }
                  var_2713.remove(param1.issueId);
                  _loc9_ = null;
               }
            }
         }
         if(param1.state == 3)
         {
            var_249.remove(param1.issueId);
            return;
         }
         if(_loc9_ == null)
         {
            for each(_loc3_ in var_1543)
            {
               if(_loc3_.matches(param1))
               {
                  (_loc9_ = _loc3_).updateIssue(param1);
                  var_2713.add(param1.issueId,_loc9_.id);
                  break;
               }
            }
         }
         if(_loc9_ == null)
         {
            _loc6_ = var_4159++;
            _loc9_ = new IssueBundle(_loc6_,param1);
            var_2713.add(param1.issueId,_loc6_);
            var_1543.add(_loc6_,_loc9_);
         }
         if(_loc9_ == null)
         {
            return;
         }
         if(var_2382.indexOf(param1.issueId) != -1)
         {
            handleBundle(_loc9_.id);
            _loc2_ = _moderationManager.sessionDataManager.userId;
            if(_loc2_ != param1.pickerUserId)
            {
               if(param1.state == 2)
               {
                  unhandleBundle(_loc9_.id);
               }
            }
         }
         if(param1.state == 1)
         {
            _loc4_ = getBundles("issue_bundle_my");
            _loc5_ = false;
            for each(_loc7_ in _loc4_)
            {
               if(_loc7_.matches(param1,true))
               {
                  _loc5_ = true;
                  break;
               }
            }
            if((_loc8_ = var_2744.indexOf(param1.issueId)) == -1 && _loc5_)
            {
               sendPick([param1.issueId],false,0,"matches bundle with issue: " + _loc7_.getHighestPriorityIssue().issueId);
            }
            else
            {
               var_2744.splice(_loc8_,1);
            }
         }
         updateHandler(_loc9_.id);
         var_2256.update();
      }
      
      public function updateIssueBrowser(param1:Event = null) : void
      {
         if(_moderationManager == null)
         {
            return;
         }
         if(var_2256 != null)
         {
            var_2256.update();
         }
      }
      
      private function updateHandler(param1:int) : void
      {
         var _loc2_:IIssueHandler = _issueHandlers.getValue(param1);
         if(_loc2_ != null)
         {
            _loc2_.updateIssuesAndMessages();
         }
      }
      
      public function removeHandler(param1:int) : void
      {
         var _loc2_:* = _issueHandlers.remove(param1);
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            _loc2_ = null;
         }
      }
      
      public function addModActionView(param1:int, param2:ModActionCtrl) : void
      {
         var_3267.add(param1,param2);
      }
      
      public function removeModActionView(param1:int) : void
      {
         var_3267.remove(param1);
      }
      
      public function removeIssue(param1:int) : void
      {
         var _loc3_:IssueBundle = null;
         if(var_249 == null)
         {
            return;
         }
         var _loc2_:int = var_2713.getValue(param1);
         if(_loc2_ != 0)
         {
            _loc3_ = var_1543.getValue(_loc2_) as IssueBundle;
            if(_loc3_ != null)
            {
               _loc3_.removeIssue(param1);
               if(_loc3_.getIssueCount() == 0)
               {
                  var_1543.remove(_loc3_.id);
               }
            }
         }
         var_249.remove(param1);
         var_2256.update();
      }
      
      public function getBundles(param1:String) : Array
      {
         var _loc4_:* = null;
         if(var_1543 == null)
         {
            return [];
         }
         var _loc3_:* = [];
         var _loc2_:int = _moderationManager.sessionDataManager.userId;
         for each(_loc4_ in var_1543)
         {
            switch(param1)
            {
               case "issue_bundle_open":
                  if(_loc4_.state == 1)
                  {
                     _loc3_.push(_loc4_);
                  }
                  break;
               case "issue_bundle_my":
                  if(_loc4_.state == 2 && _loc4_.pickerUserId == _loc2_)
                  {
                     _loc3_.push(_loc4_);
                  }
                  break;
               case "issue_bundle_picked":
                  if(_loc4_.state == 2 && _loc4_.pickerUserId != _loc2_)
                  {
                     _loc3_.push(_loc4_);
                  }
                  break;
            }
         }
         return _loc3_;
      }
      
      public function handleBundle(param1:int) : void
      {
         var _loc5_:IssueBundle;
         if((_loc5_ = var_1543.getValue(param1) as IssueBundle) == null)
         {
            return;
         }
         var _loc4_:IIssueHandler = new IssueHandler(_moderationManager,_loc5_,var_3830,var_557,var_473,_windowWidth,var_352);
         _moderationManager.windowTracker.show(_loc4_ as ITrackedWindow,null,false,false,false,true,var_557,var_473,_windowWidth,var_352);
         removeHandler(param1);
         _issueHandlers.add(param1,_loc4_);
         var _loc2_:* = [];
         for each(var _loc3_ in var_2382)
         {
            if(!_loc5_.contains(_loc3_))
            {
               _loc2_ = _loc2_.concat(_loc3_);
            }
         }
         var_2382 = _loc2_;
      }
      
      public function unhandleBundle(param1:int) : void
      {
         var _loc3_:IssueBundle = var_1543.getValue(param1) as IssueBundle;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:ITrackedWindow = _issueHandlers.remove(param1);
         if(_loc2_ != null)
         {
            _loc2_.dispose();
         }
      }
      
      public function closeBundle(param1:int, param2:int) : void
      {
         var _loc3_:IssueBundle = var_1543.getValue(param1) as IssueBundle;
         if(_loc3_ == null)
         {
            return;
         }
         sendClose(_loc3_.getIssueIds(),param2);
      }
      
      public function closeDefaultAction(param1:int, param2:int) : void
      {
         var _loc6_:IssueBundle;
         if((_loc6_ = var_1543.getValue(param1) as IssueBundle) == null)
         {
            return;
         }
         var _loc5_:int = _loc6_.getHighestPriorityIssue().issueId;
         var _loc4_:* = [];
         for each(var _loc3_ in _loc6_.getIssueIds())
         {
            if(_loc3_ != _loc5_)
            {
               _loc4_.push(_loc3_);
            }
         }
         sendCloseDefaultAction(_loc5_,_loc4_,param2);
      }
      
      public function requestSanctionData(param1:int, param2:int) : void
      {
         var _loc3_:IssueBundle = var_1543.getValue(param1) as IssueBundle;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.getHighestPriorityIssue() != null)
         {
            _moderationManager.connection.send(new class_737(_loc3_.getHighestPriorityIssue().issueId,-1,param2));
         }
      }
      
      public function requestSanctionDataForAccount(param1:int, param2:int) : void
      {
         _moderationManager.connection.send(new class_737(-1,param1,param2));
      }
      
      public function updateSanctionData(param1:int, param2:int, param3:class_1632) : void
      {
         var _loc4_:IIssueHandler = null;
         var _loc5_:ModActionCtrl = null;
         var _loc6_:String = param3.name + (param3.avatarOnly ? " (avatar) " : " ");
         if(param3.sanctionLengthInHours > 24)
         {
            _loc6_ += param3.sanctionLengthInHours / 24 + " days";
         }
         else
         {
            _loc6_ += param3.sanctionLengthInHours + "h";
         }
         if(!StringUtil.isEmpty(param3.tradeLockInfo))
         {
            _loc6_ += " & " + param3.tradeLockInfo;
         }
         if(!StringUtil.isEmpty(param3.machineBanInfo))
         {
            _loc6_ += " & " + param3.machineBanInfo;
         }
         if(param1 > 0)
         {
            for each(var _loc7_ in var_1543)
            {
               if(_loc7_.contains(param1))
               {
                  if((_loc4_ = _issueHandlers.getValue(_loc7_.id)) != null)
                  {
                     _loc4_.showDefaultSanction(param2,_loc6_);
                  }
               }
            }
         }
         else if((_loc5_ = var_3267.getValue(param2)) != null)
         {
            _loc5_.showDefaultSanction(param2,_loc6_);
         }
      }
      
      private function sendClose(param1:Array, param2:int) : void
      {
         if(param1 == null || _moderationManager == null || true)
         {
            return;
         }
         _moderationManager.connection.send(new class_478(param1,param2));
      }
      
      private function sendPick(param1:Array, param2:Boolean, param3:int, param4:String) : void
      {
         if(param1 == null || _moderationManager == null || true)
         {
            return;
         }
         _moderationManager.connection.send(new class_999(param1,param2,param3,param4));
      }
      
      private function sendCloseDefaultAction(param1:int, param2:Array, param3:int) : void
      {
         _moderationManager.connection.send(new class_787(param1,param2,param3));
      }
      
      public function autoHandle(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:Array = var_1543.getValues();
         var _loc2_:int = _moderationManager.sessionDataManager.userId;
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.state == 2 && _loc5_.pickerUserId == _loc2_ && _loc5_.id != param1 && (_loc3_ == null || _loc5_.highestPriority < _loc3_.highestPriority))
            {
               _loc3_ = _loc5_;
            }
         }
         if(_loc3_ == null)
         {
            autoPick("issue manager pick next");
            return;
         }
         handleBundle(_loc3_.id);
      }
      
      public function issuePickFailed(param1:Array) : Boolean
      {
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc10_:String = null;
         var _loc2_:int = 0;
         var _loc13_:* = null;
         var _loc5_:* = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:IIssueHandler = null;
         if(!param1)
         {
            return false;
         }
         var _loc7_:Boolean = false;
         var _loc9_:int = _moderationManager.sessionDataManager.userId;
         for each(_loc6_ in param1)
         {
            _loc4_ = int(_loc6_.issueId);
            _loc10_ = _loc6_.pickerUserName;
            _loc2_ = _loc6_.pickerUserId;
            if(_loc2_ != -1 && _loc2_ != _loc9_)
            {
               _loc7_ = true;
            }
            _loc13_ = null;
            for each(_loc5_ in var_1543)
            {
               if((_loc11_ = _loc5_.getIssueIds()) != null)
               {
                  for each(_loc12_ in _loc11_)
                  {
                     if(_loc4_ == _loc12_)
                     {
                        _loc13_ = _loc5_;
                        break;
                     }
                  }
               }
            }
            if(_loc13_ != null)
            {
               _loc8_ = _loc13_.id;
               _loc3_ = _issueHandlers.getValue(_loc8_);
               if(_loc3_ != null)
               {
                  _loc3_.dispose();
               }
               releaseBundle(_loc8_);
            }
         }
         return _loc7_;
      }
      
      public function setToolPreferences(param1:int, param2:int, param3:int, param4:int) : void
      {
         var_557 = param1;
         var_473 = param2;
         var_352 = param3;
         _windowWidth = param4;
      }
      
      public function setCfhTopics(param1:Vector.<class_1634>) : void
      {
         this.var_3830 = param1;
      }
      
      public function getCfhTopics() : Vector.<class_1634>
      {
         return var_3830;
      }
   }
}
