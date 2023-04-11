package com.sulake.habbo.moderation
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   
   public class PickedIssuesView implements IIssueBrowserView
   {
       
      
      private var var_2876:com.sulake.habbo.moderation.IssueManager;
      
      private var var_2256:com.sulake.habbo.moderation.IssueBrowser;
      
      private var _window:class_3151;
      
      private var var_3995:com.sulake.habbo.moderation.IssueListView;
      
      public function PickedIssuesView(param1:com.sulake.habbo.moderation.IssueManager, param2:com.sulake.habbo.moderation.IssueBrowser, param3:class_3151)
      {
         super();
         var_2876 = param1;
         var_2256 = param2;
         _window = param3;
         _window.visible = false;
         var _loc4_:IItemListWindow = _window.findChildByName("issue_list") as IItemListWindow;
         var_3995 = new com.sulake.habbo.moderation.IssueListView(param1,param2,_loc4_);
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
         var _loc1_:Array = var_2876.getBundles("issue_bundle_picked");
         var_3995.update(_loc1_);
      }
   }
}
