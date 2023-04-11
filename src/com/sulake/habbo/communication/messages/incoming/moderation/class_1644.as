package package_50
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import flash.utils.Dictionary;
   
   [SecureSWF(rename="true")]
   public class class_1644
   {
      
      public static const const_184:int = 0;
      
      public static const const_262:int = 1;
      
      public static const const_272:int = 2;
      
      public static const const_233:int = 3;
      
      public static const const_75:int = 4;
      
      public static const TYPE_SELFIE:int = 5;
      
      public static const const_295:int = 6;
       
      
      private var var_1205:int;
      
      private var _context:Dictionary;
      
      private var var_587:Array;
      
      public function class_1644(param1:IMessageDataWrapper)
      {
         var _loc4_:int = 0;
         var _loc3_:String = null;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         _context = new Dictionary();
         var_587 = [];
         super();
         var_1205 = param1.readByte();
         var _loc2_:int = param1.readShort();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1.readString();
            switch(_loc6_ = param1.readByte())
            {
               case 0:
                  _context[_loc3_] = param1.readBoolean();
                  break;
               case 1:
                  _context[_loc3_] = param1.readInteger();
                  break;
               case 2:
                  _context[_loc3_] = param1.readString();
                  break;
               default:
                  throw new Error("Unknown data type " + _loc6_);
            }
            _loc4_++;
         }
         var _loc7_:int = param1.readShort();
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            var_587.push(new class_1660(param1));
            _loc5_++;
         }
      }
      
      public function get recordType() : int
      {
         return var_1205;
      }
      
      public function get context() : Dictionary
      {
         return _context;
      }
      
      public function get chatlog() : Array
      {
         return var_587;
      }
      
      public function get roomId() : int
      {
         return getInt("roomId");
      }
      
      public function get roomName() : String
      {
         return _context["roomName"] as String;
      }
      
      public function get groupId() : int
      {
         return getInt("groupId");
      }
      
      public function get threadId() : int
      {
         return getInt("threadId");
      }
      
      public function get messageId() : int
      {
         return getInt("messageId");
      }
      
      private function getInt(param1:String) : int
      {
         var _loc2_:* = _context[param1];
         if(_loc2_ == null)
         {
            return 0;
         }
         return _loc2_ as int;
      }
   }
}
