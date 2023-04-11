package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import flash.utils.getTimer;
   
   [SecureSWF(rename="true")]
   public class class_1615
   {
       
      
      protected var var_247:int;
      
      protected var var_328:String;
      
      protected var var_271:int;
      
      protected var var_462:String;
      
      protected var _description:String;
      
      protected var var_350:String;
      
      protected var var_562:String;
      
      protected var var_343:String;
      
      protected var var_140:int;
      
      protected var _expirationTime:uint;
      
      protected var var_342:int;
      
      protected var var_538:int;
      
      protected var var_349:int;
      
      protected var var_236:Vector.<String>;
      
      protected var var_389:int;
      
      public function class_1615(param1:class_1615 = null)
      {
         super();
         if(param1 != null)
         {
            var_247 = param1.id;
            var_328 = param1.identifier;
            var_271 = param1.type;
            var_462 = param1.title;
            _description = param1.description;
            var_350 = param1.imageUrl;
            var_562 = param1.iconImageUrl;
            var_343 = param1.productCode;
            var_140 = param1.purchaseLimit;
            _expirationTime = param1.expirationTime;
            var_342 = param1.priceInCredits;
            var_538 = param1.priceInActivityPoints;
            var_349 = param1.activityPointType;
            var_236 = param1.subProductCodes;
            var_389 = param1.trackingState;
         }
      }
      
      public function parse(param1:IMessageDataWrapper) : class_1615
      {
         var _loc3_:int = 0;
         var_389 = param1.readInteger();
         var_247 = param1.readInteger();
         var_328 = param1.readString();
         var_343 = param1.readString();
         var_342 = param1.readInteger();
         var_538 = param1.readInteger();
         var_349 = param1.readInteger();
         var_140 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _expirationTime = _loc2_ > 0 ? _loc2_ * 1000 + getTimer() : 0;
         var_462 = param1.readString();
         _description = param1.readString();
         var_350 = param1.readString();
         var_562 = param1.readString();
         var_271 = param1.readInteger();
         var_236 = new Vector.<String>(0);
         var _loc4_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            var_236.push(param1.readString());
            _loc3_++;
         }
         return this;
      }
      
      public function purchased(param1:int) : void
      {
         var_140 -= param1;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get identifier() : String
      {
         return var_328;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get title() : String
      {
         return var_462;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get imageUrl() : String
      {
         return var_350;
      }
      
      public function get iconImageUrl() : String
      {
         return var_562;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get purchaseLimit() : int
      {
         return var_140;
      }
      
      public function get expirationTime() : int
      {
         return _expirationTime;
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
      
      public function get subProductCodes() : Vector.<String>
      {
         return var_236;
      }
      
      public function get trackingState() : int
      {
         return var_389;
      }
   }
}
