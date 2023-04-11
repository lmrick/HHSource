package com.probertson.utils
{
   import flash.utils.ByteArray;
   
   public class GZIPFile
   {
       
      
      private var _gzipFileName:String;
      
      private var var_475:ByteArray;
      
      private var _headerFileName:String;
      
      private var _headerComment:String;
      
      private var _fileModificationTime:Date;
      
      private var var_685:uint;
      
      public function GZIPFile(param1:ByteArray, param2:uint, param3:Date, param4:String = "", param5:String = null, param6:String = null)
      {
         super();
         var_475 = param1;
         var_685 = param2;
         _fileModificationTime = param3;
         _gzipFileName = param4;
         _headerFileName = param5;
         _headerComment = param6;
      }
      
      public function get gzipFileName() : String
      {
         return _gzipFileName;
      }
      
      public function get headerFileName() : String
      {
         return _headerFileName;
      }
      
      public function get headerComment() : String
      {
         return _headerComment;
      }
      
      public function get fileModificationTime() : Date
      {
         return _fileModificationTime;
      }
      
      public function get originalFileSize() : uint
      {
         return var_685;
      }
      
      public function getCompressedData() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         var_475.position = 0;
         var_475.readBytes(_loc1_,0,var_475.length);
         return _loc1_;
      }
   }
}
