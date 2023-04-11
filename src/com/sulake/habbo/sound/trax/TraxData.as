package com.sulake.habbo.sound.trax
{
   import com.sulake.core.utils.class_24;
   
   public class TraxData
   {
       
      
      private var _channels:Array;
      
      private var var_2928:class_24;
      
      public function TraxData(param1:String)
      {
         var _loc8_:* = null;
         var _loc11_:Array = null;
         var _loc9_:int = 0;
         var _loc15_:String = null;
         var _loc14_:String = null;
         var _loc6_:int = 0;
         var _loc16_:int = 0;
         var _loc2_:Array = null;
         var _loc5_:TraxChannel = null;
         var _loc7_:int = 0;
         var _loc13_:Array = null;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var_2928 = new class_24();
         super();
         _channels = [];
         var _loc12_:Array = param1.split(":");
         var _loc10_:String;
         if((_loc10_ = String(_loc12_[_loc12_.length - 1])).indexOf("meta") != -1)
         {
            _loc11_ = _loc10_.split(";");
            _loc9_ = 0;
            while(_loc9_ < _loc11_.length)
            {
               _loc15_ = String(String(_loc11_[_loc9_]).split(",")[0]);
               _loc14_ = String(String(_loc11_[_loc9_]).split(",")[1]);
               var_2928.add(_loc15_,_loc14_);
               _loc9_++;
            }
            _loc8_ = _loc12_.slice(0,_loc12_.length - 1);
         }
         else
         {
            _loc8_ = _loc12_;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc8_.length / 2)
         {
            if(_loc8_[_loc6_ * 2].toString().length > 0)
            {
               _loc16_ = int(_loc8_[_loc6_ * 2]);
               _loc2_ = _loc8_[_loc6_ * 2 + 1].toString().split(";");
               _loc5_ = new TraxChannel(_loc16_);
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  if((_loc13_ = _loc2_[_loc7_].toString().split(",")).length != 2)
                  {
                     class_14.log("Trax load error: invalid song data string");
                     return;
                  }
                  _loc4_ = int(_loc13_[0]);
                  _loc3_ = int(_loc13_[1]);
                  _loc5_.addChannelItem(new TraxChannelItem(_loc4_,_loc3_));
                  _loc7_++;
               }
               _channels.push(_loc5_);
            }
            _loc6_++;
         }
      }
      
      public function get channels() : Array
      {
         return _channels;
      }
      
      public function getSampleIds() : Array
      {
         var _loc4_:int = 0;
         var _loc3_:TraxChannel = null;
         var _loc5_:int = 0;
         var _loc2_:TraxChannelItem = null;
         var _loc1_:* = [];
         _loc4_ = 0;
         while(_loc4_ < _channels.length)
         {
            _loc3_ = _channels[_loc4_] as TraxChannel;
            _loc5_ = 0;
            while(_loc5_ < _loc3_.itemCount)
            {
               _loc2_ = _loc3_.getItem(_loc5_);
               if(_loc1_.indexOf(_loc2_.id) == -1)
               {
                  _loc1_.push(_loc2_.id);
               }
               _loc5_++;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function get hasMetaData() : Boolean
      {
         return false;
      }
      
      public function get metaCutMode() : Boolean
      {
         return false;
      }
      
      public function get metaTempo() : int
      {
         return var_2928["t"] as int;
      }
   }
}
