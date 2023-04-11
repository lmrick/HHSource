package package_163
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class NftWardrobeItem
   {
       
      
      private var var_910:String;
      
      private var var_122:String;
      
      private var _figureString:String;
      
      private var var_1414:int;
      
      private var var_1403:int;
      
      private var var_1404:Boolean;
      
      public function NftWardrobeItem(param1:IMessageDataWrapper)
      {
         super();
         var_910 = param1.readString();
         _figureString = param1.readString();
         var_122 = param1.readString();
      }
      
      public function get tokenId() : String
      {
         return var_910;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get figureString() : String
      {
         return _figureString;
      }
      
      public function get avatarEffectType() : int
      {
         return var_1414;
      }
      
      public function get avatarEffectDuration() : int
      {
         return var_1403;
      }
      
      public function get avatarEffectPermanent() : Boolean
      {
         return var_1404;
      }
   }
}
