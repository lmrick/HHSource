package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1374 implements IMessageParser
   {
       
      
      private var var_984:int;
      
      private var _requesterName:String;
      
      private var var_1219:String;
      
      private var var_1084:int;
      
      private var _guideName:String;
      
      private var var_1036:String;
      
      public function class_1374()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_984 = param1.readInteger();
         _requesterName = param1.readString();
         var_1219 = param1.readString();
         var_1084 = param1.readInteger();
         _guideName = param1.readString();
         var_1036 = param1.readString();
         return true;
      }
      
      public function get requesterUserId() : int
      {
         return var_984;
      }
      
      public function get requesterName() : String
      {
         return _requesterName;
      }
      
      public function get requesterFigure() : String
      {
         return var_1219;
      }
      
      public function get guideUserId() : int
      {
         return var_1084;
      }
      
      public function get guideName() : String
      {
         return _guideName;
      }
      
      public function get guideFigure() : String
      {
         return var_1036;
      }
   }
}
