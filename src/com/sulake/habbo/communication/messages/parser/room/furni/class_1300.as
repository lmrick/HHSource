package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1300 implements IMessageParser
   {
       
      
      private var var_490:int;
      
      private var var_308:Vector.<package_136.class_1618>;
      
      private var var_1189:String;
      
      public function class_1300()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_308 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:String = null;
         var _loc6_:String = null;
         var _loc5_:String = null;
         var_490 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         var_308 = new Vector.<package_136.class_1618>(0);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.readString();
            _loc6_ = param1.readString();
            _loc5_ = param1.readString();
            var_308.push(new package_136.class_1618(_loc2_,_loc6_,_loc5_));
            _loc4_++;
         }
         var_1189 = param1.readString();
         return true;
      }
      
      public function get furniId() : int
      {
         return var_490;
      }
      
      public function get playlists() : Vector.<package_136.class_1618>
      {
         return var_308;
      }
      
      public function get selectedPlaylistId() : String
      {
         return var_1189;
      }
   }
}
