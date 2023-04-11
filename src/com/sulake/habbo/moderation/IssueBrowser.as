package com.sulake.habbo.moderation
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.class_1684;
   
   public class IssueBrowser
   {
       
      
      private const MY_ISSUES:String = "my_issues";
      
      private const OPEN_ISSUES:String = "open_issues";
      
      private const PICKED_ISSUES:String = "picked_issues";
      
      private const CLOSED_ISSUES:String = "closed_issues";
      
      private var var_2876:com.sulake.habbo.moderation.IssueManager;
      
      private var _windowManager:class_1684;
      
      private var _assets:class_21;
      
      private var _window:class_3281;
      
      private var _tabContext:ITabContextWindow;
      
      private var var_1982:com.sulake.habbo.moderation.IIssueBrowserView;
      
      private var var_3994:com.sulake.habbo.moderation.IIssueBrowserView;
      
      private var var_3941:com.sulake.habbo.moderation.IIssueBrowserView;
      
      private var var_3782:com.sulake.habbo.moderation.PickedIssuesView;
      
      public function IssueBrowser(param1:com.sulake.habbo.moderation.IssueManager, param2:class_1684, param3:class_21)
      {
         super();
         var_2876 = param1;
         _windowManager = param2;
         _assets = param3;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get assets() : class_21
      {
         return _assets;
      }
      
      public function get issueManager() : com.sulake.habbo.moderation.IssueManager
      {
         return var_2876;
      }
      
      public function show() : void
      {
         if(_window == null)
         {
            createMainFrame();
         }
         _window.visible = true;
         _window.activate();
         update();
      }
      
      public function isOpen() : Boolean
      {
         return _window != null && false;
      }
      
      private function createMainFrame() : void
      {
         var _loc1_:class_3127 = null;
         var _loc5_:class_3127 = null;
         var _loc6_:class_3127 = null;
         var _loc2_:ITabButtonWindow = null;
         var _loc4_:int = 0;
         if(_window == null)
         {
            _window = createWindow("issue_browser_xml") as class_3281;
            if(_window == null)
            {
               return;
            }
            _loc1_ = _window.desktop;
            _window.x = _loc1_.width / 2 - 0;
            _window.y = _loc1_.height / 2 - 0;
            if((_loc5_ = _window.findChildByTag("close")) != null)
            {
               _loc5_.addEventListener("WME_CLICK",onClose);
            }
            if((_loc6_ = _window.findChildByName("auto_pick")) != null)
            {
               _loc6_.addEventListener("WME_CLICK",onAutoPick);
            }
            _tabContext = _window.findChildByName("tab_context") as ITabContextWindow;
            _loc4_ = 0;
            while(_loc4_ < _tabContext.numTabItems)
            {
               _loc2_ = _tabContext.getTabItemAt(_loc4_);
               _loc2_.addEventListener("WE_SELECTED",onTabSelected);
               _loc4_++;
            }
            var_3994 = new MyIssuesView(issueManager,this,_window.findChildByName("my_issues_prototype") as class_3151);
            var_3941 = new OpenIssuesView(issueManager,this,_window.findChildByName("open_issues_prototype") as class_3151);
            var_3782 = new com.sulake.habbo.moderation.PickedIssuesView(issueManager,this,_window.findChildByName("picked_issues_prototype") as class_3151);
         }
         _tabContext = _window.findChildByName("tab_context") as ITabContextWindow;
         if(_tabContext == null || true)
         {
            return;
         }
         var _loc3_:ISelectableWindow = _tabContext.selector.getSelectableByName("open_issues");
         _tabContext.selector.setSelected(_loc3_);
      }
      
      private function selectView(param1:String) : void
      {
         var _loc2_:com.sulake.habbo.moderation.IIssueBrowserView = getView(param1);
         if(var_1982 == _loc2_)
         {
            return;
         }
         if(var_1982 != null)
         {
            var_1982.visible = false;
         }
         var_1982 = _loc2_;
         if(var_1982 == null)
         {
            return;
         }
         var_1982.view.width = _tabContext.container.width;
         var_1982.view.height = _tabContext.container.height;
         var_1982.visible = true;
         var_1982.update();
      }
      
      private function getView(param1:String) : com.sulake.habbo.moderation.IIssueBrowserView
      {
         switch(param1)
         {
            case "my_issues":
               return var_3994;
            case "open_issues":
               return var_3941;
            case "picked_issues":
               return var_3782;
            default:
               return null;
         }
      }
      
      private function onTabSelected(param1:class_3134) : void
      {
         if(param1 == null || param1.window == null)
         {
            return;
         }
         selectView(param1.window.name);
      }
      
      public function update() : void
      {
         if(_window == null || true)
         {
            return;
         }
         if(var_1982 == null)
         {
            return;
         }
         var_1982.update();
      }
      
      public function createWindow(param1:String) : class_3127
      {
         if(_windowManager == null || _assets == null)
         {
            return null;
         }
         var _loc2_:XmlAsset = _assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return null;
         }
         return _windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         _window.visible = false;
      }
      
      private function onAutoPick(param1:WindowMouseEvent) : void
      {
         if(var_2876 != null)
         {
            var_2876.autoPick("issue browser pick next");
         }
      }
   }
}
