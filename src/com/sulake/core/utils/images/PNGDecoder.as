package com.sulake.core.utils.images
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class PNGDecoder
   {
       
      
      private const const_74:uint = 1229472850;
      
      private const PLTE:uint = 1347179589;
      
      private const IDAT:uint = 1229209940;
      
      private const IEND:uint = 1229278788;
      
      private var imgWidth:uint = 0;
      
      private var var_186:uint = 0;
      
      private var bitDepth:uint = 0;
      
      private var var_1394:uint = 0;
      
      private var compressionMethod:uint = 0;
      
      private var var_1366:uint = 0;
      
      private var interlaceMethod:uint = 0;
      
      private var var_167:Array;
      
      private var input:ByteArray;
      
      private var output:ByteArray;
      
      public function PNGDecoder()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : BitmapData
      {
         var _loc3_:int = 0;
         var _loc2_:Matrix = null;
         var_167 = [];
         input = new ByteArray();
         output = new ByteArray();
         input = param1;
         input.position = 0;
         if(!readSignature())
         {
            throw new Error("wrong signature");
         }
         getChunks();
         _loc3_ = 0;
         while(_loc3_ < var_167.length)
         {
            switch(var_167[_loc3_].type)
            {
               case 1229472850:
                  processIHDR(_loc3_);
                  break;
               case 1229209940:
                  processIDAT(_loc3_);
            }
            _loc3_++;
         }
         var _loc5_:BitmapData = new BitmapData(imgWidth,var_186);
         var _loc4_:BitmapData = new BitmapData(imgWidth,var_186,true,16777215);
         if(false && imgWidth * var_186 * 4 == output.length)
         {
            output.position = 0;
            _loc5_.setPixels(new Rectangle(0,0,imgWidth,var_186),output);
            _loc2_ = new Matrix();
            _loc2_.scale(-1,-1);
            _loc2_.translate(imgWidth,var_186);
            _loc4_.draw(_loc5_,_loc2_);
         }
         return _loc4_;
      }
      
      private function processIHDR(param1:uint) : void
      {
         input.position = var_167[param1].position;
         imgWidth = input.readUnsignedInt();
         var_186 = input.readUnsignedInt();
         bitDepth = input.readUnsignedByte();
         var_1394 = input.readUnsignedByte();
         compressionMethod = input.readUnsignedByte();
         var_1366 = input.readUnsignedByte();
         interlaceMethod = input.readUnsignedByte();
      }
      
      private function processIDAT(param1:uint) : void
      {
         var _loc7_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc6_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:ByteArray = new ByteArray();
         var _loc8_:uint = imgWidth * 4;
         _loc5_.writeBytes(input,var_167[param1].position,var_167[param1].length);
         _loc5_.uncompress();
         _loc7_ = _loc5_.length - 1;
         while(_loc7_ > 0)
         {
            if(_loc7_ % (_loc8_ + 1) != 0)
            {
               _loc2_ = uint(_loc5_[_loc7_]);
               _loc3_ = uint(_loc5_[_loc7_ - 1]);
               _loc6_ = uint(_loc5_[_loc7_ - 2]);
               _loc4_ = uint(_loc5_[_loc7_ - 3]);
               output.writeByte(_loc2_);
               output.writeByte(_loc4_);
               output.writeByte(_loc6_);
               output.writeByte(_loc3_);
               _loc7_ -= 3;
            }
            _loc7_--;
         }
      }
      
      private function getChunks() : void
      {
         var _loc2_:Number = 0;
         var _loc1_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         while(input.position < _loc4_)
         {
            _loc1_ = input.readUnsignedInt();
            _loc3_ = input.readUnsignedInt();
            _loc2_ = 0;
            input.position += _loc1_;
            input.position = NaN;
            var_167.push({
               "position":_loc2_,
               "length":_loc1_,
               "type":_loc3_
            });
         }
      }
      
      private function readSignature() : Boolean
      {
         return input.readUnsignedInt() == 2303741511 && input.readUnsignedInt() == 218765834;
      }
      
      private function fixType(param1:uint) : String
      {
         var _loc2_:String = "";
         var _loc3_:String = param1.toString(16);
         while(_loc3_.length < 8)
         {
            _loc3_ = "0" + _loc3_;
         }
         _loc2_ += String.fromCharCode(parseInt(_loc3_.substr(0,2),16));
         _loc2_ += String.fromCharCode(parseInt(_loc3_.substr(2,2),16));
         _loc2_ += String.fromCharCode(parseInt(_loc3_.substr(4,2),16));
         return _loc2_ + String.fromCharCode(parseInt(_loc3_.substr(6,2),16));
      }
   }
}
