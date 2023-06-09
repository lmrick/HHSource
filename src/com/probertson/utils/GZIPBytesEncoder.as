package com.probertson.utils
{
   import flash.errors.IllegalOperationError;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   
   public class GZIPBytesEncoder
   {
       
      
      public function GZIPBytesEncoder()
      {
         super();
      }
      
      public function compressToByteArray(param1:ByteArray, param2:Date = null) : ByteArray
      {
         var _loc3_:* = 0;
      
         if(param1 == null)
         {
            throw new ArgumentError("src can\'t be null.");
         }
     
         var _loc12_:uint = param1.position;
         var _loc14_:ByteArray;
         (_loc14_ = new ByteArray()).writeBytes(param1);
      
         var _loc6_:ByteArray;
         (_loc6_ = new ByteArray()).endian = "littleEndian";
         _loc6_.writeByte(31);
         _loc6_.writeByte(139);
         _loc6_.writeByte(8);
     
         var _loc4_:int = 0;
         _loc6_.writeByte(_loc4_);
        
         var _loc7_:uint = param2 == null ? 0 : param2.time;
         _loc6_.writeUnsignedInt(_loc7_);
        
         var _loc15_:Number = 0;
         _loc6_.writeByte(_loc15_);
       
         if(Capabilities.os.indexOf("Windows") >= 0)
         {
            _loc3_ = 11;
         }
       
         else if(Capabilities.os.indexOf("Mac OS") >= 0)
         {
            _loc3_ = 7;
         }
     
         else
         {
            _loc3_ = 3;
         }
         _loc6_.writeByte(_loc3_);
    
         var _loc8_:CRC32Generator;
         var _loc13_:uint = (_loc8_ = new CRC32Generator()).generateCRC32(_loc14_);
         var _loc11_:uint = _loc14_.length % Math.pow(2,32);
         _loc14_.deflate();
         _loc6_.writeBytes(_loc14_,0,_loc14_.length);
         _loc6_.writeUnsignedInt(_loc13_);
         _loc6_.writeUnsignedInt(_loc11_);
         return _loc6_;
      }
      
      public function uncompressToByteArray(param1:ByteArray) : ByteArray
      {
         var _loc3_:GZIPFile = null;
         _loc3_ = parseGZIPData(param1);
         var _loc2_:ByteArray = _loc3_.getCompressedData();
         try
         {
            _loc2_.inflate();
         }
         catch(error:Error)
         {
            throw new IllegalOperationError("The specified source is not a GZIP file format file or data.");
         }
         return _loc2_;
      }
      
      public function parseGZIPData(param1:ByteArray, param2:String = "") : GZIPFile
      {
         var _loc9_:String = null;
         var _loc4_:ByteArray = null;
         var _loc17_:String = null;
         var _loc24_:ByteArray = null;
         var _loc12_:int = 0;
         if(param1 == null)
         {
            throw new ArgumentError("The srcBytes ByteArray can\'t be null.");
         }
         param1.endian = "littleEndian";
         var _loc23_:uint;
         if((_loc23_ = param1.readUnsignedByte()) != 31)
         {
            throw new IllegalOperationError("The specified data is not in GZIP file format structure.");
         }
         var _loc21_:uint;
         if((_loc21_ = param1.readUnsignedByte()) != 139)
         {
            throw new IllegalOperationError("The specified data is not in GZIP file format structure.");
         }
         var _loc20_:uint;
         if((_loc20_ = param1.readUnsignedByte()) != 8)
         {
            throw new IllegalOperationError("The specified data is not in GZIP file format structure.");
         }
         var _loc6_:int;
         var _loc13_:* = ((_loc6_ = param1.readByte()) >> 7 & 1) == 1;
         var _loc18_:* = (_loc6_ >> 6 & 1) == 1;
         var _loc15_:* = (_loc6_ >> 5 & 1) == 1;
         var _loc22_:* = (_loc6_ >> 4 & 1) == 1;
         var _loc3_:* = (_loc6_ >> 3 & 1) == 1;
         var _loc8_:Boolean = false;
         _loc8_ = (_loc6_ >> 2 & 1) == 1 ? true : _loc8_;
         _loc8_ = (_loc6_ >> 1 & 1) == 1 ? true : _loc8_;
         if(_loc8_ = (_loc6_ & 1) == 1 ? true : _loc8_)
         {
            throw new IllegalOperationError("The specified data is not in GZIP file format structure.");
         }
         var _loc7_:uint = param1.readUnsignedInt();
         var _loc25_:uint = param1.readUnsignedByte();
         var _loc16_:uint = param1.readUnsignedByte();
         if(_loc15_)
         {
            _loc9_ = param1.readUTF();
         }
         var _loc14_:String = null;
         if(_loc22_)
         {
            _loc4_ = new ByteArray();
            while(param1.readUnsignedByte() != 0)
            {
               param1.position -= 1;
               _loc4_.writeByte(param1.readByte());
            }
            _loc4_.position = 0;
            _loc14_ = _loc4_.readUTFBytes(_loc4_.length);
         }
         if(_loc3_)
         {
            _loc24_ = new ByteArray();
            while(param1.readUnsignedByte() != 0)
            {
               param1.position -= 1;
               _loc24_.writeByte(param1.readByte());
            }
            _loc24_.position = 0;
            _loc17_ = _loc24_.readUTFBytes(_loc24_.length);
         }
         if(_loc18_)
         {
            _loc12_ = int(param1.readUnsignedShort());
         }
         var _loc19_:int = param1.length - param1.position - 8;
         var _loc5_:ByteArray = new ByteArray();
         param1.readBytes(_loc5_,0,_loc19_);
         var _loc11_:uint = param1.readUnsignedInt();
         var _loc10_:uint = param1.readUnsignedInt();
         return new GZIPFile(_loc5_,_loc10_,new Date(_loc7_),param2,_loc14_,_loc17_);
      }
   }
}
