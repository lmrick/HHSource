package deng.fzip
{
   import flash.utils.*;

   public class FZipFile
   {

      public static const COMPRESSION_NONE:int = 0;

      public static const COMPRESSION_SHRUNK:int = 1;

      public static const COMPRESSION_REDUCED_1:int = 2;

      public static const COMPRESSION_REDUCED_2:int = 3;

      public static const COMPRESSION_REDUCED_3:int = 4;

      public static const COMPRESSION_REDUCED_4:int = 5;

      public static const COMPRESSION_IMPLODED:int = 6;

      public static const COMPRESSION_TOKENIZED:int = 7;

      public static const COMPRESSION_DEFLATED:int = 8;

      public static const COMPRESSION_DEFLATED_EXT:int = 9;

      public static const COMPRESSION_IMPLODED_PKWARE:int = 10;

      protected static var HAS_UNCOMPRESS:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").parameter.length() > 0;

      protected static var var_295:Boolean = describeType(ByteArray).factory.method.(@name == "inflate").length() > 0;

      protected var var_572:int = 0;

      protected var _versionNumber:String = "2.0";

      protected var var_144:int = 8;

      protected var var_611:Boolean = false;

      protected var var_1354:int = -1;

      protected var var_1360:int = -1;

      protected var _deflateSpeedOption:int = -1;

      protected var var_376:Boolean = false;

      protected var var_1293:Boolean = false;

      protected var var_156:Date;

      protected var _adler32:uint;

      protected var _hasAdler32:Boolean = false;

      protected var _sizeFilename:uint = 0;

      protected var var_411:uint = 0;

      protected var _filename:String = "";

      protected var var_77:String;

      protected var var_566:Dictionary;

      protected var var_862:String = "";

      protected var _content:ByteArray;

      internal var _crc32:uint;

      internal var _sizeCompressed:uint = 0;

      internal var _sizeUncompressed:uint = 0;

      protected var isCompressed:Boolean = false;

      protected var var_23:Function;

      public function FZipFile(param1:String = "utf-8")
      {
         var_23 = parseFileHead;
         super();
         var_77 = param1;
         var_566 = new Dictionary();
         _content = new ByteArray();
         _content.endian = "bigEndian";
      }

      public function get date():Date
      {
         return var_156;
      }

      public function set date(param1:Date):void
      {
         var_156 = param1 != null ? param1 : new Date();
      }

      public function get filename():String
      {
         return _filename;
      }

      public function set filename(param1:String):void
      {
         _filename = param1;
      }

      internal function get hasDataDescriptor():Boolean
      {
         return var_376;
      }

      public function get content():ByteArray
      {
         if (isCompressed)
         {
            uncompress();
         }
         return _content;
      }

      public function set content(param1:ByteArray):void
      {
         setContent(param1);
      }

      public function setContent(param1:ByteArray, param2:Boolean = true):void
      {
         if (param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(_content, 0, param1.length);
            _crc32 = class_994.CRC32(_content);
            _hasAdler32 = false;
         }
         else
         {
            _content.length = 0;
            _content.position = 0;
            isCompressed = false;
         }
         if (param2)
         {
            compress();
         }
         else
         {
            _sizeUncompressed = _sizeCompressed = _content.length;
         }
      }

      public function get versionNumber():String
      {
         return _versionNumber;
      }

      public function get sizeCompressed():uint
      {
         return _sizeCompressed;
      }

      public function get sizeUncompressed():uint
      {
         return _sizeUncompressed;
      }

      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8"):String
      {
         var _loc3_:String = null;
         if (isCompressed)
         {
            uncompress();
         }
         _content.position = 0;
         if (param2 == "utf-8")
         {
            _loc3_ = _content.readUTFBytes(_content.bytesAvailable);
         }
         else
         {
            _loc3_ = _content.readMultiByte(_content.bytesAvailable, param2);
         }
         _content.position = 0;
         if (param1)
         {
            compress();
         }
         return _loc3_;
      }

      public function setContentAsString(param1:String, param2:String = "utf-8", param3:Boolean = true):void
      {
         _content.length = 0;
         _content.position = 0;
         isCompressed = false;
         if (param1 != null && param1.length > 0)
         {
            if (param2 == "utf-8")
            {
               _content.writeUTFBytes(param1);
            }
            else
            {
               _content.writeMultiByte(param1, param2);
            }
            _crc32 = class_994.CRC32(_content);
            _hasAdler32 = false;
         }
         if (param3)
         {
            compress();
         }
         else
         {
            _sizeUncompressed = _sizeCompressed = _content.length;
         }
      }

      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0):uint
      {
         var _loc7_:ByteArray = null;
         var _loc14_:Boolean = false;
         if (param1 == null)
         {
            return 0;
         }
         if (param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_572 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_572 << 8 | 20);
         param1.writeShort(var_77 == "utf-8" ? 2048 : 0);
         param1.writeShort(isCompressed ? 8 : 0);
         var _loc6_:Date;
         var _loc11_:uint = uint(uint((_loc6_ = var_156 != null ? var_156 : new Date()).getSeconds()) | uint(_loc6_.getMinutes()) << 5 | uint(_loc6_.getHours()) << 11);
         var _loc8_:uint = uint(uint(_loc6_.getDate()) | uint(_loc6_.getMonth() + 1) << 5 | uint(_loc6_.getFullYear() - 1980) << 9);
         param1.writeShort(_loc11_);
         param1.writeShort(_loc8_);
         param1.writeUnsignedInt(_crc32);
         param1.writeUnsignedInt(_sizeCompressed);
         param1.writeUnsignedInt(_sizeUncompressed);
         var _loc16_:ByteArray;
         (_loc16_ = new ByteArray()).endian = "littleEndian";
         if (var_77 == "utf-8")
         {
            _loc16_.writeUTFBytes(_filename);
         }
         else
         {
            _loc16_.writeMultiByte(_filename, var_77);
         }
         var _loc9_:uint = _loc16_.position;
         for (var _loc10_ in var_566)
         {
            if ((_loc7_ = var_566[_loc10_] as ByteArray) != null)
            {
               _loc16_.writeShort(uint(_loc10_));
               _loc16_.writeShort(_loc7_.length);
               _loc16_.writeBytes(_loc7_);
            }
         }
         if (param2)
         {
            if (!_hasAdler32)
            {
               if (_loc14_ = isCompressed)
               {
                  uncompress();
               }
               _adler32 = class_994.Adler32(_content, 0, _content.length);
               _hasAdler32 = true;
               if (_loc14_)
               {
                  compress();
               }
            }
            _loc16_.writeShort(56026);
            _loc16_.writeShort(4);
            _loc16_.writeUnsignedInt(_adler32);
         }
         var _loc15_:uint = uint(_loc16_.position - _loc9_);
         if (param3 && false)
         {
            if (var_77 == "utf-8")
            {
               _loc16_.writeUTFBytes(var_862);
            }
            else
            {
               _loc16_.writeMultiByte(var_862, var_77);
            }
         }
         var _loc5_:uint = uint(_loc16_.position - _loc9_ - _loc15_);
         param1.writeShort(_loc9_);
         param1.writeShort(_loc15_);
         if (param3)
         {
            param1.writeShort(_loc5_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if (_loc9_ + _loc15_ + _loc5_ > 0)
         {
            param1.writeBytes(_loc16_);
         }
         var _loc13_:Number = 0;
         if (!param3 && false)
         {
            if (isCompressed)
            {
               if (HAS_UNCOMPRESS || var_295)
               {
                  _loc13_ = 0;
                  param1.writeBytes(_content, 0, _loc13_);
               }
               else
               {
                  _loc13_ = 4294967290;
                  param1.writeBytes(_content, 2, _loc13_);
               }
            }
            else
            {
               _loc13_ = 0;
               param1.writeBytes(_content, 0, _loc13_);
            }
         }
         var _loc12_:uint = 30 + _loc9_ + _loc15_ + _loc5_ + _loc13_;
         if (param3)
         {
            _loc12_ += 16;
         }
         return _loc12_;
      }

      internal function parse(param1:IDataInput):Boolean
      {
         while (param1.bytesAvailable && var_23(param1))
         {
         }
         return var_23 === parseFileIdle;
      }

      protected function parseFileIdle(param1:IDataInput):Boolean
      {
         return false;
      }

      protected function parseFileHead(param1:IDataInput):Boolean
      {
         if (param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if (_sizeFilename + var_411 > 0)
            {
               var_23 = parseFileHeadExt;
            }
            else
            {
               var_23 = parseFileContent;
            }
            return true;
         }
         return false;
      }

      protected function parseFileHeadExt(param1:IDataInput):Boolean
      {
         if (param1.bytesAvailable >= _sizeFilename + var_411)
         {
            parseHeadExt(param1);
            var_23 = parseFileContent;
            return true;
         }
         return false;
      }

      protected function parseFileContent(param1:IDataInput):Boolean
      {
         var _loc2_:Boolean = true;
         if (var_376)
         {
            var_23 = parseFileIdle;
            _loc2_ = false;
         }
         else if (_sizeCompressed == 0)
         {
            var_23 = parseFileIdle;
         }
         else if (param1.bytesAvailable >= _sizeCompressed)
         {
            parseContent(param1);
            var_23 = parseFileIdle;
         }
         else
         {
            _loc2_ = false;
         }
         return _loc2_;
      }

      protected function parseHead(param1:IDataInput):void
      {
         var _loc9_:uint;
         var_572 = (_loc9_ = uint(param1.readUnsignedShort())) >> 8;
         _versionNumber = Math.floor((_loc9_ & 255) / 10) + "." + (_loc9_ & 255) % 10;
         var _loc4_:uint = uint(param1.readUnsignedShort());
         var_144 = param1.readUnsignedShort();
         var_611 = (_loc4_ & 1) !== 0;
         var_376 = (_loc4_ & 8) !== 0;
         var_1293 = (_loc4_ & 32) !== 0;
         if ((_loc4_ & 800) !== 0)
         {
            var_77 = "utf-8";
         }
         if (var_144 === 6)
         {
            var_1354 = (_loc4_ & 2) !== 0 ? 8192 : 4096;
            var_1360 = (_loc4_ & 4) !== 0 ? 3 : 2;
         }
         else if (var_144 === 8)
         {
            _deflateSpeedOption = (_loc4_ & 6) >> 1;
         }
         var _loc2_:uint = uint(param1.readUnsignedShort());
         var _loc10_:uint = uint(param1.readUnsignedShort());
         var _loc3_:* = _loc2_ & 31;
         var _loc5_:* = (_loc2_ & 2016) >> 5;
         var _loc6_:* = (_loc2_ & 63488) >> 11;
         var _loc11_:* = _loc10_ & 31;
         var _loc7_:* = (_loc10_ & 480) >> 5;
         var _loc8_:int = ((_loc10_ & 65024) >> 9) + 1980;
         var_156 = new Date(_loc8_, _loc7_ - 1, _loc11_, _loc6_, _loc5_, _loc3_, 0);
         _crc32 = param1.readUnsignedInt();
         _sizeCompressed = param1.readUnsignedInt();
         _sizeUncompressed = param1.readUnsignedInt();
         _sizeFilename = param1.readUnsignedShort();
         var_411 = param1.readUnsignedShort();
      }

      protected function parseHeadExt(param1:IDataInput):void
      {
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc2_:ByteArray = null;
         if (var_77 == "utf-8")
         {
            _filename = param1.readUTFBytes(_sizeFilename);
         }
         else
         {
            _filename = param1.readMultiByte(_sizeFilename, var_77);
         }
         var _loc3_:uint = var_411;
         while (_loc3_ > 4)
         {
            _loc5_ = uint(param1.readUnsignedShort());
            if ((_loc4_ = uint(param1.readUnsignedShort())) > _loc3_)
            {
               throw new Error("Parse error in file " + _filename + ": Extra field data size too big.");
            }
            if (_loc5_ === 56026 && _loc4_ === 4)
            {
               _adler32 = param1.readUnsignedInt();
               _hasAdler32 = true;
            }
            else if (_loc4_ > 0)
            {
               _loc2_ = new ByteArray();
               param1.readBytes(_loc2_, 0, _loc4_);
               var_566[_loc5_] = _loc2_;
            }
            _loc3_ -= _loc4_ + 4;
         }
         if (_loc3_ > 0)
         {
            param1.readBytes(new ByteArray(), 0, _loc3_);
         }
      }

      internal function parseContent(param1:IDataInput):void
      {
         var _loc2_:* = 0;
         if (var_144 === 8 && !var_611)
         {
            if (HAS_UNCOMPRESS || var_295)
            {
               param1.readBytes(_content, 0, _sizeCompressed);
            }
            else
            {
               if (!_hasAdler32)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               _content.writeByte(120);
               _loc2_ = uint(~_deflateSpeedOption << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               _content.writeByte(_loc2_);
               param1.readBytes(_content, 2, _sizeCompressed);
               _content.position = _content.length;
               _content.writeUnsignedInt(_adler32);
            }
            isCompressed = true;
         }
         else
         {
            if (var_144 != 0)
            {
               throw new Error("Compression method " + var_144 + " is not supported.");
            }
            param1.readBytes(_content, 0, _sizeCompressed);
            isCompressed = false;
         }
         _content.position = 0;
      }

      protected function compress():void
      {
         if (!isCompressed)
         {
            if (false)
            {
               _content.position = 0;
               _sizeUncompressed = _content.length;
               if (var_295)
               {
                  _content.deflate();
                  _sizeCompressed = _content.length;
               }
               else if (HAS_UNCOMPRESS)
               {
                  _content.compress.apply(_content, ["deflate"]);
                  _sizeCompressed = _content.length;
               }
               else
               {
                  _content.compress();
                  _sizeCompressed = -6;
               }
               _content.position = 0;
               isCompressed = true;
            }
            else
            {
               _sizeCompressed = 0;
               _sizeUncompressed = 0;
            }
         }
      }

      protected function uncompress():void
      {
         if (isCompressed && false)
         {
            _content.position = 0;
            if (var_295)
            {
               _content.inflate();
            }
            else if (HAS_UNCOMPRESS)
            {
               _content.uncompress.apply(_content, ["deflate"]);
            }
            else
            {
               _content.uncompress();
            }
            _content.position = 0;
            isCompressed = false;
         }
      }

      public function toString():String
      {
         return "[FZipFile]\n  name:" + _filename + "\n  date:" + var_156 + "\n  sizeCompressed:" + _sizeCompressed + "\n  sizeUncompressed:" + _sizeUncompressed + "\n  versionHost:" + var_572 + "\n  versionNumber:" + _versionNumber + "\n  compressionMethod:" + var_144 + "\n  encrypted:" + var_611 + "\n  hasDataDescriptor:" + var_376 + "\n  hasCompressedPatchedData:" + var_1293 + "\n  filenameEncoding:" + var_77 + "\n  crc32:" + _crc32.toString(16) + "\n  adler32:" + _adler32.toString(16);
      }
   }
}
