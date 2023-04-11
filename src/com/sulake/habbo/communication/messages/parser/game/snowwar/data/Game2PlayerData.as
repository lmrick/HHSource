package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   public class Game2PlayerData implements class_13
   {
       
      
      private var var_667:int;
      
      private var _userName:String;
      
      private var _figureString:String;
      
      private var var_122:String;
      
      private var var_905:int;
      
      private var var_311:Boolean = false;
      
      public function Game2PlayerData()
      {
         super();
      }
      
      public function dispose() : void
      {
         _userName = null;
         _figureString = null;
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
         var_667 = param1.readInteger();
         _userName = param1.readString();
         _figureString = param1.readString();
         var_122 = param1.readString();
         var_905 = param1.readInteger();
      }
      
      public function toString() : String
      {
         return "[Game Player] " + var_667 + ": " + _userName;
      }
      
      public function get referenceId() : int
      {
         return var_667;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get figureString() : String
      {
         return _figureString;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get teamId() : int
      {
         return var_905;
      }
      
      public function get isDisposed() : Boolean
      {
         return var_311;
      }
   }
}
