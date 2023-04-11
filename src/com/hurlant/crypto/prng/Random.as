package com.hurlant.crypto.prng
{
   import com.hurlant.util.class_1297;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.text.Font;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class Random
   {
       
      
      private var state:com.hurlant.crypto.prng.IPRNG;
      
      private var ready:Boolean = false;
      
      private var var_41:ByteArray;
      
      private var name_2:int;
      
      private var var_21:int;
      
      private var seeded:Boolean = false;
      
      public function Random(param1:Class = null)
      {
         var _loc2_:* = 0;
         super();
         if(param1 == null)
         {
            param1 = ARC4;
         }
         state = new param1() as com.hurlant.crypto.prng.IPRNG;
         name_2 = state.getPoolSize();
         var_41 = new ByteArray();
         var_21 = 0;
         while(var_21 < name_2)
         {
            _loc2_ = 65536 * Math.random();
            var_41[var_21++] = _loc2_ >>> 8;
            var_41[var_21++] = _loc2_ & 255;
         }
         var_21 = 0;
         seed();
      }
      
      public function seed(param1:int = 0) : void
      {
         if(param1 == 0)
         {
            param1 = new Date().getTime();
         }
         var _loc2_:* = var_21++;
         var _loc3_:* = 0 ^ param1 & 255;
         var_41[_loc2_] = _loc3_;
         _loc3_ = var_21++;
         _loc2_ = 0 ^ param1 >> 8 & 255;
         var_41[_loc3_] = _loc2_;
         _loc2_ = var_21++;
         _loc3_ = 0 ^ param1 >> 16 & 255;
         var_41[_loc2_] = _loc3_;
         _loc3_ = var_21++;
         _loc2_ = 0 ^ param1 >> 24 & 255;
         var_41[_loc3_] = _loc2_;
         var_21 %= name_2;
         seeded = true;
      }
      
      public function autoSeed() : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUnsignedInt(System.totalMemory);
         _loc2_.writeUTF(Capabilities.serverString);
         _loc2_.writeUnsignedInt(getTimer());
         _loc2_.writeUnsignedInt(new Date().getTime());
         var _loc1_:Array = Font.enumerateFonts(true);
         for each(var _loc3_ in _loc1_)
         {
            _loc2_.writeUTF(_loc3_.fontName);
            _loc2_.writeUTF(_loc3_.fontStyle);
            _loc2_.writeUTF(_loc3_.fontType);
         }
         _loc2_.position = 0;
         while(_loc2_.bytesAvailable >= 4)
         {
            seed(_loc2_.readUnsignedInt());
         }
      }
      
      public function nextBytes(param1:ByteArray, param2:int) : void
      {
         while(param2--)
         {
            param1.writeByte(nextByte());
         }
      }
      
      public function nextByte() : int
      {
         if(!ready)
         {
            if(!seeded)
            {
               autoSeed();
            }
            state.init(var_41);
            var_41.length = 0;
            var_21 = 0;
            ready = true;
         }
         return state.next();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = 0;
         _loc1_ = 0;
         while(_loc1_ < var_41.length)
         {
            var_41[_loc1_] = Math.random() * 256;
            _loc1_++;
         }
         var_41.length = 0;
         var_41 = null;
         state.dispose();
         state = null;
         name_2 = 0;
         var_21 = 0;
         class_1297.gc();
      }
      
      public function toString() : String
      {
         return "random-" + state.toString();
      }
   }
}
