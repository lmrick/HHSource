package deng.fzip
{
   import flash.events.*;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.*;
   
   public class FZip extends EventDispatcher
   {
      
      internal static const SIG_CENTRAL_FILE_HEADER:uint = 33639248;
      
      internal static const SIG_SPANNING_MARKER:uint = 808471376;
      
      internal static const SIG_LOCAL_FILE_HEADER:uint = 67324752;
      
      internal static const SIG_DIGITAL_SIGNATURE:uint = 84233040;
      
      internal static const SIG_END_OF_CENTRAL_DIRECTORY:uint = 101010256;
      
      internal static const SIG_ZIP64_END_OF_CENTRAL_DIRECTORY:uint = 101075792;
      
      internal static const SIG_ZIP64_END_OF_CENTRAL_DIRECTORY_LOCATOR:uint = 117853008;
      
      internal static const SIG_DATA_DESCRIPTOR:uint = 134695760;
      
      internal static const SIG_ARCHIVE_EXTRA_DATA:uint = 134630224;
      
      internal static const SIG_SPANNING:uint = 134695760;
       
      
      protected var var_18:Array;
      
      protected var var_38:Dictionary;
      
      protected var var_27:URLStream;
      
      protected var var_985:String;
      
      protected var var_23:Function;
      
      protected var currentFile:deng.fzip.FZipFile;
      
      protected var var_87:ByteArray;
      
      protected var var_283:uint;
      
      protected var var_1346:uint;
      
      public function FZip(param1:String = "utf-8")
      {
         super();
         var_985 = param1;
         var_23 = parseIdle;
      }
      
      public function get active() : Boolean
      {
         return var_23 !== parseIdle;
      }
      
      public function load(param1:URLRequest) : void
      {
         if(!var_27 && var_23 == parseIdle)
         {
            var_27 = new URLStream();
            var_27.endian = "littleEndian";
            addEventHandlers();
            var_18 = [];
            var_38 = new Dictionary();
            var_23 = parseSignature;
            var_27.load(param1);
         }
      }
      
      public function loadBytes(param1:ByteArray) : void
      {
         if(!var_27 && var_23 == parseIdle)
         {
            var_18 = [];
            var_38 = new Dictionary();
            param1.position = 0;
            param1.endian = "littleEndian";
            var_23 = parseSignature;
            if(parse(param1))
            {
               var_23 = parseIdle;
               dispatchEvent(new Event("complete"));
            }
            else
            {
               dispatchEvent(new FZipErrorEvent("parseError","EOF"));
            }
         }
      }
      
      public function close() : void
      {
         if(var_27)
         {
            var_23 = parseIdle;
            removeEventHandlers();
            var_27.close();
            var_27 = null;
         }
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean = false) : void
      {
         var _loc7_:String = null;
         var _loc8_:ByteArray = null;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc3_:deng.fzip.FZipFile = null;
         if(param1 != null && false)
         {
            _loc7_ = String(param1.endian);
            _loc8_ = new ByteArray();
            _loc8_.endian = "littleEndian";
            param1.endian = "littleEndian";
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < var_18.length)
            {
               _loc3_ = var_18[_loc6_] as deng.fzip.FZipFile;
               if(_loc3_ != null)
               {
                  _loc3_.serialize(_loc8_,param2,true,_loc4_);
                  _loc4_ += _loc3_.serialize(param1,param2);
                  _loc5_++;
               }
               _loc6_++;
            }
            if(_loc8_.length > 0)
            {
               param1.writeBytes(_loc8_);
            }
            param1.writeUnsignedInt(101010256);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeShort(_loc5_);
            param1.writeShort(_loc5_);
            param1.writeUnsignedInt(_loc8_.length);
            param1.writeUnsignedInt(_loc4_);
            param1.writeShort(0);
            param1.endian = _loc7_;
         }
      }
      
      public function getFileCount() : uint
      {
         return !!var_18 ? var_18.length : 0;
      }
      
      public function getFileAt(param1:uint) : deng.fzip.FZipFile
      {
         return !!var_18 ? var_18[param1] as deng.fzip.FZipFile : null;
      }
      
      public function getFileByName(param1:String) : deng.fzip.FZipFile
      {
         return !!var_38[param1] ? var_38[param1] as deng.fzip.FZipFile : null;
      }
      
      public function addFile(param1:String, param2:ByteArray = null, param3:Boolean = true) : deng.fzip.FZipFile
      {
         return addFileAt(!!var_18 ? var_18.length : 0,param1,param2,param3);
      }
      
      public function addFileFromString(param1:String, param2:String, param3:String = "utf-8", param4:Boolean = true) : deng.fzip.FZipFile
      {
         return addFileFromStringAt(!!var_18 ? var_18.length : 0,param1,param2,param3,param4);
      }
      
      public function addFileAt(param1:uint, param2:String, param3:ByteArray = null, param4:Boolean = true) : deng.fzip.FZipFile
      {
         if(var_18 == null)
         {
            var_18 = [];
         }
         if(var_38 == null)
         {
            var_38 = new Dictionary();
         }
         else if(false)
         {
            throw new Error("File already exists: " + param2 + ". Please remove first.");
         }
         var _loc5_:deng.fzip.FZipFile;
         (_loc5_ = new deng.fzip.FZipFile()).filename = param2;
         _loc5_.setContent(param3,param4);
         if(param1 >= var_18.length)
         {
            var_18.push(_loc5_);
         }
         else
         {
            var_18.splice(param1,0,_loc5_);
         }
         var_38[param2] = _loc5_;
         return _loc5_;
      }
      
      public function addFileFromStringAt(param1:uint, param2:String, param3:String, param4:String = "utf-8", param5:Boolean = true) : deng.fzip.FZipFile
      {
         if(var_18 == null)
         {
            var_18 = [];
         }
         if(var_38 == null)
         {
            var_38 = new Dictionary();
         }
         else if(false)
         {
            throw new Error("File already exists: " + param2 + ". Please remove first.");
         }
         var _loc6_:deng.fzip.FZipFile;
         (_loc6_ = new deng.fzip.FZipFile()).filename = param2;
         _loc6_.setContentAsString(param3,param4,param5);
         if(param1 >= var_18.length)
         {
            var_18.push(_loc6_);
         }
         else
         {
            var_18.splice(param1,0,_loc6_);
         }
         var_38[param2] = _loc6_;
         return _loc6_;
      }
      
      public function removeFileAt(param1:uint) : deng.fzip.FZipFile
      {
         var _loc2_:deng.fzip.FZipFile = null;
         if(var_18 != null && var_38 != null && param1 < var_18.length)
         {
            _loc2_ = var_18[param1] as deng.fzip.FZipFile;
            if(_loc2_ != null)
            {
               var_18.splice(param1,1);
               delete var_38[_loc2_.filename];
               return _loc2_;
            }
         }
         return null;
      }
      
      protected function parse(param1:IDataInput) : Boolean
      {
         while(var_23(param1))
         {
         }
         return var_23 === parseIdle;
      }
      
      protected function parseIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseSignature(param1:IDataInput) : Boolean
      {
         var _loc2_:* = 0;
         if(param1.bytesAvailable >= 4)
         {
            _loc2_ = uint(param1.readUnsignedInt());
            switch(_loc2_)
            {
               case 67324752:
                  var_23 = parseLocalfile;
                  currentFile = new deng.fzip.FZipFile(var_985);
                  break;
               case 33639248:
               case 101010256:
               case 808471376:
               case 84233040:
               case 101075792:
               case 117853008:
               case 134695760:
               case 134630224:
               case 134695760:
                  var_23 = parseIdle;
                  break;
               default:
                  throw new Error("Unknown record signature: 0x" + _loc2_.toString(16));
            }
            return true;
         }
         return false;
      }
      
      protected function parseLocalfile(param1:IDataInput) : Boolean
      {
         if(currentFile.parse(param1))
         {
            if(false)
            {
               var_23 = findDataDescriptor;
               var_87 = new ByteArray();
               var_283 = 0;
               var_1346 = 0;
               return true;
            }
            onFileLoaded();
            if(var_23 != parseIdle)
            {
               var_23 = parseSignature;
               return true;
            }
         }
         return false;
      }
      
      protected function findDataDescriptor(param1:IDataInput) : Boolean
      {
         var _loc2_:* = 0;
         while(param1.bytesAvailable > 0)
         {
            _loc2_ = uint(param1.readUnsignedByte());
            var_283 = var_283 >>> 8 | _loc2_ << 24;
            if(var_283 == 134695760)
            {
               var_87.length = -3;
               var_23 = validateDataDescriptor;
               return true;
            }
            var_87.writeByte(_loc2_);
         }
         return false;
      }
      
      protected function validateDataDescriptor(param1:IDataInput) : Boolean
      {
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         if(param1.bytesAvailable >= 12)
         {
            _loc4_ = uint(param1.readUnsignedInt());
            _loc2_ = uint(param1.readUnsignedInt());
            _loc3_ = uint(param1.readUnsignedInt());
            if(var_87.length == _loc2_)
            {
               var_87.position = 0;
               currentFile._crc32 = _loc4_;
               currentFile._sizeCompressed = _loc2_;
               currentFile._sizeUncompressed = _loc3_;
               currentFile.parseContent(var_87);
               onFileLoaded();
               var_23 = parseSignature;
            }
            else
            {
               var_87.writeUnsignedInt(_loc4_);
               var_87.writeUnsignedInt(_loc2_);
               var_87.writeUnsignedInt(_loc3_);
               var_23 = findDataDescriptor;
            }
            return true;
         }
         return false;
      }
      
      protected function onFileLoaded() : void
      {
         var_18.push(currentFile);
         if(false)
         {
            var_38[currentFile.filename] = currentFile;
         }
         dispatchEvent(new FZipEvent("fileLoaded",currentFile));
         currentFile = null;
      }
      
      protected function progressHandler(param1:Event) : void
      {
         var _loc2_:String = null;
         dispatchEvent(param1.clone());
         try
         {
            if(parse(var_27))
            {
               close();
               dispatchEvent(new Event("complete"));
            }
         }
         catch(e:Error)
         {
            close();
            if(hasEventListener("parseError"))
            {
               dispatchEvent(new FZipErrorEvent("parseError",e.message));
            }
            else
            {
               _loc2_ = "";
               if(var_27 != null)
               {
                  _loc2_ = var_27.toString();
               }
            }
         }
      }
      
      protected function defaultHandler(param1:Event) : void
      {
         dispatchEvent(param1.clone());
      }
      
      protected function defaultErrorHandler(param1:Event) : void
      {
         close();
         dispatchEvent(param1.clone());
      }
      
      protected function addEventHandlers() : void
      {
         var_27.addEventListener("complete",defaultHandler);
         var_27.addEventListener("open",defaultHandler);
         var_27.addEventListener("httpStatus",defaultHandler);
         var_27.addEventListener("ioError",defaultErrorHandler);
         var_27.addEventListener("securityError",defaultErrorHandler);
         var_27.addEventListener("progress",progressHandler);
      }
      
      protected function removeEventHandlers() : void
      {
         var_27.removeEventListener("complete",defaultHandler);
         var_27.removeEventListener("open",defaultHandler);
         var_27.removeEventListener("httpStatus",defaultHandler);
         var_27.removeEventListener("ioError",defaultErrorHandler);
         var_27.removeEventListener("securityError",defaultErrorHandler);
         var_27.removeEventListener("progress",progressHandler);
      }
   }
}
