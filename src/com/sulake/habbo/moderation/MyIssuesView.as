package com.sulake.habbo.moderation
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class MyIssuesView implements IIssueBrowserView
   {
       
      
      private var var_2876:com.sulake.habbo.moderation.IssueManager;
      
      private var var_2256:com.sulake.habbo.moderation.IssueBrowser;
      
      private var _window:class_3151;
      
      private var var_3995:com.sulake.habbo.moderation.IssueListView;
      
      public function MyIssuesView(param1:com.sulake.habbo.moderation.IssueManager, param2:com.sulake.habbo.moderation.IssueBrowser, param3:class_3151)
      {
         super();
         var_2876 = param1;
         var_2256 = param2;
         _window = param3;
         _window.visible = false;
         var _loc5_:IItemListWindow = _window.findChildByName("issue_list") as IItemListWindow;
         var_3995 = new com.sulake.habbo.moderation.IssueListView(param1,param2,_loc5_);
         var _loc4_:class_3127;
         if((_loc4_ = _window.findChildByName("release_all")) != null)
         {
            _loc4_.addEventListener("WME_CLICK",onReturnAll);
         }
      }
      
      public function get view() : class_3151
      {
         return _window;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _window.visible = param1;
      }
      
      public function update() : void
      {
         var _loc1_:Array = var_2876.getBundles("issue_bundle_my");
         var_3995.update(_loc1_);
      }
      
      private function onReturnAll(param1:WindowMouseEvent) : void
      {
         if(var_2876 == null)
         {
            return;
         }
         var_2876.releaseAll();
      }
   }
}
