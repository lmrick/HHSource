package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class FurnitureData
   {
       
      
      private var var_247:int = 0;
      
      private var var_1266:int = 0;
      
      private var var_271:String = null;
      
      private var var_537:Vector3d;
      
      private var var_386:Vector3d;
      
      private var var_159:int = 0;
      
      private var var_45:IStuffData = null;
      
      private var var_609:Number = NaN;
      
      private var _expiryTime:int = -1;
      
      private var var_747:int = 0;
      
      private var var_684:int = 0;
      
      private var _ownerName:String = "";
      
      private var var_3739:Boolean = true;
      
      private var _realRoomObject:Boolean = true;
      
      private var var_750:Number;
      
      public function FurnitureData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int, param7:IStuffData, param8:Number = NaN, param9:int = -1, param10:int = 0, param11:int = 0, param12:String = "", param13:Boolean = true, param14:Boolean = true, param15:Number = -1)
      {
         var_537 = new Vector3d();
         var_386 = new Vector3d();
         super();
         var_247 = param1;
         var_1266 = param2;
         var_271 = param3;
         var_537.assign(param4);
         var_386.assign(param5);
         var_159 = param6;
         var_45 = param7;
         var_609 = param8;
         _expiryTime = param9;
         var_747 = param10;
         var_684 = param11;
         _ownerName = param12;
         var_3739 = param13;
         _realRoomObject = param14;
         var_750 = param15;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get typeId() : int
      {
         return var_1266;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get loc() : IVector3d
      {
         return var_537;
      }
      
      public function get dir() : IVector3d
      {
         return var_386;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get data() : IStuffData
      {
         return var_45;
      }
      
      public function get extra() : Number
      {
         return var_609;
      }
      
      public function get expiryTime() : int
      {
         return _expiryTime;
      }
      
      public function get usagePolicy() : int
      {
         return var_747;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get synchronized() : Boolean
      {
         return var_3739;
      }
      
      public function get realRoomObject() : Boolean
      {
         return _realRoomObject;
      }
      
      public function get sizeZ() : Number
      {
         return var_750;
      }
   }
}
