package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class SnowWarGameTokenOffer
   {
       
      
      private var _offerId:int;
      
      private var var_983:String;
      
      private var var_342:int;
      
      private var var_538:int;
      
      private var var_349:int;
      
      private var var_689:int;
      
      private var var_859:Boolean;
      
      public function SnowWarGameTokenOffer(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_983 = param1.readString();
         var_342 = param1.readInteger();
         var_538 = param1.readInteger();
         var_349 = param1.readInteger();
         var_859 = false;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get localizationId() : String
      {
         return var_983;
      }
      
      public function get priceInCredits() : int
      {
         return var_342;
      }
      
      public function get priceInActivityPoints() : int
      {
         return var_538;
      }
      
      public function get activityPointType() : int
      {
         return var_349;
      }
      
      public function get clubLevel() : int
      {
         return var_689;
      }
      
      public function get giftable() : Boolean
      {
         return var_859;
      }
   }
}
