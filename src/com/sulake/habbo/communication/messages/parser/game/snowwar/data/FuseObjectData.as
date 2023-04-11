package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.habbo.room.IStuffData;
   import package_154.class_1538;
   
   public class FuseObjectData
   {
       
      
      private var _name:String;
      
      private var var_247:int;
      
      private var var_29:int;
      
      private var var_28:int;
      
      private var var_1071:int;
      
      private var var_1249:int;
      
      private var var_47:int;
      
      private var _direction:int;
      
      private var var_1015:int;
      
      private var var_867:Boolean;
      
      private var var_921:IStuffData;
      
      public function FuseObjectData()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
         _name = param1.readString();
         var_247 = param1.readInteger();
         var_29 = param1.readInteger();
         var_28 = param1.readInteger();
         var_1071 = param1.readInteger();
         var_1249 = param1.readInteger();
         var_47 = param1.readInteger();
         _direction = param1.readInteger();
         var_1015 = param1.readInteger();
         var_867 = param1.readBoolean();
         var_921 = class_1538.parseStuffData(param1);
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_28;
      }
      
      public function get xDimension() : int
      {
         return var_1071;
      }
      
      public function get yDimension() : int
      {
         return var_1249;
      }
      
      public function get height() : int
      {
         return var_47;
      }
      
      public function get direction() : int
      {
         return _direction;
      }
      
      public function get altitude() : int
      {
         return var_1015;
      }
      
      public function get canStandOn() : Boolean
      {
         return var_867;
      }
      
      public function get stuffData() : IStuffData
      {
         return var_921;
      }
   }
}
