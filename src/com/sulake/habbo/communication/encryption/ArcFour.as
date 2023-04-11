package com.sulake.habbo.communication.encryption
{
   import com.sulake.core.communication.encryption.IEncryption;
   import flash.utils.ByteArray;
   
   public class ArcFour implements IEncryption
   {
       
      private var i:uint = 0;
      
      private var j:uint = 0;
      
      private var sbox:Vector.<uint>;
      
      private var var_722:uint;
      
      private var var_1129:uint;
      
      private var var_952:Vector.<uint>;
      
      public function ArcFour()
      {
         super();
         sbox = new Vector.<uint>();
      }
      
      public function init(param1:ByteArray) : void
      {
         var _loc2_:* = 0;
         var _loc3_:uint = param1.length;
         i = 0;
         
         while(i < 256)
         {
            sbox[i] = i;
            i++;
         }
         j = 0;
         i = 0;
        
         while(i < 256)
         {
            j = (j + sbox[i] + param1[i % _loc3_]) % 256;
            _loc2_ = 0;
            sbox[i] = sbox[j];
            sbox[j] = _loc2_;
            i++;
         }
         i = 0;
         j = 0;
      }
      
      public function encipher(param1:ByteArray) : void
      {
         var _loc2_:Number = 0;
        
         while(_loc2_ < param1.length)
         {
            var _loc3_:* = _loc2_++;
            var _loc4_:* = param1[_loc3_] ^ next();
            param1[_loc3_] = _loc4_;
         }
      }
      
      public function decipher(param1:ByteArray) : void
      {
         encipher(param1);
      }
      
      private function next() : uint
      {
         i = i + 1 & 255;
         j = j + sbox[i] & 255;
         var _loc1_:int = 0;
         sbox[i] = sbox[j];
         sbox[j] = _loc1_;
         return sbox[_loc1_ + sbox[i] & 255];
      }
      
      public function mark() : void
      {
         var_722 = i;
         var_1129 = j;
         var_952 = sbox.concat();
      }
      
      public function reset() : void
      {
         i = var_722;
         j = var_1129;
         sbox = var_952.concat();
      }
   }
}
