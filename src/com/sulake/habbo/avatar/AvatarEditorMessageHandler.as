package com.sulake.habbo.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.avatar.view.AvatarEditorNameChangeView;
   import com.sulake.habbo.communication.class_25;
   import package_12.class_863;
   import package_151.class_1094;
   import package_44.class_322;
   import package_44.class_331;
   import package_44.class_686;
   import package_6.class_142;
   import package_61.class_1041;
   import package_61.class_228;
   import package_61.class_242;
   import package_61.class_317;
   import package_64.class_237;
   import package_64.class_504;
   import package_64.class_754;
   
   public class AvatarEditorMessageHandler
   {
       
      
      private var _communication:class_25;
      
      private var var_282:com.sulake.habbo.avatar.HabboAvatarEditorManager;
      
      public function AvatarEditorMessageHandler(param1:com.sulake.habbo.avatar.HabboAvatarEditorManager, param2:class_25)
      {
         super();
         var_282 = param1;
         _communication = param2;
         _communication.addHabboConnectionMessageEvent(new class_242(onAvatarEffectAdded));
         _communication.addHabboConnectionMessageEvent(new class_317(onAvatarEffectExpired));
         _communication.addHabboConnectionMessageEvent(new class_142(onUserRights));
         _communication.addHabboConnectionMessageEvent(new class_686(onCheckUserNameResult));
         _communication.addHabboConnectionMessageEvent(new class_228(onAvatarEffectSelected));
         _communication.addHabboConnectionMessageEvent(new class_863(onRoomAvatarEffects));
         _communication.addHabboConnectionMessageEvent(new class_322(onWardrobe));
         _communication.addHabboConnectionMessageEvent(new class_1041(onAvatarEffectActivated));
      }
      
      public function dispose() : void
      {
         _communication = null;
         var_282 = null;
      }
      
      public function saveWardrobeOutfit(param1:int, param2:IOutfit) : void
      {
         if(_communication == null)
         {
            return;
         }
         var _loc3_:* = new class_504(param1,param2.figure,param2.gender);
         _communication.connection.send(_loc3_);
         _loc3_.dispose();
         _loc3_ = null;
      }
      
      public function checkName(param1:String) : void
      {
         if(_communication == null)
         {
            return;
         }
         _communication.connection.send(new class_237(param1));
      }
      
      private function onCheckUserNameResult(param1:class_686) : void
      {
         if(param1 == null || !var_282)
         {
            return;
         }
         var _loc3_:HabboAvatarEditor = var_282.getEditor(0);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:AvatarEditorNameChangeView = _loc3_.view.avatarEditorNameChangeView;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:class_1094;
         if((_loc4_ = param1.getParser()).resultCode == class_331.var_1402)
         {
            _loc2_.checkedName = _loc4_.name;
         }
         else
         {
            _loc2_.setNameNotAvailableView(_loc4_.resultCode,_loc4_.name,_loc4_.nameSuggestions);
         }
      }
      
      public function getWardrobe() : void
      {
         if(_communication == null)
         {
            return;
         }
         var _loc1_:* = new class_754();
         _communication.connection.send(_loc1_);
         _loc1_.dispose();
         _loc1_ = null;
      }
      
      private function onWardrobe(param1:class_322) : void
      {
         if(param1 == null || !var_282)
         {
            return;
         }
         var _loc2_:HabboAvatarEditor = var_282.getEditor(0);
         if(_loc2_)
         {
            _loc2_.wardrobe.updateSlots(param1.state,param1.outfits);
         }
      }
      
      private function onUserRights(param1:class_142) : void
      {
         if(param1 == null || !var_282)
         {
            return;
         }
         var _loc2_:HabboAvatarEditor = var_282.getEditor(0);
         if(_loc2_)
         {
            _loc2_.clubMemberLevel = param1.clubLevel != 0 ? 2 : 0;
            _loc2_.update();
         }
      }
      
      private function onAvatarEffectAdded(param1:IMessageEvent) : void
      {
         if(param1 == null || !var_282)
         {
            return;
         }
         var _loc2_:HabboAvatarEditor = var_282.getEditor(0);
         if(_loc2_)
         {
            _loc2_.effects.reset();
         }
      }
      
      private function onAvatarEffectActivated(param1:class_1041) : void
      {
         if(param1 == null || !var_282)
         {
            return;
         }
         var _loc2_:HabboAvatarEditor = var_282.getEditor(0);
         if(_loc2_)
         {
            _loc2_.effects.reset();
            _loc2_.figureData.avatarEffectType = param1.getParser().type;
            _loc2_.figureData.updateView();
         }
      }
      
      private function onAvatarEffectExpired(param1:class_317) : void
      {
         var _loc3_:int = 0;
         if(param1 == null || !var_282)
         {
            return;
         }
         var _loc2_:HabboAvatarEditor = var_282.getEditor(0);
         if(_loc2_)
         {
            _loc2_.effects.reset();
            _loc3_ = param1.getParser().type;
            if(_loc2_.figureData.avatarEffectType == _loc3_)
            {
               _loc2_.figureData.avatarEffectType = -1;
               _loc2_.figureData.updateView();
            }
         }
      }
      
      private function onRoomAvatarEffects(param1:class_863) : void
      {
         if(param1 == null || !var_282)
         {
            return;
         }
         var _loc2_:HabboAvatarEditor = var_282.getEditor(0);
         if(_loc2_ && false && param1.getParser().userId == var_282.roomDesktop.roomSession.ownUserRoomId)
         {
            _loc2_.figureData.avatarEffectType = param1.getParser().effectId;
            _loc2_.figureData.updateView();
         }
      }
      
      private function onAvatarEffectSelected(param1:class_317) : void
      {
         if(param1 == null || !var_282)
         {
            return;
         }
         var _loc2_:HabboAvatarEditor = var_282.getEditor(0);
         if(_loc2_)
         {
            _loc2_.figureData.avatarEffectType = param1.getParser().type;
            _loc2_.figureData.updateView();
         }
      }
   }
}
