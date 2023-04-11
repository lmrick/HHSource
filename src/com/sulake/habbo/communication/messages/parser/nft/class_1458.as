package package_163
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1458 implements IMessageParser
   {
       
      
      private var _nftAvatars:Array;
      
      public function class_1458()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _nftAvatars = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _nftAvatars.push(new NftWardrobeItem(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get nftAvatars() : Array
      {
         return _nftAvatars;
      }
   }
}
