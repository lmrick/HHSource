package com.sulake.habbo.communication.login
{
   public class AvatarData
   {
       
      
      private var var_247:int;
      
      private var var_1275:String;
      
      private var _name:String;
      
      private var var_904:String;
      
      private var var_427:String;
      
      private var var_122:String;
      
      private var _head_figure:String;
      
      private var _last_access:int;
      
      private var var_1349:Boolean;
      
      private var var_1380:Boolean;
      
      private var _creationTime:String;
      
      public function AvatarData(param1:Object)
      {
         super();
         if(param1 != null)
         {
            var_1275 = param1.uniqueId;
            _name = param1.name;
            var_904 = param1.motto;
            var_427 = param1.figureString;
            var_122 = param1.gender;
            _last_access = param1.lastWebAccess;
            var_1349 = param1.habboClubMember == "true";
            var_1380 = param1.buildersClubMember == "true";
            _creationTime = param1.creationTime;
         }
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function set id(param1:int) : void
      {
         var_247 = param1;
      }
      
      public function get uniqueId() : String
      {
         return var_1275;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_904;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get head_figure() : String
      {
         return _head_figure;
      }
      
      public function get last_access() : int
      {
         return _last_access;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
   }
}
