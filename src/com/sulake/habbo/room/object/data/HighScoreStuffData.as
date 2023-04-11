package com.sulake.habbo.room.object.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.IRoomObjectModelController;
   
   public class HighScoreStuffData extends class_1609 implements IStuffData
   {
      
      public static const FORMAT_KEY:int = 6;
       
      
      private var var_159:String = "";
      
      private var var_279:int = -1;
      
      private var var_248:int = -1;
      
      private var var_83:Vector.<com.sulake.habbo.room.object.data.HighScoreData>;
      
      public function HighScoreStuffData()
      {
         super();
      }
      
      public function get scoreType() : int
      {
         return var_279;
      }
      
      public function get clearType() : int
      {
         return var_248;
      }
      
      public function get entries() : Vector.<com.sulake.habbo.room.object.data.HighScoreData>
      {
         return var_83;
      }
      
      override public function initializeFromIncomingMessage(param1:IMessageDataWrapper) : void
      {
         var _loc5_:int = 0;
         var _loc2_:com.sulake.habbo.room.object.data.HighScoreData = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var_83 = new Vector.<com.sulake.habbo.room.object.data.HighScoreData>();
         var_159 = param1.readString();
         var_279 = param1.readInteger();
         var_248 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = new com.sulake.habbo.room.object.data.HighScoreData();
            _loc2_.score = param1.readInteger();
            _loc4_ = param1.readInteger();
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc2_.addUser(param1.readString());
               _loc6_++;
            }
            var_83.push(_loc2_);
            _loc5_++;
         }
      }
      
      override public function initializeFromRoomObjectModel(param1:IRoomObjectModel) : void
      {
         var _loc4_:int = 0;
         var _loc2_:com.sulake.habbo.room.object.data.HighScoreData = null;
         var_83 = new Vector.<com.sulake.habbo.room.object.data.HighScoreData>();
         super.initializeFromRoomObjectModel(param1);
         var_279 = param1.getNumber("furniture_highscore_score_type");
         var_248 = param1.getNumber("furniture_highscore_clear_type");
         var _loc3_:int = param1.getNumber("furniture_highscore_data_entry_count");
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = new com.sulake.habbo.room.object.data.HighScoreData();
            _loc2_.score = param1.getNumber("furniture_highscore_data_entry_base_score_" + _loc4_);
            _loc2_.users = param1.getStringArray("furniture_highscore_data_entry_base_users_" + _loc4_);
            var_83.push(_loc2_);
            _loc4_++;
         }
      }
      
      override public function writeRoomObjectModel(param1:IRoomObjectModelController) : void
      {
         var _loc3_:int = 0;
         var _loc2_:com.sulake.habbo.room.object.data.HighScoreData = null;
         super.writeRoomObjectModel(param1);
         param1.setNumber("furniture_data_format",6);
         param1.setNumber("furniture_highscore_score_type",var_279);
         param1.setNumber("furniture_highscore_clear_type",var_248);
         if(var_83)
         {
            param1.setNumber("furniture_highscore_data_entry_count",var_83.length);
            _loc3_ = 0;
            while(_loc3_ < var_83.length)
            {
               _loc2_ = var_83[_loc3_];
               param1.setNumber("furniture_highscore_data_entry_base_score_" + _loc3_,_loc2_.score);
               param1.setStringArray("furniture_highscore_data_entry_base_users_" + _loc3_,_loc2_.users);
               _loc3_++;
            }
         }
      }
      
      override public function getLegacyString() : String
      {
         return var_159;
      }
   }
}
