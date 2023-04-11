package package_18
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import package_11.class_1569;
   
   [SecureSWF(rename="true")]
   public class class_1656
   {
      
      public static const const_397:int = 0;
      
      public static const const_180:int = 1;
      
      public static const const_332:int = 2;
       
      
      private var var_932:String;
      
      private var _text:String;
      
      private var var_788:int;
      
      private var var_1086:Boolean;
      
      private var var_514:int;
      
      private var _guestRooms:Vector.<class_1569>;
      
      public function class_1656(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         _guestRooms = new Vector.<class_1569>(0);
         super();
         var_932 = param1.readString();
         _text = param1.readString();
         var_788 = param1.readInteger();
         var_1086 = param1.readBoolean();
         var_514 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _guestRooms.push(new class_1569(param1));
            _loc3_++;
         }
      }
      
      public function get guestRooms() : Vector.<class_1569>
      {
         return _guestRooms;
      }
      
      public function get searchCode() : String
      {
         return var_932;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function get actionAllowed() : int
      {
         return var_788;
      }
      
      public function get forceClosed() : Boolean
      {
         return var_1086;
      }
      
      public function get viewMode() : int
      {
         return var_514;
      }
      
      public function set viewMode(param1:int) : void
      {
         var_514 = param1;
      }
      
      public function findGuestRoom(param1:int) : class_1569
      {
         for each(var _loc2_ in _guestRooms)
         {
            if(_loc2_.flatId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
