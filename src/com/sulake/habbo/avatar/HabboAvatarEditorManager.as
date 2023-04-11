package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.habbo.avatar.enum.class_3209;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.ui.IRoomDesktop;
   import com.sulake.habbo.ui.IRoomUI;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.*;
   import flash.events.Event;
   
   public class HabboAvatarEditorManager extends class_20 implements class_1753, ILinkEventTracker
   {
      
      public static const const_998:uint = 1;
      
      public static const const_490:uint = 2;
      
      public static const const_438:uint = 3;
      
      private static const GENERIC:String = "generic";
       
      
      private var _windowManager:class_1684;
      
      private var _avatarRenderManager:com.sulake.habbo.avatar.class_1690;
      
      private var _inventory:class_1697;
      
      private var _localization:class_18;
      
      private var _communication:class_25;
      
      private var _catalog:IHabboCatalog;
      
      private var _sessionData:ISessionDataManager;
      
      private var _roomUI:IRoomUI;
      
      private var var_1453:com.sulake.habbo.avatar.AvatarEditorMessageHandler;
      
      private var _editors:class_24;
      
      public function HabboAvatarEditorManager(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         _editors = new class_24();
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDCoreWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         },(flags & 3) == 0),new ComponentDependency(new IIDAvatarRenderManager(),function(param1:com.sulake.habbo.avatar.class_1690):void
         {
            _avatarRenderManager = param1;
         },true,[{
            "type":"AVATAR_RENDER_READY",
            "callback":onAvatarRendererReady
         }]),new ComponentDependency(new IIDHabboInventory(),function(param1:class_1697):void
         {
            _inventory = param1;
         },(flags & 1) == 0,[]),new ComponentDependency(new IIDCoreLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDHabboConfigurationManager(),null,true,[{
            "type":"complete",
            "callback":onConfigurationComplete
         }]),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         },(flags & 2) == 0),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionData = param1;
         }),new ComponentDependency(new IIDHabboRoomUI(),function(param1:IRoomUI):void
         {
            _roomUI = param1;
         },false)]);
      }
      
      private function onConfigurationComplete(param1:Event) : void
      {
      }
      
      override protected function initComponent() : void
      {
         context.addLinkEventTracker(this);
         if(_communication)
         {
            var_1453 = new com.sulake.habbo.avatar.AvatarEditorMessageHandler(this,_communication);
         }
      }
      
      override public function dispose() : void
      {
         if(_editors)
         {
            for each(var _loc1_ in _editors)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            _editors = null;
         }
         if(var_1453 != null)
         {
            var_1453.dispose();
            var_1453 = null;
         }
         super.dispose();
      }
      
      public function openEditor(param1:uint, param2:class_3241, param3:Array = null, param4:Boolean = false, param5:String = null, param6:String = "generic") : class_3281
      {
         var _loc7_:HabboAvatarEditor;
         if(!(_loc7_ = _editors.getValue(param1)))
         {
            _loc7_ = new HabboAvatarEditor(param1,this);
            _editors.add(param1,_loc7_);
         }
         return _loc7_.openWindow(param2,param3,param4,param5,param6);
      }
      
      public function embedEditorToContext(param1:uint, param2:class_3151, param3:class_3241 = null, param4:Array = null, param5:Boolean = false, param6:Boolean = false) : Boolean
      {
         var _loc7_:HabboAvatarEditor;
         if(_loc7_ = _editors.getValue(param1))
         {
            _loc7_.dispose();
         }
         _loc7_ = new HabboAvatarEditor(param1,this,param6);
         _editors.add(param1,_loc7_);
         _loc7_.embedToContext(param2,param3,param4,param5);
         return true;
      }
      
      public function loadAvatarInEditor(param1:uint, param2:String, param3:String, param4:int = 0) : void
      {
         var _loc5_:HabboAvatarEditor;
         if(_loc5_ = _editors.getValue(param1) as HabboAvatarEditor)
         {
            return _loc5_.loadAvatarInEditor(param2,param3,param4);
         }
      }
      
      public function loadOwnAvatarInEditor(param1:uint) : void
      {
         var _loc2_:HabboAvatarEditor = _editors.getValue(param1) as HabboAvatarEditor;
         if(_loc2_)
         {
            if(_loc2_.hasNftOutfit())
            {
               return _loc2_.loadFallbackFigure();
            }
            return _loc2_.loadAvatarInEditor(sessionData.figure,sessionData.gender,sessionData.clubLevel);
         }
      }
      
      public function close(param1:uint) : void
      {
         if(!_editors)
         {
            return;
         }
         var _loc2_:HabboAvatarEditor = _editors.getValue(param1) as HabboAvatarEditor;
         if(!_loc2_)
         {
            return;
         }
         if(!class_3209.isDevelopmentEditor(param1))
         {
            _loc2_.figureData.avatarEffectType = inventory.getLastActivatedEffect();
         }
         switch(int(param1))
         {
            case 0:
               _loc2_.hide();
               break;
            case 1:
               _loc2_.hide();
               _loc2_.dispose();
               _editors.remove(param1);
               break;
            case 2:
               break;
            default:
               _loc2_.dispose();
               _editors.remove(param1);
         }
      }
      
      public function getEditor(param1:uint) : HabboAvatarEditor
      {
         return _editors.getValue(param1) as HabboAvatarEditor;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get avatarRenderManager() : com.sulake.habbo.avatar.class_1690
      {
         return _avatarRenderManager;
      }
      
      private function onAvatarRendererReady(param1:Event = null) : void
      {
         this.events.dispatchEvent(new Event("AVATAR_EDITOR_READY"));
      }
      
      public function get communication() : class_25
      {
         return _communication;
      }
      
      public function get handler() : com.sulake.habbo.avatar.AvatarEditorMessageHandler
      {
         return var_1453;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return _sessionData;
      }
      
      public function get inventory() : class_1697
      {
         return _inventory;
      }
      
      public function get roomDesktop() : IRoomDesktop
      {
         return _roomUI.getDesktop("hard_coded_room_id");
      }
      
      public function get linkPattern() : String
      {
         return "avatareditor/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         var _loc3_:* = _loc2_[1];
         if("open" === _loc3_)
         {
            openEditor(0,null,null,true);
            loadOwnAvatarInEditor(0);
         }
      }
   }
}
