package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData  implements ISelectedRoomObjectData
   {
       
      
      private var var_247:int = 0;
      
      private var var_774:int = 0;
      
      private var _operation:String = "";
      
      private var var_537:Vector3d = null;
      
      private var var_386:Vector3d = null;
      
      private var var_1266:int = 0;
      
      private var var_4123:String = null;
      
      private var var_921:IStuffData = null;
      
      private var var_159:int = -1;
      
      private var _animFrame:int = -1;
      
      private var var_1302:String = null;
      
      public function SelectedRoomObjectData (param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null, param8:IStuffData = null, param9:int = -1, param10:int = -1, param11:String = null)
      {
         super();
         var_247 = param1;
         var_774 = param2;
         _operation = param3;
         var_537 = new Vector3d();
         var_537.assign(param4);
         var_386 = new Vector3d();
         var_386.assign(param5);
         var_1266 = param6;
         var_4123 = param7;
         var_921 = param8;
         var_159 = param9;
         _animFrame = param10;
         var_1302 = param11;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get operation() : String
      {
         return _operation;
      }
      
      public function get loc() : Vector3d
      {
         return var_537;
      }
      
      public function get dir() : Vector3d
      {
         return var_386;
      }
      
      public function get typeId() : int
      {
         return var_1266;
      }
      
      public function get instanceData() : String
      {
         return var_4123;
      }
      
      public function get stuffData() : IStuffData
      {
         return var_921;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get animFrame() : int
      {
         return _animFrame;
      }
      
      public function get posture() : String
      {
         return var_1302;
      }
      
      public function dispose() : void
      {
         var_537 = null;
         var_386 = null;
      }
   }
}
