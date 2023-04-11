package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1409
   {
       
      
      private var _offerId:int;
      
      private var var_983:String;
      
      private var var_928:Boolean;
      
      private var var_342:int;
      
      private var var_538:int;
      
      private var var_349:int;
      
      private var var_689:int;
      
      private var var_859:Boolean;
      
      private var var_924:Boolean;
      
      private var var_1375:Boolean;
      
      private var var_778:String;
      
      private var var_235:Vector.<package_8.class_1608>;
      
      public function class_1409(param1:IMessageDataWrapper)
      {
         var _loc2_:int = 0;
         super();
         _offerId = param1.readInteger();
         var_983 = param1.readString();
         var_928 = param1.readBoolean();
         var_342 = param1.readInteger();
         var_538 = param1.readInteger();
         var_349 = param1.readInteger();
         var_859 = param1.readBoolean();
         var _loc3_:int = param1.readInteger();
         var_235 = new Vector.<package_8.class_1608>(0);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_235.push(new package_8.class_1608(param1));
            _loc2_++;
         }
         var_689 = param1.readInteger();
         var_924 = param1.readBoolean();
         var_1375 = param1.readBoolean();
         var_778 = param1.readString();
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get localizationId() : String
      {
         return var_983;
      }
      
      public function get isRent() : Boolean
      {
         return var_928;
      }
      
      public function get priceInCredits() : int
      {
         return var_342;
      }
      
      public function get priceInActivityPoints() : int
      {
         return var_538;
      }
      
      public function get products() : Vector.<package_8.class_1608>
      {
         return var_235;
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
      
      public function get bundlePurchaseAllowed() : Boolean
      {
         return var_924;
      }
      
      public function get previewImage() : String
      {
         return var_778;
      }
   }
}
