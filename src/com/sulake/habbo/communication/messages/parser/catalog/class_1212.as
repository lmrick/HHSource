package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1409;
   import package_8.class_1547;
   import package_8.class_1565;
   
   [SecureSWF(rename="true")]
   public class class_1212 implements IMessageParser
   {
       
      
      private var var_344:int;
      
      private var var_497:String;
      
      private var var_480:String;
      
      private var _localization:class_1547;
      
      private var _offers:Vector.<class_1409>;
      
      private var _offerId:int;
      
      private var var_375:Boolean;
      
      private var _frontPageItems:Vector.<class_1565>;
      
      public function class_1212()
      {
         super();
      }
      
      public function get pageId() : int
      {
         return var_344;
      }
      
      public function get catalogType() : String
      {
         return var_497;
      }
      
      public function get layoutCode() : String
      {
         return var_480;
      }
      
      public function get localization() : class_1547
      {
         return _localization;
      }
      
      public function get offers() : Vector.<class_1409>
      {
         return _offers;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get acceptSeasonCurrencyAsCredits() : Boolean
      {
         return var_375;
      }
      
      public function get frontPageItems() : Vector.<class_1565>
      {
         return _frontPageItems;
      }
      
      public function flush() : Boolean
      {
         var_344 = -1;
         var_497 = "";
         var_480 = "";
         _localization = null;
         _offers = new Vector.<class_1409>(0);
         _offerId = -1;
         var_375 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_344 = param1.readInteger();
         var_497 = param1.readString();
         var_480 = param1.readString();
         _localization = new class_1547(param1);
         _offers = new Vector.<class_1409>(0);
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _offers.push(new class_1409(param1));
            _loc3_++;
         }
         _offerId = param1.readInteger();
         var_375 = param1.readBoolean();
         if(param1.bytesAvailable)
         {
            _frontPageItems = new Vector.<class_1565>(0);
            _loc2_ = param1.readInteger();
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _frontPageItems.push(new class_1565(param1));
               _loc3_++;
            }
         }
         return true;
      }
   }
}
