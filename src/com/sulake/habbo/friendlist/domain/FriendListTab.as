package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.friendlist.HabboFriendList;
   import com.sulake.habbo.friendlist.ITabView;
   
   public class FriendListTab
   {
       
      
      private var var_247:int;
      
      private var _name:String;
      
      private var _footerName:String;
      
      private var _headerPicName:String;
      
      private var var_3502:ITabView;
      
      private var var_2691:Boolean;
      
      private var _selected:Boolean;
      
      private var var_1430:class_3151;
      
      public function FriendListTab(param1:HabboFriendList, param2:int, param3:ITabView, param4:String, param5:String, param6:String)
      {
         super();
         var_247 = param2;
         _name = param4;
         var_3502 = param3;
         _footerName = param5;
         _headerPicName = param6;
         var_3502.init(param1);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(param1)
         {
            var_2691 = false;
         }
         _selected = param1;
      }
      
      public function setNewMessageArrived(param1:Boolean) : void
      {
         if(selected)
         {
            var_2691 = false;
         }
         else
         {
            var_2691 = param1;
         }
      }
      
      public function get newMessageArrived() : Boolean
      {
         return var_2691;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get footerName() : String
      {
         return _footerName;
      }
      
      public function get headerPicName() : String
      {
         return _headerPicName;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function get tabView() : ITabView
      {
         return var_3502;
      }
      
      public function get view() : class_3151
      {
         return var_1430;
      }
      
      public function set view(param1:class_3151) : void
      {
         var_1430 = param1;
      }
   }
}
