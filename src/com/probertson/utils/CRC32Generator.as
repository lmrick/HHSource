package com.probertson.utils
{
   import flash.utils.ByteArray;
   
   public class CRC32Generator
   {
      
      private static var var_634:Array;
      
      private static var var_820:Boolean = false;
       
      
      public function CRC32Generator()
      {
         super();
      }
      
      private static function makeCRCTable() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var_634 = new Array(256);
         _loc2_ = 0;
      
         while(_loc2_ < 256)
         {
            _loc1_ = uint(_loc2_);
            _loc3_ = 0;
          
            while(_loc3_ < 8)
            {
               if((_loc1_ & 1) != 0)
               {
                  _loc1_ = uint(3988292384 ^ _loc1_ >>> 1);
               }
            
               else
               {
                  _loc1_ >>>= 1;
               }
               _loc3_++;
            }
            var_634[_loc2_] = _loc1_;
            _loc2_++;
         }
         var_820 = true;
      }
      
      public function generateCRC32(param1:ByteArray) : uint
      {
         var _loc4_:int = 0;
         
         if(!var_820)
         {
            makeCRCTable();
         }
         var _loc2_:* = 4294967295;
         var _loc3_:int = int(param1.length);
         _loc4_ = 0;
     
         while(_loc4_ < _loc3_)
         {
            _loc2_ = uint(0 ^ _loc2_ >>> 8);
            _loc4_++;
         }
         _loc2_ = uint(~_loc2_);
        
         return _loc2_ & 4294967295;
      }
   }
}
