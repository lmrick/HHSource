package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import flash.utils.getTimer;
   
   [SecureSWF(rename="true")]
   public class class_1565
   {
      
      public static const const_48:int = 0;
      
      public static const const_234:int = 1;
      
      public static const const_114:int = 2;
       
      
      private var var_271:int;
      
      private var _position:int;
      
      private var _itemName:String;
      
      private var var_1043:String;
      
      private var var_1325:String;
      
      private var var_343:String;
      
      private var var_1314:int;
      
      private var _expirationTime:int;
      
      public function class_1565(param1:IMessageDataWrapper)
      {
         super();
         if(!param1)
         {
            return;
         }
         _position = param1.readInteger();
         _itemName = param1.readString();
         var_1043 = param1.readString();
         var_271 = param1.readInteger();
         switch(var_271)
         {
            case 0:
               var_1325 = param1.readString();
               break;
            case 1:
               var_1314 = param1.readInteger();
               break;
            case 2:
               var_343 = param1.readString();
         }
         var _loc2_:int = param1.readInteger();
         _expirationTime = _loc2_ > 0 ? _loc2_ * 1000 + getTimer() : 0;
      }
      
      public function get position() : int
      {
         return _position;
      }
      
      public function get itemName() : String
      {
         return _itemName;
      }
      
      public function get itemPromoImage() : String
      {
         return var_1043;
      }
      
      public function get cataloguePageLocation() : String
      {
         return var_1325;
      }
      
      public function get offerExpires() : Boolean
      {
         return _expirationTime > 0;
      }
      
      public function get secondsToExpiration() : int
      {
         return _expirationTime - getTimer();
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get productOfferID() : int
      {
         return var_1314;
      }
   }
}
